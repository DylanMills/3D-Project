Shader "Custom/Vertex"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}

        _DisplacementMap ("Displacment",2D)= "white" {}
        _DisplacementStrength ("Displacement Strength", Range(0,10)) = 1

        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
    {
        Pass
        {
           
        CGPROGRAM
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "UnityCG.cginc"
                // Physically based Standard lighting model, and enable shadows on all light types
        //#pragma surface surf Standard fullforwardshadows

       

        struct Input
        {
            float2 uv_MainTex;
        };

        struct appdata{
            float4 vertex : POSITION;
            float4 normal : NORMAL;
            float2 uv : TEXCOORD0;
        };


        struct v2f
        {
            float2 uv :TEXCOORD0;
            UNITY_FOG_COORDS(1)
            float4 vertex : SV_POSITION;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;
        sampler2D _MainTex;
        float4 _MainTex_ST;
        sampler2D _DisplacementMap;
       float _DisplacementStrength;


        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)


        v2f vert(appdata v){
                    v2f o;

                    o.uv = TRANSFORM_TEX(v.uv, _MainTex);
             float displacement = tex2Dlod(_DisplacementMap, float4(o.uv,0,0)).r;
            float4 temp = float4(v.vertex.x, v.vertex.y, v.vertex.z, 1.0);
            temp.xyz += displacement * v.normal * _DisplacementStrength;
            
            o.vertex = UnityObjectToClipPos(temp);
            
            UNITY_TRANSFER_FOG(o, o.vertex);
                    
            //float displacement = 0;
         
            return o;
        }

        fixed4 frag(v2f i ) : SV_Target{
            fixed4 col = tex2D(_MainTex, i.uv);
            UNITY_APPLY_FOG(i.fogCoord, col)
            return col;
           
        }
        ENDCG
   
    }

}}
