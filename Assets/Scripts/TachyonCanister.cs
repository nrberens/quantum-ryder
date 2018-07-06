using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TachyonCanister : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    private void OnTriggerEnter(Collider other)
    {
        if(other.CompareTag("Player"))
        {
            AddTachyonToTotal(1);
            Destroy(gameObject);
        }
    }

    void AddTachyonToTotal(int value)
    {
        GameController.gc.currentTachyons += value;
    }
}
