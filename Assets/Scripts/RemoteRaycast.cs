using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RemoteRaycast : MonoBehaviour
{
    RaycastHit hitInfo;
    // Start is called before the first frame update
    void Start()
    {
        
    }
    private float increment = 0.01f;
    // Update is called once per frame
    void Update()
    {
        Physics.Raycast(this.gameObject.transform.localPosition, this.gameObject.transform.forward, out hitInfo);
        Material CustomShaderMat = hitInfo.transform.gameObject.GetComponent<Renderer>().sharedMaterial;
        float shaderfloatVal = CustomShaderMat.GetFloat("_Transparancy");
        if (hitInfo.transform.gameObject.tag == "Shaded")
        {

            CustomShaderMat.SetFloat("_Transparancy", shaderfloatVal += increment);
            if (shaderfloatVal > 1.0f || shaderfloatVal < 0.0f)
            {
                
                increment *= -1;
            }


        }
    }
}
