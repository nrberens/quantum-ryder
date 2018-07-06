using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemySpawner : MonoBehaviour
{
    public float timeBetweenSpawns, minX, maxX;
    private float scale;
    private float timeSinceLastSpawn;
    public SpawnOnCylinder spawnOnCylinder;
    public Transform prefabToSpawn;

    public Transform[] jungleEnemyTypes = new Transform[6];
    public Transform[] desertEnemyTypes = new Transform[6];
    public Transform[] spaceEnemyTypes = new Transform[6];

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
            GetEnemyType();
            timeSinceLastSpawn = 0f;
            spawnOnCylinder.SpawnNewObject(prefabToSpawn, minX, maxX);
        }
    }

    void GetEnemyType()
    {
        switch(GameController.gc.currentLevel)
        {
            case 1:
                prefabToSpawn = jungleEnemyTypes[UnityEngine.Random.Range(0, jungleEnemyTypes.Length-1)];
                break;
            case 2:
                prefabToSpawn = desertEnemyTypes[UnityEngine.Random.Range(0, desertEnemyTypes.Length-1)];
                break;
            case 3:
                prefabToSpawn = spaceEnemyTypes[UnityEngine.Random.Range(0, spaceEnemyTypes.Length-1)];
                break;
        }
    }
}
