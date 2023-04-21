using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveUpDown : MonoBehaviour
{
    //dylan up down script
    [SerializeField] private float speed = 5.5f;
    bool moveUp = true;
    int n = 50;
    // Update is called once per frame
    void Update()
    {
        if (moveUp)
        {
            n++;
            transform.Translate(0, speed * Time.deltaTime,0);
            if (n > 100) {
                moveUp = false;
                    }
            
           
        }
        else
        {
            n--;
            transform.Translate(0, -speed * Time.deltaTime,0);
            if (n < 0)
            {
                moveUp = true;
            }
        }
    }
}