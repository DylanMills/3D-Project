Shader "Custom/Shadow-Shader"
{
    Properties
    {
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _ShadowColor ("ShadowColor", Color) = (0,0,0,1)
        _Intensity("Intensity",Range(0,1))=0.5
        _MainTex ("Base Texture", 2D) = "white" {}
        _ShadowTex ("Shadow Texture", 2D) = "white" {}
        _LineCount("Line Count",Float)=200
    }
    SubShader{
        
        Pass
        {
            Tags {"LightMode" = "ForwardBase"}

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fwdbase nolightmap nodirlightmap nodynlightmap novertexlight
            #include "UnityCG.cginc"
            #include "UnityLightingCommon.cginc"
        
            #include "Lighting.cginc"
            #include "AutoLight.cginc"
            struct appdata{
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 texcoord : TEXCOORD0;
            };

            struct v2f{
                float2 uv : TEXCOORD0;
                fixed4 diff : COLOR0;
                float4 pos : SV_POSITION;
                SHADOW_COORDS(1)
            };

            v2f vert(appdata v){
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = v.texcoord;

                half3 worldNormal = UnityObjectToWorldNormal(v.normal);
                half nl = max(0, dot(worldNormal, _WorldSpaceLightPos0.xyz));
                o.diff = nl * _LightColor0;
                TRANSFER_SHADOW(o);

                return o;
            }

            sampler2D _MainTex;
            sampler2D _ShadowTex;
            float4 _Color;
            float4 _ShadowColor;
            float _Intensity;
            float _LineCount;

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 baseColor = tex2D(_MainTex, i.uv) * _Color;
   
                fixed shadow = SHADOW_ATTENUATION(i); //1 when lit, 0 when shaded
                // baseColor.rgb *= i.diff; // default shadows

                fixed4 shadowTex = tex2D(_ShadowTex,i.uv*_LineCount);
         
               // fixed4 finalCol = baseColor - _Intensity*((shadowTex* _ShadowColor + shadowTex) * (1-shadow));
                fixed4 finalCol = baseColor * shadow + ((shadowTex * baseColor * _Intensity*_ShadowColor) * (1 - shadow));
                return finalCol;
            }
        ENDCG
        }

        
        Pass
        {
            Tags {"LightMode" = "ShadowCaster"}

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_shadowcaster
            #include "UnityCG.cginc"

            struct appdata{
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 texcoord : TEXCOORD0;
            };

            struct v2f{
                V2F_SHADOW_CASTER;
            };

            v2f vert(appdata v){
                v2f o;
                TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
                return o;
            }

            float4 frag(v2f i) : SV_Target{
            SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
}