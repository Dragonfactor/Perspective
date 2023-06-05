using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class walkThrough : MonoBehaviour
{
    // Start is called before the first frame update
    Rigidbody rb;

    void Start()
    {
        
    }

    // Update is called once per frame
    void OnTriggerEnter(Collider other)
    {
        rb = other.GetComponent<Rigidbody>();
        Renderer renderer = this.GetComponent<Renderer>();
        if (renderer != null && renderer.material.color.a > 0f)
        {
            rb.velocity = -rb.velocity;
        }
    }
}
