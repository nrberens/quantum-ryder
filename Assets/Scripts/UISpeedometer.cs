using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UISpeedometer: MonoBehaviour
{

    Image needle;
    RectTransform needleRect;
    float currentSpeed;
    public float speedCoefficient;
    RoadRotation roadRotation;

    // Use this for initialization
    void Start()
    {
        needle = GetComponent<Image>();
        needleRect = needle.GetComponent<RectTransform>();
        roadRotation = FindObjectOfType<RoadRotation>();
        currentSpeed = 0f;
    }

    // Update is called once per frame
    void OnGUI()
    {
        //currentSpeed = GetSpeedFromRotation();
        //rotate image around z axis
        //180 deg = 0mph
        //-90 = max speed
        //270 degrees difference
        float proportion = (roadRotation.rotateSpeed/25.0f) * 270;
        float currentNeedleAngle = 180f - proportion;
        needleRect.rotation = Quaternion.Euler(0, 0, currentNeedleAngle);
    }

    float GetSpeedFromRotation()
    {
        return roadRotation.rotateSpeed * speedCoefficient;
    }
}
