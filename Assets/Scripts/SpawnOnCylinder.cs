using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnOnCylinder : MonoBehaviour {

    public Transform worldCylinder;

    public void Start()
    {
        worldCylinder = FindObjectOfType<RoadRotation>().transform;
    }

    public void SpawnNewObject(Transform prefab, float minX, float maxX)
    {
        //Debug.Log(minX + " " + maxX);
        //repeat raycast until the cast hits the cylinder
        RaycastHit raycastHit;
        do
        {
            raycastHit = GetSpawnPointOnCylinder(minX, maxX);
        } while (!raycastHit.transform.CompareTag("World"));
        Vector3 spawnPoint = raycastHit.point;
        Vector3 normal = raycastHit.normal;
        SpawnObjectAtPointOnCylinder(prefab, spawnPoint, normal);
    }

    RaycastHit GetSpawnPointOnCylinder(float minX, float maxX)
    {
        //raycast from spawner to cylinder
        //first we get a vector from spawner to cylinder center
        //introduce an x offset based on what we're spawning (enemies, obstacles, props)
        //raycast along vector
        //get point on cylinder where raycast hits
        //spawn object there

        Vector3 dir = worldCylinder.transform.position - transform.position;
        float randomX = Random.Range(minX, maxX);
        dir += new Vector3(randomX, 0, 0);

        Debug.DrawRay(transform.position, dir, Color.blue, 3.0f);

        RaycastHit hit;

        if (Physics.Raycast(transform.position, dir, out hit, Mathf.Infinity))
        {
            return hit;   
        } else
        {
            throw new System.Exception("whoops, the raycast didn't hit the cylinder");
        }

    }

    void SpawnObjectAtPointOnCylinder(Transform prefab, Vector3 spawnPoint, Vector3 normal)
    {
        Transform newObj = Instantiate(prefab, spawnPoint, Quaternion.Euler(normal), worldCylinder);
        newObj.up = normal;
    }
}
