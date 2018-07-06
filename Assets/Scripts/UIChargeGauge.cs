using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIChargeGauge : MonoBehaviour {

    Image gauge;
    public float proportion;

	// Use this for initialization
	void Start () {
        gauge = GetComponent<Image>();
	}
	
	// Update is called once per frame
	void OnGUI() {
        proportion = (float)GameController.gc.currentTachyons / (float) GameController.gc.totalTachyonsNeeded;
        gauge.fillAmount = proportion;
	}
}
