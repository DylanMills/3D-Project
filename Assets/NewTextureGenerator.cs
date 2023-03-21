using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NewTextureGenerator : MonoBehaviour
{


    public ComputeShader TextureShader;
    private RenderTexture _rTexture;

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (!_rTexture == null)
        {
            _rTexture=new RenderTexture(Screen.width, Screen.height, 0, RenderTextureFormat.ARGB32, RenderTextureReadWrite.Linear);
            _rTexture.enableRandomWrite = true;
            _rTexture.Create();

            int kernel = TextureShader.FindKernel("CSMain");
            TextureShader.SetTexture(kernel, "Result", _rTexture);

            TextureShader.SetTexture(0, "Result", _rTexture);

            int workgroupsX = Mathf.CeilToInt(Screen.width/8.0f);
            int workgroupsY = Mathf.CeilToInt(Screen.height/8.0f);
        }
    }

    private void Start()
    {

    }
}
