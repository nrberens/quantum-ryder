using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BlinkingMat : MonoBehaviour {

    public MeshRenderer mr;
    public float frequency, currentTime;

	// Use this for initialization
	void Start () {
        mr = GetComponent<MeshRenderer>();	
	}
	
	// Update is called once per frame
	void Update () {

        currentTime += Time.deltaTime;

        if(currentTime > frequency)
        {
            currentTime = 0f;
            if (mr.enabled) mr.enabled = false;
            else mr.enabled = true;
        }
		
	}
}
