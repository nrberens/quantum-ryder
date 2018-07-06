using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIProgressSlider : MonoBehaviour {

    Slider slider;
    Text sliderText;
    float current, total;

    private void Start()
    {
        slider = GetComponent<Slider>();
        sliderText = GetComponentInChildren<Text>();
        ResetSlider();
    }

    // Update is called once per frame
    void Update () {
        slider.value = GameController.gc.timeRemaining;
        sliderText.text = ((int)slider.value).ToString();
	}

    public void ResetSlider()
    {
        slider.minValue = 0;
        slider.maxValue = GameController.gc.totalTimeBeforeJump;
        slider.value = slider.maxValue;
    }
}
