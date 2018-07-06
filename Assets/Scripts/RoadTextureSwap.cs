using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RoadTextureSwap : MonoBehaviour {

    public MeshRenderer mr;

    public Material desertRoad, desertSides, desertSkybox, jungleRoad, jungleSides, jungleSkybox, spaceRoad, spaceSides, spaceSkybox;

	// Use this for initialization
	void Awake () {
        mr = GetComponent<MeshRenderer>();	
	}

    private void Update()
    {
        if(Input.GetKeyDown(KeyCode.Alpha1))
        {
            SwapTextures(1);
        } else if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            SwapTextures(2);
        } else if (Input.GetKeyDown(KeyCode.Alpha3))
        {
            SwapTextures(3);
        }
    }

    public void SwapTextures(int level)
    {
        //materials[0] = road texture
        //materials[1] = sides texture
        Material[] mats = mr.materials;
        switch(level)
        {
            case 1:
                mats[0] = jungleRoad;
                mats[1] = jungleSides;
                RenderSettings.skybox = jungleSkybox;
                break;
            case 2:
                mats[0] = desertRoad;
                mats[1] = desertSides;
                RenderSettings.skybox = desertSkybox;
                break;
            case 3:
                mats[0] = spaceRoad;
                mats[1] = spaceSides;
                RenderSettings.skybox = spaceSkybox;
                break;
        }

        mr.materials = mats;
    }
}
