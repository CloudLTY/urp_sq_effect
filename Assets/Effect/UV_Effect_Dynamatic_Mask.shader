// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:False,nrmq:0,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.8088235,fgcg:0.7824097,fgcb:0.6720372,fgca:1,fgde:0.005,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:True,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34155,y:32473,varname:node_3138,prsc:2|emission-1193-OUT,alpha-9782-OUT,clip-7355-OUT;n:type:ShaderForge.SFN_Tex2d,id:7833,x:32352,y:32118,ptovrint:False,ptlb:Main Tex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-407-OUT;n:type:ShaderForge.SFN_TexCoord,id:8076,x:31514,y:32193,varname:node_8076,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:9985,x:32641,y:32676,ptovrint:False,ptlb:Mask Tex,ptin:_MaskTex,varname:_MaskTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-2745-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2745,x:32292,y:32625,varname:node_2745,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:1266,x:33096,y:32729,varname:node_1266,prsc:2|A-7833-A,B-9985-R;n:type:ShaderForge.SFN_Multiply,id:4525,x:33461,y:32396,varname:node_4525,prsc:2|A-6642-OUT,B-7552-RGB;n:type:ShaderForge.SFN_VertexColor,id:7552,x:33181,y:32495,varname:node_7552,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5537,x:33409,y:32716,varname:node_5537,prsc:2|A-7552-A,B-1266-OUT;n:type:ShaderForge.SFN_Multiply,id:4535,x:32908,y:32230,varname:node_4535,prsc:2|A-9434-OUT,B-7833-RGB;n:type:ShaderForge.SFN_ValueProperty,id:9434,x:32720,y:32063,ptovrint:False,ptlb:Main Tex Brightness,ptin:_MainTexBrightness,varname:_MainTexBrightness,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:3488,x:31208,y:31664,ptovrint:False,ptlb:Turbulence Tex,ptin:_TurbulenceTex,varname:_NormalTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:False|UVIN-1145-OUT;n:type:ShaderForge.SFN_Add,id:9326,x:31781,y:32281,varname:node_9326,prsc:2|A-8076-UVOUT,B-9450-OUT;n:type:ShaderForge.SFN_Add,id:407,x:32035,y:32072,varname:node_407,prsc:2|A-6613-OUT,B-9326-OUT;n:type:ShaderForge.SFN_Multiply,id:6613,x:31551,y:31993,varname:node_6613,prsc:2|A-3488-R,B-301-W;n:type:ShaderForge.SFN_TexCoord,id:775,x:30621,y:31404,varname:node_775,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:232,x:30664,y:31808,varname:node_232,prsc:2|A-6886-OUT,B-7882-T;n:type:ShaderForge.SFN_Time,id:7882,x:30372,y:31959,varname:node_7882,prsc:2;n:type:ShaderForge.SFN_Append,id:6886,x:30370,y:31679,varname:node_6886,prsc:2|A-2727-OUT,B-8873-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2727,x:30105,y:31601,ptovrint:False,ptlb:Turbulence Tex Panner X,ptin:_TurbulenceTexPannerX,varname:_NormalTexPannerX,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:8873,x:30105,y:31767,ptovrint:False,ptlb:Turbulence Tex Panner Y,ptin:_TurbulenceTexPannerY,varname:_NormalTexPannerY,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:1145,x:30973,y:31601,varname:node_1145,prsc:2|A-775-UVOUT,B-232-OUT;n:type:ShaderForge.SFN_TexCoord,id:301,x:30974,y:32395,varname:node_301,prsc:2,uv:1,uaff:True;n:type:ShaderForge.SFN_Multiply,id:1193,x:33714,y:32103,varname:node_1193,prsc:2|A-1550-RGB,B-4525-OUT;n:type:ShaderForge.SFN_Color,id:1550,x:33212,y:31833,ptovrint:False,ptlb:Main Color,ptin:_MainColor,varname:node_1550,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:9782,x:33908,y:32574,varname:node_9782,prsc:2|A-1550-A,B-5537-OUT;n:type:ShaderForge.SFN_Append,id:9450,x:31541,y:32469,varname:node_9450,prsc:2|A-301-U,B-301-V;n:type:ShaderForge.SFN_Add,id:7355,x:33309,y:32958,varname:node_7355,prsc:2|A-3488-R,B-4133-OUT;n:type:ShaderForge.SFN_Vector1,id:6401,x:31136,y:32775,varname:node_6401,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:4133,x:31541,y:32697,varname:node_4133,prsc:2|A-6401-OUT,B-301-Z;n:type:ShaderForge.SFN_Power,id:6642,x:33212,y:32063,varname:node_6642,prsc:2|VAL-4535-OUT,EXP-2723-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2723,x:32839,y:31849,ptovrint:False,ptlb:Main Tex Power,ptin:_MainTexPower,varname:node_2723,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Add,id:7896,x:31747,y:32480,varname:node_7896,prsc:2|A-7070-UVOUT,B-4754-OUT;n:type:ShaderForge.SFN_TexCoord,id:7070,x:31324,y:32380,varname:node_7070,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:4754,x:31324,y:32622,varname:node_4754,prsc:2|A-2234-U,B-2234-V;n:type:ShaderForge.SFN_TexCoord,id:2234,x:30692,y:32751,varname:node_2234,prsc:2,uv:1,uaff:True;proporder:1550-7833-9434-2723-9985-3488-2727-8873;pass:END;sub:END;*/

