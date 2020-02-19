// Shader created with Shader Forge v1.38
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:False,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.7352941,fgcg:0.8685599,fgcb:1,fgca:1,fgde:0.025,fgrn:5,fgrf:5.01,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:True,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33384,y:32890,varname:node_3138,prsc:2|emission-7659-OUT;n:type:ShaderForge.SFN_Tex2d,id:9985,x:31951,y:32898,ptovrint:False,ptlb:Main Tex,ptin:_MainTex,varname:_MaskTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-514-OUT;n:type:ShaderForge.SFN_TexCoord,id:2745,x:30915,y:32411,varname:node_2745,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ValueProperty,id:9434,x:32087,y:32400,ptovrint:False,ptlb:Brightness,ptin:_Brightness,varname:_MainTexBrightness,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:7151,x:31084,y:32716,varname:node_7151,prsc:2|A-7319-OUT,B-6409-T;n:type:ShaderForge.SFN_Time,id:6409,x:30906,y:32836,varname:node_6409,prsc:2;n:type:ShaderForge.SFN_Append,id:7319,x:30892,y:32642,varname:node_7319,prsc:2|A-6683-OUT,B-9380-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6683,x:30605,y:32575,ptovrint:False,ptlb:Main Panner X,ptin:_MainPannerX,varname:_MaskTexPannerX,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:9380,x:30605,y:32716,ptovrint:False,ptlb:Main Panner Y,ptin:_MainPannerY,varname:_MaskTexPannerY,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:514,x:31380,y:32660,varname:node_514,prsc:2|A-2745-UVOUT,B-7151-OUT;n:type:ShaderForge.SFN_Color,id:1550,x:32087,y:32195,ptovrint:False,ptlb:Main Color,ptin:_MainColor,varname:node_1550,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:6814,x:32734,y:32576,varname:node_6814,prsc:2|A-1550-RGB,B-9434-OUT,C-1348-OUT,D-8297-RGB;n:type:ShaderForge.SFN_VertexColor,id:8297,x:32009,y:33264,varname:node_8297,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2375,x:32759,y:33071,varname:node_2375,prsc:2|A-1550-A,B-9985-A,C-8297-A;n:type:ShaderForge.SFN_Power,id:1348,x:32124,y:32753,varname:node_1348,prsc:2|VAL-9985-RGB,EXP-7097-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7097,x:31863,y:32671,ptovrint:False,ptlb:Contrast,ptin:_Contrast,varname:node_7097,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:7659,x:33007,y:32805,varname:node_7659,prsc:2|A-6814-OUT,B-2375-OUT;proporder:9434-7097-1550-9985-6683-9380;pass:END;sub:END;*/

Shader "VFX/add" {
    Properties {
        _Brightness ("Brightness", Float ) = 1
        _Contrast ("Contrast", Float ) = 1
        [HDR]_MainColor ("Main Color", Color) = (1,1,1,1)
        _MainTex ("Main Tex", 2D) = "white" {}
        _MainPannerX ("Main Panner X", Float ) = 0
        _MainPannerY ("Main Panner Y", Float ) = 0
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            Cull Off
            ZWrite Off

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma target 2.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Brightness;
            uniform float _MainPannerX;
            uniform float _MainPannerY;
            uniform float4 _MainColor;
            uniform float _Contrast;
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
////// Lighting:
////// Emissive:
                float4 node_6409 = _Time;
                float2 node_514 = (i.uv0+(float2(_MainPannerX,_MainPannerY)*node_6409.g));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_514, _MainTex));
                float3 emissive = ((_MainColor.rgb*_Brightness*pow(_MainTex_var.rgb,_Contrast)*i.vertexColor.rgb)*(_MainColor.a*_MainTex_var.a*i.vertexColor.a));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
