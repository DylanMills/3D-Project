
# Project Name
 
 #### Dylan Mills 100750193 | Final Exam

 ## Forward and Deferred Rendering
![Rendering](https://raw.githubusercontent.com/DylanMills/Jaws/main/Images/RenderingDiagram.png)

## Additions


* Replaced Skybox
* Added movement
* Created scene
* Optimized meshes to reduce file size
* Reworked all materials, and shaders to match the project requirements
* Completely revamped wave shader
* Square shaped wave is possible via the following snippet(read the comments!)
```   

```
        
* Bloom
-  Adjusted parameters
* Outlining
-  Adjusted parameter margins
-  Added better color controls
-  Added functional color tinting
-  Various optimizations for improved performance
* Hologram
- Making use of Rim Shading to create phantom Sharks
```     
            
```
![Rendering](https://raw.githubusercontent.com/DylanMills/Jaws/main/Images/RimDiagram.png)

## Snippets
### Downsample Script
* This script downsamples using mipmapping
* It creates a new render texture at the destination parameter
* This is useful for optimizing graphics operations.
* Mipmapping allows for the renderer to use less detailed textures when the texel / pixel size diffent is high.
```

```
### Colored Shadow:
* This is a surface shader which uses a lambert lighting with a toon ramp
* It takes ShadowColor as a parameter which is used to color the dark areas of the surface
* This great for games with a simple art-style that wants to have a unique, stylized shadow color. 

```

  ```
## Download

You can [download](https://github.com/DylanMills/Jaws/releases/tag/release) the build here.


## Credits

This software uses the following external assets:

- [Skybox](https://assetstore.unity.com/packages/2d/textures-materials/sky/skybox-series-free-103633)
- [Shark](https://www.cgtrader.com/items/24982/download-page)
- [Ship](https://www.cgtrader.com/items/2712314/download-page)