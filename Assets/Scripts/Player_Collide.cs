using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player_Collide : MonoBehaviour {

    //On collision,
    //Slow down player (i.e. cylinder rotation)
    //Shake camera
    //Play sound effect

    public float duration, severity, postCollisionSpeed, prevShakeAmount;
    public RoadRotation road;
    public BikeShake bikeShake;
    public CameraShake cameraShake;

	// Use this for initialization
	void Start () {
        road = FindObjectOfType<RoadRotation>();
        bikeShake = FindObjectOfType<BikeShake>();
        cameraShake = FindObjectOfType<CameraShake>();
	}
	
	// Update is called once per frame
	void Update () {

	}

    public void BeginCollision()
    {
        Debug.Log("COLLISIONS ARE FAKE NEWS");
        road.rotateSpeed = postCollisionSpeed;
        bikeShake.shakeAmount = severity;
        bikeShake.shakeDuration = duration;
        cameraShake.shakeDuration = duration;
        cameraShake.shakeAmount = severity * 0.1f;
    }

    private void OnTriggerEnter(Collider other)
    {
        if(other.CompareTag("Object"))
        {
            BeginCollision();
        }
    }
}
