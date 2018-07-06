using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PropSpawner: MonoBehaviour
{
    public float timeBetweenSpawns, minX, maxX;
    private float scale;
    private float timeSinceLastSpawn;
    public SpawnOnCylinder spawnOnCylinder;
    public Transform prefabToSpawn;

    public Transform[] junglePropTypes = new Transform[6];
    public Transform[] desertPropTypes = new Transform[6];
    public Transform[] spacePropTypes = new Transform[6];

    // Use this for initialization
    void Start()
    {
        timeSinceLastSpawn = 0;
        spawnOnCylinder = GetComponent<SpawnOnCylinder>();
    }

    // Update is called once per frame
    void Update()
    {
        timeSinceLastSpawn += Time.deltaTime;

        if (timeSinceLastSpawn >= timeBetweenSpawns)
        {
            GetPropType();
            timeSinceLastSpawn = 0f;
            int side = (int)UnityEngine.Random.Range(0, 100);
            if(side > 50)
            {
                minX *= -1.0f;
                maxX *= -1.0f;
            }
            //Debug.Log(minX + " " + maxX);
            spawnOnCylinder.SpawnNewObject(prefabToSpawn, minX, maxX);
        }
    }

    void GetPropType()
    {
        switch (GameController.gc.currentLevel)
        {
            case 1:
                prefabToSpawn = junglePropTypes[UnityEngine.Random.Range(0, junglePropTypes.Length-1)];
                break;
            case 2:
                prefabToSpawn = desertPropTypes[UnityEngine.Random.Range(0, desertPropTypes.Length-1)];
                break;
            case 3:
                prefabToSpawn = spacePropTypes[UnityEngine.Random.Range(0, spacePropTypes.Length-1)];
                break;
        }
    }
}
