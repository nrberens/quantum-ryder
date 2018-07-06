using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerSounds : MonoBehaviour {

    public AudioSource source;
    public AudioClip engine;
    public RoadRotation road;

	// Use this for initialization
	void Start () {
        source = GetComponent<AudioSource>();
        road = FindObjectOfType<RoadRotation>();
            source.clip = engine;
	}
	
	// Update is called once per frame
	void Update () {
        source.pitch = 0.75f * (road.rotateSpeed * 0.075f);
        if(!source.isPlaying && road.rotateSpeed > 0)
        {
            source.Play();

        }
	}
}
