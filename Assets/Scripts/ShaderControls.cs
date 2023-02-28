using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShaderControls : MonoBehaviour
{
    [SerializeField] Material[] mats;

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            SwapTo(1);
        }
        else if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            SwapTo(2);
        }
        else if (Input.GetKey(KeyCode.Alpha3))
        {
            SwapTo(3);
        }
        else if (Input.GetKey(KeyCode.Alpha4))
        {
            SwapTo(4);
        }

    }

    void SwapTo(int index)
    {
        this.gameObject.GetComponent<Renderer>().material = mats[index - 1];
    }


}
