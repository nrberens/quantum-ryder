using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DestroyOutOfSight : MonoBehaviour {

    private void OnTriggerEnter(Collider other)
    {
        if(other.CompareTag("Object"))
        {
            Destroy(other.gameObject);
        }
    }
}
