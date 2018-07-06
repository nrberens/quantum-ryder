using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObstacleSpawner: MonoBehaviour
{
    public float timeBetweenSpawns, minX, maxX;
    private float scale;
    private float timeSinceLastSpawn;
    public SpawnOnCylinder spawnOnCylinder;
    public Transform prefabToSpawn;

    public Transform[] jungleObstacleTypes = new Transform[6];
    public Transform[] desertObstacleTypes = new Transform[6];
    public Transform[] spaceObstacleTypes = new Transform[6];

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
            GetObstacleType();
            timeSinceLastSpawn = 0f;
            spawnOnCylinder.SpawnNewObject(prefabToSpawn, minX, maxX);
        }
    }

    void GetObstacleType()
    {
        switch (GameController.gc.currentLevel)
        {
            case 1:
                prefabToSpawn = jungleObstacleTypes[UnityEngine.Random.Range(0, jungleObstacleTypes.Length-1)];
                break;
            case 2:
                prefabToSpawn = desertObstacleTypes[UnityEngine.Random.Range(0, desertObstacleTypes.Length-1)];
                break;
            case 3:
                prefabToSpawn = spaceObstacleTypes[UnityEngine.Random.Range(0, spaceObstacleTypes.Length-1)];
                break;
        }
    }
}
