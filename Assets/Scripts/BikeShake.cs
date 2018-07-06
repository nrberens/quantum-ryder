using UnityEngine;
using System.Collections;

public class BikeShake: MonoBehaviour
{
    // Transform of the camera to shake. Grabs the gameObject's transform
    // if null.
    public Transform bikeImageTransform;

    // How long the object should shake for.
    public float shakeDuration = 0f;

    // Amplitude of the shake. A larger value shakes the camera harder.
    public float shakeAmount = 0.7f;
    public float baselineShakeAmount;
    public float decreaseFactor = 1.0f;

    Vector3 originalPos;

    void Awake()
    {
        if (bikeImageTransform == null)
        {
            bikeImageTransform = GetComponent(typeof(Transform)) as Transform;
        }
    }

    void OnEnable()
    {
        originalPos = bikeImageTransform.localPosition;
    }

    void Update()
    {
        if (shakeDuration > 0)
        {
            bikeImageTransform.localPosition = originalPos + Random.insideUnitSphere * shakeAmount;

            shakeDuration -= Time.deltaTime * decreaseFactor;
        }
        else
        {
            //shakeDuration = 0f;
            //bikeImageTransform.localPosition = originalPos;
            shakeDuration = Mathf.Infinity;
            shakeAmount = baselineShakeAmount;
        }
    }
}