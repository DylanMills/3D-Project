
# Project Name
 
 #### Dylan Mills 100750193 | Final Exam

![Preview](https://raw.githubusercontent.com/DylanMills/3D-Project/main/Images/screenshot1.png)
![Preview](https://raw.githubusercontent.com/DylanMills/3D-Project/main/Images/screenshot2.png)

## Water


![MuddyWater](https://raw.githubusercontent.com/DylanMills/3D-Project/main/Images/muddywater.png)


-  The water works by using the time variable to modulate the sine wave which displaces the vertices in the vertex shader. 
-  The muddy tint is strongest at the lower wave height. At the high waveheight the blue texture is more visible
```   
void vert (inout appdata v, out Input o){
UNITY_INITIALIZE_OUTPUT(Input,o);
float t = _Time * _Speed;
float waveHeight = sin(t+v.vertex.x * _Freq)*_Amp+sin(t*2+v.vertex.x*_Freq*2)*_Amp;
v.vertex.y+=waveHeight;
v.normal=normalize(float3(v.normal.x+waveHeight,v.normal.y,v.normal.z));
o.vertColor=(waveHeight)+_Tint*1.5;

}
```
        
## Bloom
-  Adjusted parameters
-  Bloom works by sampling the brightness and using that data to affect the brightness of surrounding pixels. The threshold affects the minimum brightness required to make the bloom effect
-  Press 1 to toggle
```     
            		Interpolators VertexProgram (VertexData v) {
			Interpolators i;
			i.pos = UnityObjectToClipPos(v.vertex);
			i.uv = v.uv;
			return i;
		}
		
		half3 Sample(float2 uv) {
			return tex2D(_MainTex, uv).rgb;
		}

		half3 SampleBox(float2 uv, float delta) {
			float4 o = _MainTex_TexelSize.xyxy * float2(-delta, delta).xxyy;
			half3 s =
				Sample(uv + o.xy) + Sample(uv + o.zy) +
				Sample(uv + o.xw) + Sample(uv + o.zw);
			return s * 0.25f;
		}

		half3 Prefilter(half3 c) {
			half brightness = max(c.r, max(c.g, c.b));
			half contribution = max(0, brightness - _Threshold);
			contribution /= max(brightness, 0.00001);
			return c * contribution;
		}
```


## Download

You can [download](https://github.com/DylanMills/3D-Project/releases/tag/release) the build here.


## Credits

This software uses the following external assets:

- [Turtle](https://giphy.com/stickers/xbox-xbox-series-x-s-tmnt-shredders-revenge-9msfv3VpgY31OcFXta)
- [Brickwall](https://opengameart.org/content/brick-wall)
- [Water](https://www.textures4photoshop.com/tex/water-and-liquid/water-pool-texture-seamless-and-free.aspx)
