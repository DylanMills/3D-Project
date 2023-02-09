Shader "Custom/Decal"
{
    Properties
    {

        _MainTex ("Base Texture", 2D) = "white" {}

            _DecalTex("Decal",2D) = "white"{}
    }
    SubShader
    {
        Tags { "Queue"="Geometry" }
        LOD 200

        CGPROGRAM

        #pragma surface surf Lambert


        sampler2D _MainTex;
        sampler2D _DecalTex;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_DecalTex;
        };
        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 a = tex2D(_MainTex, IN.uv_MainTex);
            fixed4 b = tex2D(_DecalTex, IN.uv_DecalTex);
            o.Albedo = b.rgb * a.rgb;
            o.Albedo = b.g >0.4 ? b.rgb : a.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
