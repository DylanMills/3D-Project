Shader "Custom/Rim"
{
    Properties
    {
        _RimPower ("Rim Power", Range(0,10))=1
         _RimColor ("Rim Color", Color) = (1, 0, 0, 1)
        _Color ("Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float3 viewDir;
        };
        fixed4 _Color;
        fixed4 _RimColor;
        float _RimPower;
        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            half rim = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Albedo=_Color;
         //   o.Albedo += pow(rim, _RimPower);
            o.Emission = _RimColor.rgb * pow(rim, _RimPower) * 10;
           // fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            //o.Albedo = c.rgb;
            // Metallic and smoothness come from slider variables
          //  o.Metallic = _Metallic;
        //    o.Smoothness = _Glossiness;
        //    o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
