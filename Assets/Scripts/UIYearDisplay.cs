using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIYearDisplay : MonoBehaviour {

    Text text; 

	// Use this for initialization
	void Start () {
        text = GetComponent<Text>();
		
	}
	
	// Update is called once per frame
	void Update () {
	    switch(GameController.gc.currentLevel)
        {
            case 1:
                text.text = "65000000 BC";
                break;
            case 2:
                text.text = "1973 AD";
                break;
            case 3:
                text.text = "309X AD";
                break;
        }
	}
}
