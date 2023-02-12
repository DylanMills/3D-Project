using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class CameraController : MonoBehaviour
{
    public GameObject player;
    public float sensitivity = 3.0f;

    void Update()
    {
        float rotateHorizontal = Input.GetAxis("Mouse X");
        //   float rotateVertical = Input.GetAxis("Mouse Y");
        // Align to player position
        transform.position = player.transform.position;
        // transform.Rotate(-Vector3.right * rotateVertical * sensitivity * Time.deltaTime * 100);
        transform.Rotate(Vector3.up * rotateHorizontal * sensitivity * Time.deltaTime * 100);
    }
}