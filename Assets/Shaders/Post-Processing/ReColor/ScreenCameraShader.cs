using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class ScreenCameraShader : MonoBehaviour
{
    public Shader awesomeShader = null;
    public Material m_renderMaterial;


    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, m_renderMaterial);
    }
}
