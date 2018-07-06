using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RoadRotation : MonoBehaviour {

    public float rotateSpeed;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {

        transform.RotateAround(Vector3.zero, -Vector3.right, Time.deltaTime * rotateSpeed);

	}
}
