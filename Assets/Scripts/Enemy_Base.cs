using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Enemy_Base : MonoBehaviour {

    public float minX, maxX, scale;
    private Material billboardMat;

	// Use this for initialization
	void Start () {
        transform.localScale = new Vector3(scale, scale, scale);
        billboardMat = GetComponentInChildren<Renderer>().materials[0];
        billboardMat.SetFloat("_ScaleX", scale);
        billboardMat.SetFloat("_ScaleY", scale);
        GetComponentInChildren<Renderer>().materials[0] = billboardMat;
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
