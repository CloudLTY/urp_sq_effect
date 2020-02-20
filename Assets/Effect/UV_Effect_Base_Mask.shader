// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:False,nrmq:0,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.2352941,fgcg:0.5450981,fgcb:0.8,fgca:1,fgde:0.03,fgrn:6.76,fgrf:41.13,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:True,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34155,y:32473,varname:node_3138,prsc:2|emission-1193-OUT,alpha-9782-OUT,clip-3925-OUT;n:type:ShaderForge.SFN_Tex2d,id:7833,x:32074,y:32289,ptovrint:False,ptlb:Main Tex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-407-OUT;n:type:ShaderForge.SFN_TexCoord,id:8076,x:31184,y:32184,varname:node_8076,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:1218,x:31410,y:32441,varname:node_1218,prsc:2|A-752-OUT,B-2160-T;n:type:ShaderForge.SFN_Time,id:2160,x:31162,y:32580,varname:node_2160,prsc:2;n:type:ShaderForge.SFN_Append,id:752,x:31162,y:32392,varname:node_752,prsc:2|A-4159-OUT,B-1403-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4159,x:30889,y:32356,ptovrint:False,ptlb:Main Tex Panner X,ptin:_MainTexPannerX,varname:_MainTexPannerX,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:1403,x:30879,y:32522,ptovrint:False,ptlb:Main Tex Panner Y,ptin:_MainTexPannerY,varname:_MainTexPannerY,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Tex2d,id:9985,x:32550,y:33013,ptovrint:False,ptlb:Mask Tex,ptin:_MaskTex,varname:_MaskTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-514-OUT;n:type:ShaderForge.SFN_TexCoord,id:2745,x:32051,y:32837,varname:node_2745,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:1266,x:32897,y:32816,varname:node_1266,prsc:2|A-7833-A,B-9985-R;n:type:ShaderForge.SFN_Multiply,id:4525,x:33334,y:32399,varname:node_4525,prsc:2|A-14-OUT,B-7552-RGB;n:type:ShaderForge.SFN_VertexColor,id:7552,x:32769,y:32519,varname:node_7552,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5537,x:33334,y:32622,varname:node_5537,prsc:2|A-7552-A,B-1266-OUT;n:type:ShaderForge.SFN_Multiply,id:4535,x:32506,y:32321,varname:node_4535,prsc:2|A-9434-OUT,B-7833-RGB;n:type:ShaderForge.SFN_ValueProperty,id:9434,x:32284,y:32246,ptovrint:False,ptlb:Main Tex Brightness,ptin:_MainTexBrightness,varname:_MainTexBrightness,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:8336,x:32311,y:32047,ptovrint:False,ptlb:Main Tex Contrast,ptin:_MainTexContrast,varname:_MainTexContrast,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:3488,x:31231,y:31737,ptovrint:False,ptlb:Turbulence Tex,ptin:_TurbulenceTex,varname:_NormalTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:False|UVIN-1145-OUT;n:type:ShaderForge.SFN_Add,id:9326,x:31650,y:32255,varname:node_9326,prsc:2|A-8076-UVOUT,B-1218-OUT;n:type:ShaderForge.SFN_Add,id:407,x:31893,y:32121,varname:node_407,prsc:2|A-6613-OUT,B-9326-OUT;n:type:ShaderForge.SFN_Multiply,id:6613,x:31605,y:31900,varname:node_6613,prsc:2|A-3488-R,B-4976-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4976,x:31208,y:32062,ptovrint:False,ptlb:UV Effect Power,ptin:_UVEffectPower,varname:_UVEffectPower,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_TexCoord,id:775,x:30668,y:31571,varname:node_775,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:232,x:30706,y:31928,varname:node_232,prsc:2|A-6886-OUT,B-7882-T;n:type:ShaderForge.SFN_Time,id:7882,x:30422,y:32162,varname:node_7882,prsc:2;n:type:ShaderForge.SFN_Append,id:6886,x:30436,y:31880,varname:node_6886,prsc:2|A-2727-OUT,B-8873-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2727,x:30052,y:31886,ptovrint:False,ptlb:Normal Tex Panner X,ptin:_NormalTexPannerX,varname:_NormalTexPannerX,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:8873,x:30033,y:32034,ptovrint:False,ptlb:Normal Tex Panner Y,ptin:_NormalTexPannerY,varname:_NormalTexPannerY,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:1145,x:30983,y:31737,varname:node_1145,prsc:2|A-775-UVOUT,B-232-OUT;n:type:ShaderForge.SFN_Multiply,id:7151,x:31823,y:33188,varname:node_7151,prsc:2|A-7319-OUT,B-6409-T;n:type:ShaderForge.SFN_Time,id:6409,x:31566,y:33366,varname:node_6409,prsc:2;n:type:ShaderForge.SFN_Append,id:7319,x:31400,y:33125,varname:node_7319,prsc:2|A-6683-OUT,B-9380-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6683,x:31055,y:32970,ptovrint:False,ptlb:Mask Tex Panner X,ptin:_MaskTexPannerX,varname:_MaskTexPannerX,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:9380,x:31083,y:33092,ptovrint:False,ptlb:Mask Tex Panner Y,ptin:_MaskTexPannerY,varname:_MaskTexPannerY,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:514,x:32316,y:33030,varname:node_514,prsc:2|A-2745-UVOUT,B-7151-OUT;n:type:ShaderForge.SFN_Power,id:14,x:32961,y:32216,varname:node_14,prsc:2|VAL-4535-OUT,EXP-8336-OUT;n:type:ShaderForge.SFN_Multiply,id:1193,x:33626,y:32244,varname:node_1193,prsc:2|A-1550-RGB,B-4525-OUT;n:type:ShaderForge.SFN_Color,id:1550,x:33306,y:32251,ptovrint:False,ptlb:Main Color,ptin:_MainColor,varname:node_1550,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:9782,x:33720,y:32560,varname:node_9782,prsc:2|A-1550-A,B-5537-OUT;n:type:ShaderForge.SFN_Add,id:3925,x:33487,y:33207,varname:node_3925,prsc:2|A-3488-R,B-3979-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3979,x:32680,y:33291,ptovrint:False,ptlb:Dis,ptin:_Dis,varname:node_3979,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:1550-7833-9434-4159-1403-8336-9985-6683-9380-3488-4976-2727-8873-3979;pass:END;sub:END;*/

