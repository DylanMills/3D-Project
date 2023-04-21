  Shader "Dylan/Wall" {
    Properties {
      _MainTex ("Texture", 2D) = "white" {}
      _BumpMap ("Bumpmap", 2D) = "bump" {}
      _DecalTex ("Decal", 2D) = "decal" {}
    }
    SubShader {
      Tags { "RenderType" = "Opaque" }
      CGPROGRAM

      #pragma surface surf BlinnPhong 

      struct Input {
        float2 uv_MainTex;
        float2 uv_BumpMap;
        float2 uv_DecalTex;
      };


      sampler2D _MainTex;
      sampler2D _BumpMap;
      sampler2D _DecalTex;
     

      void surf (Input IN, inout SurfaceOutput o) {
                  fixed4 a = tex2D(_MainTex, IN.uv_MainTex);
            fixed4 b = tex2D(_DecalTex, IN.uv_DecalTex);
            o.Albedo = b.rgb * a.rgb;
            o.Albedo = b.g <0.4 ? 0.8*a.rgb : a.rgb;
        
        o.Normal = UnpackNormal (tex2D (_BumpMap, IN.uv_BumpMap));
      }

      ENDCG
    } 
    Fallback "Diffuse"
  }