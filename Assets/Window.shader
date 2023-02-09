Shader "Window"
{
    Properties
    {

     //   _MainTex("Diffuse", 2D) = "white" {}


    }
        SubShader
    {
Tags {
   "Queue" = "Geometry-1" // gets to the stencil buffer first
}

ColorMask 0   // do not draw this (it's a hole!)
ZWrite off    // the hole has no depth  

Stencil {
    Ref 1        // write a 1 into the buffer
    Comp always  // comparison for what is already there.
    Pass replace // Replace anything in the frame buffer with this pixel pass.
}
        CGPROGRAM

        #pragma surface surf Lambert


        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };
        void surf(Input IN, inout SurfaceOutput o)
        {
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
      //      o.Albedo = c.rgb;
        }
        ENDCG
    }
        FallBack "Diffuse"
}
