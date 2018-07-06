using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerControl : MonoBehaviour {

    private RoadRotation road;
    private BikeShake bikeShake;
    public float turnRate;
    public Transform cameraTransform;
    Quaternion initRot;
    float currentAngle;
    public float leanAngle;
    public float leanAngleRate;
    private float leanAngleDelta;
    public float maxSpeed, minSpeed, accelerateRate, decelerateRate;

    // Use this for initialization
    void Start () {
        cameraTransform = Camera.main.transform;
        initRot = cameraTransform.localRotation;
        road = FindObjectOfType<RoadRotation>();
        bikeShake = FindObjectOfType<BikeShake>();
    }

    // Update is called once per frame
    void Update() {
        if(GameController.gc.currentGameState == GameController.GameState.InLevel)
        {
            currentAngle = Quaternion.Angle(initRot, cameraTransform.localRotation);

            if (Input.GetButton("Accelerate"))
            {
                road.rotateSpeed += accelerateRate * Time.deltaTime;
                bikeShake.shakeAmount = 1.5f;
            }
            else if (Input.GetButton("Decelerate"))
            {
                road.rotateSpeed -= decelerateRate * Time.deltaTime;
                bikeShake.shakeAmount = 1.0f;
            } else
            {
            }

            road.rotateSpeed = Mathf.Clamp(road.rotateSpeed, minSpeed, maxSpeed);
            
            float currentTurnRate = turnRate * (road.rotateSpeed*0.1f);

            if (Input.GetAxis("Horizontal") > 0)    //Go right 
            {
                transform.Translate(Vector3.right * currentTurnRate);
                
                if (currentAngle < leanAngle)
                {
                    leanAngleDelta = leanAngleRate * Time.deltaTime;
                    Quaternion newRot = Quaternion.Euler(0, 0, -leanAngleDelta);
                    cameraTransform.localRotation = cameraTransform.localRotation * newRot;
                }

            } else if (Input.GetAxis("Horizontal") < 0) //Go left
            {
                transform.Translate(Vector3.left * currentTurnRate);

                if (currentAngle < leanAngle)
                {
                    leanAngleDelta = leanAngleRate * Time.deltaTime;
                    Quaternion newRot = Quaternion.Euler(0, 0, leanAngleDelta);
                    cameraTransform.localRotation = cameraTransform.localRotation * newRot;
                }
            }
            else
            {
                leanAngleDelta = leanAngleRate * Time.deltaTime;
                Quaternion newRot = Quaternion.RotateTowards(cameraTransform.localRotation, initRot, leanAngleDelta);
                cameraTransform.localRotation = newRot;
            }
            }
            
	}
}
