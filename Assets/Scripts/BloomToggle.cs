using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BloomToggle : MonoBehaviour
{
    [SerializeField] GameObject bloom;

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
          bloom.GetComponent<Bloom>().enabled = !bloom.GetComponent<Bloom>().isActiveAndEnabled;
        }

    }



}