Shader "VFX/UV_Effect_Base_Mask" {
    Properties {
		 [HDR]_MainColor ("Main Color", Color) = (1,1,1,1)
        _MainTex ("Main Tex", 2D) = "white" {}
        _MainTexBrightness ("Main Tex Brightness", Float ) = 1
        _MainTexPannerX ("Main Tex Panner X", Float ) = 0
        _MainTexPannerY ("Main Tex Panner Y", Float ) = 0
        _MainTexContrast ("Main Tex Contrast", Float ) = 1
        _MaskTex ("Mask Tex", 2D) = "white" {}
        _MaskTexPannerX ("Mask Tex Panner X", Float ) = 0
        _MaskTexPannerY ("Mask Tex Panner Y", Float ) = 0
        _TurbulenceTex ("Turbulence Tex", 2D) = "bump" {}
        _UVEffectPower ("UV Effect Power", Float ) = 0
        _NormalTexPannerX ("Normal Tex Panner X", Float ) = 0
        _NormalTexPannerY ("Normal Tex Panner Y", Float ) = 0
        _Dis ("Dis", Float ) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
		//[Enum(On,1,Off,0)] _ZWrite("ZWrite", Float) = 0
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "ForwardLit"
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
			ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            //#pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 2.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _MainTexPannerX;
            uniform float _MainTexPannerY;
            uniform sampler2D _MaskTex; uniform float4 _MaskTex_ST;
            uniform float _MainTexBrightness;
            uniform float _MainTexContrast;
            uniform sampler2D _TurbulenceTex; uniform float4 _TurbulenceTex_ST;
            uniform float _UVEffectPower;
            uniform float _NormalTexPannerX;
            uniform float _NormalTexPannerY;
            uniform float _MaskTexPannerX;
            uniform float _MaskTexPannerY;
            uniform float4 _MainColor;
            uniform float _Dis;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 node_7882 = _Time;
                float2 node_1145 = (i.uv0+(float2(_NormalTexPannerX,_NormalTexPannerY)*node_7882.g));
                float4 _TurbulenceTex_var = tex2D(_TurbulenceTex,TRANSFORM_TEX(node_1145, _TurbulenceTex));
                clip((_TurbulenceTex_var.r+_Dis) - 0.5);
////// Lighting:
////// Emissive:
                float4 node_2160 = _Time;
                float2 node_407 = ((_TurbulenceTex_var.r*_UVEffectPower)+(i.uv0+(float2(_MainTexPannerX,_MainTexPannerY)*node_2160.g)));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_407, _MainTex));
                float3 emissive = (_MainColor.rgb*(pow((_MainTexBrightness*_MainTex_var.rgb),_MainTexContrast)*i.vertexColor.rgb));
                float3 finalColor = emissive;
                float4 node_6409 = _Time;
                float2 node_514 = (i.uv0+(float2(_MaskTexPannerX,_MaskTexPannerY)*node_6409.g));
                float4 _MaskTex_var = tex2D(_MaskTex,TRANSFORM_TEX(node_514, _MaskTex));
                return fixed4(finalColor,(_MainColor.a*(i.vertexColor.a*(_MainTex_var.a*_MaskTex_var.r))));
            }
            ENDCG
        }
    }
			// FallBack "SDG-Rendering/Fall_Back"//FallBack Off//FallBack "Diffuse"
    // CustomEditor "ShaderForgeMaterialInspector"
}
