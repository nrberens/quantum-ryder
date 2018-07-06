using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TachyonSpawner: MonoBehaviour
{
    public float timeBetweenSpawns, minX, maxX;
    private float scale;
    private float timeSinceLastSpawn;
    public SpawnOnCylinder spawnOnCylinder;
    public Transform tachyonCan;

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
            timeSinceLastSpawn = 0f;
            spawnOnCylinder.SpawnNewObject(tachyonCan, minX, maxX);
        }
    }
}
