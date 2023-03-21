using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
[ExecuteInEditMode, ImageEffectAllowedInSceneView]
public class DepthOfField : MonoBehaviour
{
    public Shader dofShader;

    private const int circleOfConfusionPass = 0;

    [NonSerialized]
    Material dofMaterial;

    [SerializeField, Range(0.1f, 100f)] private float focusDistance;
    [SerializeField, Range(0.1f, 10f)] private float focusRange;

    private readonly int focusDistID = Shader.PropertyToID("_FocusDistance");
    private readonly int focusRangeID = Shader.PropertyToID("_FocusRange");

    void OnRenderImage(RenderTexture source, RenderTexture
        destination)
    {
        if (dofMaterial == null)
        {
            dofMaterial = new Material(dofShader)
            {
                hideFlags = HideFlags.HideAndDontSave
            };
        }

        dofMaterial.SetFloat(focusDistID, focusDistance);
        dofMaterial.SetFloat(focusRangeID, focusRange);

        Graphics.Blit(source, destination, dofMaterial, circleOfConfusionPass);
    }
}