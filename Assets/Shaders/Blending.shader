Shader "Dylan/Blending"
{
    Properties
    {
      
        _MainTex ("Texture", 2D) = "white" {}

    }
    SubShader
    {
        Tags { "Queue"="Transparent" }
       // Blend One One   
     //   Blend SrcAlpha OneMinusSrcAlpha
        Blend DstColor Zero
Pass{
            SetTexture[_MainTex]{combine texture}
}
    }
    FallBack "Diffuse"
}