Shader "gf_shader/vfx/uv_effect_dynamatic_mask" {
    Properties {
         [HDR]_MainColor ("Main Color", Color) = (1,1,1,1)
        _MainTex ("Main Tex", 2D) = "white" {}
        _MainTexBrightness ("Main Tex Brightness", Float ) = 1
        _MainTexPower ("Main Tex Power", Float ) = 1
        _MaskTex ("Mask Tex", 2D) = "white" {}
        _TurbulenceTex ("Turbulence Tex", 2D) = "bump" {}
        _TurbulenceTexPannerX ("Turbulence Tex Panner X", Float ) = 0
        _TurbulenceTexPannerY ("Turbulence Tex Panner Y", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
		//[Enum(On,1,Off,0)] _ZWrite("ZWrite", Float) = 0
		_globeDayNightUse("_globeDayNightUse", Range(0,1)) = 0
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
            //#pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            //#pragma target 2.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _MaskTex; uniform float4 _MaskTex_ST;
            uniform float _MainTexBrightness;
            uniform sampler2D _TurbulenceTex; uniform float4 _TurbulenceTex_ST;
            uniform float _TurbulenceTexPannerX;
            uniform float _TurbulenceTexPannerY;
            uniform float4 _MainColor;
            uniform float _MainTexPower;

			uniform fixed4 globeEffectBright;
			fixed _globeDayNightUse;

            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 uv1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 node_7882 = _Time;
                float2 node_1145 = (i.uv0+(float2(_TurbulenceTexPannerX,_TurbulenceTexPannerY)*node_7882.g));
                float4 _TurbulenceTex_var = tex2D(_TurbulenceTex,TRANSFORM_TEX(node_1145, _TurbulenceTex));
                clip((_TurbulenceTex_var.r+(1.0-i.uv1.b)) - 0.5);
////// Lighting:
////// Emissive:
                float2 node_407 = ((_TurbulenceTex_var.r*i.uv1.a)+(i.uv0+float2(i.uv1.r,i.uv1.g)));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_407, _MainTex));
                float3 emissive = (_MainColor.rgb*(pow((_MainTexBrightness*_MainTex_var.rgb),_MainTexPower)*i.vertexColor.rgb));
                float3 finalColor = emissive;
                float4 _MaskTex_var = tex2D(_MaskTex,TRANSFORM_TEX(i.uv0, _MaskTex));
                return fixed4(finalColor * lerp(1, globeEffectBright, _globeDayNightUse),(_MainColor.a*(i.vertexColor.a*(_MainTex_var.a*_MaskTex_var.r))));
            }
            ENDCG
        }
    }
			// FallBack "SDG-Rendering/Fall_Back"//FallBack Off//FallBack "Diffuse"
    // CustomEditor "ShaderForgeMaterialInspector"
}
