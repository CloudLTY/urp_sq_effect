// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VFX/UV_Effect_uvall"
{
	Properties
	{
		[Enum(Custom Data,0,Material,1)]_ShaderMode("Shader Mode", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)]_BlendMode("Blend Mode", Float) = 10
		[Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Float) = 0
		[Enum(On,1,Off,0)]_DepthMode("Depth Mode", Float) = 0
		_CUTOUT("CUTOUT", Range( 0 , 1)) = 0.5
		[Toggle(_USETURBULENCE_ON)] _UseTurbulence("Use Turbulence", Float) = 0
		[Toggle(_USEMASK_ON)] _UseMask("Use Mask", Float) = 0
		[Toggle(_USECLIP_ON)] _UseClip("Use Clip", Float) = 0
		_Brightness("Brightness", Float) = 1
		_Contrast("Contrast", Float) = 1
		[HDR]_MainColor("Main Color", Color) = (1,1,1,1)
		[HDR]_BackColor("BackColor", Color) = (1,1,1,1)
		[Toggle(_USEBACKCOLOR_ON)] _UseBackColor("Use BackColor", Float) = 0
		_MainTex("Main Tex", 2D) = "white" {}
		_MainPannerX("Main Panner X", Float) = 0
		_MainPannerY("Main Panner Y", Float) = 0
		[Toggle(_ALPHAR_ON)] _AlphaR("Alpha R", Float) = 0
		_TurbulenceTex("Turbulence Tex", 2D) = "white" {}
		_DistortPower("Distort Power", Float) = 0
		_PowerU("Power U", Float) = 0
		_PowerV("Power V", Float) = 0
		_MaskTex("Mask Tex", 2D) = "white" {}
		_Hardness("Hardness", Range( 0 , 0.99)) = 0
		_Dissolve("Dissolve", Range( 0 , 1)) = 0
		[HDR]_WidthColor("WidthColor", Color) = (1,1,1,1)
		_EdgeWidth("EdgeWidth", Range( 0 , 1)) = 0
		_Alpha("Alpha", Range( 0 , 10)) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" "Queue"="Transparent" }
		LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend SrcAlpha [_BlendMode]
		Cull [_CullMode]
		ColorMask RGBA
		ZWrite [_DepthMode]
		ZTest LEqual
		
		
		
		Pass
		{
			Name "Unlit"
			Tags { "LightMode"="ForwardBase" }
			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#pragma shader_feature _USETURBULENCE_ON
			#pragma shader_feature _USEBACKCOLOR_ON
			#pragma shader_feature _USECLIP_ON
			#pragma shader_feature _ALPHAR_ON
			#pragma shader_feature _USEMASK_ON


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord1 : TEXCOORD1;
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
			};

			uniform half _BlendMode;
			uniform half _CullMode;
			uniform float4 _WidthColor;
			uniform sampler2D _MainTex;
			uniform half _EdgeWidth;
			uniform half _ShaderMode;
			uniform float4 _MainTex_ST;
			uniform half _MainPannerX;
			uniform half _MainPannerY;
			uniform half _Dissolve;
			uniform half _DistortPower;
			uniform sampler2D _TurbulenceTex;
			uniform float4 _TurbulenceTex_ST;
			uniform half _PowerU;
			uniform half _PowerV;
			uniform half _Contrast;
			uniform half _Brightness;
			uniform float4 _MainColor;
			uniform float4 _BackColor;
			uniform half _Hardness;
			uniform half _Alpha;
			uniform sampler2D _MaskTex;
			uniform float4 _MaskTex_ST;
			uniform half _CUTOUT;
			uniform half _DepthMode;
			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_texcoord1 = v.ase_texcoord2;
				o.ase_texcoord2 = v.ase_texcoord1;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}
			
			fixed4 frag (v2f i , half ase_vface : VFACE) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				float2 uv065 = i.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float4 uv261 = i.ase_texcoord1;
				uv261.xy = i.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult123 = (float4(uv261.x , uv261.y , uv261.z , ( uv261.w + 1.0 )));
				float4 appendResult141 = (float4(1.0 , 1.0 , _EdgeWidth , 1.0));
				float4 lerpResult143 = lerp( appendResult123 , appendResult141 , _ShaderMode);
				float4 break144 = lerpResult143;
				float2 appendResult62 = (float2(break144.x , break144.y));
				float2 temp_output_63_0 = ( appendResult62 + float2( -1,-1 ) );
				float2 uv0_MainTex = i.ase_texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 uv119 = i.ase_texcoord2;
				uv119.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult129 = (float4(uv119.x , uv119.y , uv119.z , uv119.w));
				float4 appendResult137 = (float4(( _MainPannerX * _Time.y ) , ( _Time.y * _MainPannerY ) , _Dissolve , _DistortPower));
				float4 lerpResult125 = lerp( appendResult129 , appendResult137 , _ShaderMode);
				float4 break128 = lerpResult125;
				float2 appendResult21 = (float2(break128.x , break128.y));
				float2 uv0_TurbulenceTex = i.ase_texcoord.xy * _TurbulenceTex_ST.xy + _TurbulenceTex_ST.zw;
				float2 appendResult36 = (float2(_PowerU , _PowerV));
				float4 tex2DNode31 = tex2D( _TurbulenceTex, ( uv0_TurbulenceTex + ( appendResult36 * _Time.y ) ) );
				half Distort148 = break128.w;
				#ifdef _USETURBULENCE_ON
				float staticSwitch56 = ( ( tex2DNode31.r - 0.5 ) * Distort148 );
				#else
				float staticSwitch56 = 0.0;
				#endif
				float4 tex2DNode3 = tex2D( _MainTex, ( ( ( uv065 * temp_output_63_0 ) + ( temp_output_63_0 * float2( -0.5,-0.5 ) ) ) + ( ( uv0_MainTex + appendResult21 ) + staticSwitch56 ) ) );
				float4 temp_cast_0 = (_Contrast).xxxx;
				#ifdef _USEBACKCOLOR_ON
				float4 staticSwitch166 = _BackColor;
				#else
				float4 staticSwitch166 = _MainColor;
				#endif
				float4 lerpResult162 = lerp( staticSwitch166 , _MainColor , max( ase_vface , 0.0 ));
				float4 temp_output_8_0 = ( pow( tex2DNode3 , temp_cast_0 ) * _Brightness * lerpResult162 * i.ase_color );
				half edgebrightness152 = break144.w;
				float2 temp_cast_1 = (1.0).xx;
				float temp_output_87_0 = ( tex2DNode31.r + 1.0 );
				half dissolve146 = break128.z;
				half edgewidth150 = break144.z;
				float temp_output_116_0 = ( dissolve146 * ( 1.0 + edgewidth150 ) );
				half hardness89 = _Hardness;
				float temp_output_91_0 = ( 1.0 - hardness89 );
				float2 appendResult158 = (float2(saturate( ( ( ( temp_output_87_0 - ( temp_output_116_0 * ( 1.0 + temp_output_91_0 ) ) ) - hardness89 ) / ( 1.0 - hardness89 ) ) ) , saturate( ( ( ( temp_output_87_0 - ( ( temp_output_116_0 - edgewidth150 ) * ( 1.0 + temp_output_91_0 ) ) ) - hardness89 ) / ( 1.0 - hardness89 ) ) )));
				#ifdef _USECLIP_ON
				float2 staticSwitch58 = appendResult158;
				#else
				float2 staticSwitch58 = temp_cast_1;
				#endif
				float2 break159 = staticSwitch58;
				float4 lerpResult109 = lerp( ( _WidthColor * temp_output_8_0 * edgebrightness152 ) , temp_output_8_0 , break159.x);
				#ifdef _ALPHAR_ON
				float staticSwitch53 = tex2DNode3.r;
				#else
				float staticSwitch53 = tex2DNode3.a;
				#endif
				float2 uv_MaskTex = i.ase_texcoord.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
				#ifdef _USEMASK_ON
				float staticSwitch54 = tex2D( _MaskTex, uv_MaskTex ).r;
				#else
				float staticSwitch54 = 1.0;
				#endif
				float temp_output_74_0 = min( ( i.ase_color.a * _MainColor.a * staticSwitch53 * break159.y * _Alpha * staticSwitch54 ) , 1.0 );
				float4 appendResult173 = (float4(lerpResult109.rgb , temp_output_74_0));
				clip( temp_output_74_0 - min( _CUTOUT , _DepthMode ));
				float3 appendResult171 = (float3(lerpResult109.rgb));
				float4 appendResult172 = (float4(appendResult171 , 1.0));
				float4 lerpResult170 = lerp( appendResult173 , appendResult172 , _DepthMode);
				float4 appendResult112 = (float4(lerpResult170));
				
				
				finalColor = appendResult112;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=17000
0;196;1906;823;4615.784;1034.442;1;True;True
Node;AmplifyShaderEditor.TextureCoordinatesNode;61;-3869.878,-36.86414;Float;False;2;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;140;-3873.335,168.002;Half;False;Constant;_UVRpeat;UVRpeat;24;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;160;-3600.259,111.8986;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TimeNode;133;-3854.526,-608.6367;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;130;-3863.267,-695.7444;Half;False;Property;_MainPannerX;Main Panner X;14;0;Create;True;0;0;False;0;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;98;-3899.775,248.9922;Half;False;Property;_EdgeWidth;EdgeWidth;25;0;Create;True;0;0;False;0;0;0.356;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;131;-3857.621,-462.1284;Half;False;Property;_MainPannerY;Main Panner Y;15;0;Create;True;0;0;False;0;0;-0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;82;-3887.521,-382.5566;Half;False;Property;_Dissolve;Dissolve;23;0;Create;True;0;0;False;0;0;0.541;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;126;-3303.355,-268.9305;Half;False;Property;_ShaderMode;Shader Mode;0;1;[Enum];Create;True;2;Custom Data;0;Material;1;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;141;-3427.53,142.7132;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;19;-3894.07,-889.5945;Float;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;123;-3428.531,-13.53671;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;139;-3547.219,-549.7;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;136;-3885.833,-294.1258;Half;False;Property;_DistortPower;Distort Power;18;0;Create;True;0;0;False;0;0;0.18;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;138;-3524.253,-653.2999;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;143;-2986.482,-44.76638;Float;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;137;-3270.573,-620.0473;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;129;-3378.741,-871.256;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;125;-2983.629,-697.2468;Float;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.BreakToComponentsNode;144;-2649.242,-90.44365;Float;True;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;33;-3765.507,593.97;Half;False;Property;_PowerU;Power U;19;0;Create;True;0;0;False;0;0;0.4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-3765.763,681.1553;Half;False;Property;_PowerV;Power V;20;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;128;-2704.305,-667.0768;Float;True;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;50;-1802.325,1576.897;Half;False;Property;_Hardness;Hardness;22;0;Create;True;0;0;False;0;0;0;0;0.99;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;150;-2272.3,-17.18262;Half;False;edgewidth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;147;-3512.625,1807.965;Float;False;150;edgewidth;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;89;-1506.827,1563.587;Half;False;hardness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;36;-3505.734,634.1598;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TimeNode;37;-3780.446,768.2513;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;146;-2329.772,-782.0343;Half;False;dissolve;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;39;-3360.502,555.0458;Float;False;0;30;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;38;-3310.443,739.8962;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;115;-3232.005,1714.648;Float;False;2;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;90;-3339.385,1951.282;Float;False;89;hardness;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;151;-3340.975,1596.622;Float;False;146;dissolve;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;40;-3061.073,759.073;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;30;-2920.64,479.3312;Float;True;Property;_TurbulenceTex;Turbulence Tex;17;0;Create;True;0;0;False;0;None;40e7e3d4f5f133d40a4546bd96d97ca5;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;116;-3079.008,1595.591;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;91;-3092.236,1966.093;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;31;-2548.631,641.0797;Float;True;Property;_TextureSample2;Texture Sample 2;7;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;99;-2824.916,1935.502;Float;False;2;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;148;-2322.76,-598.4801;Half;False;Distort;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;114;-2776.847,1797.901;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;92;-2906.351,1652.885;Float;False;2;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;149;-1877.077,776.8285;Float;False;148;Distort;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;62;-1864.271,-920.9154;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;100;-2596.067,1794.791;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;87;-2292.741,1266.825;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;83;-2703.479,1587.234;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;71;-1845.78,539.3958;Float;False;2;0;FLOAT;0.5;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;63;-1566.666,-776.2327;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;-1,-1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;57;-1677.867,202.2522;Half;False;Constant;_turbulencefloat;turbulence float;14;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;21;-1821.481,-293.0772;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-1617.318,578.8416;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;101;-2052.208,1754.094;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;107;-1491.632,1836.044;Float;False;89;hardness;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;65;-1849.502,-1145.852;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;88;-1907.881,1346.22;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;15;-1870.226,-521.4356;Float;False;0;2;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;16;-1320.242,-304.966;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;103;-1182.332,1742.867;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;78;-1221.188,1473.482;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;79;-1216.364,1570.049;Float;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;67;-1361.307,-633.9828;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;-0.5,-0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;56;-1392.225,203.8256;Float;False;Property;_UseTurbulence;Use Turbulence;5;0;Create;True;0;0;False;0;0;0;1;True;;Toggle;2;Key0;Key1;Create;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;66;-1379.339,-953.5428;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;105;-1187.218,1838.44;Float;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;80;-1059.123,1512.663;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;43;-1041.101,-219.9407;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;69;-1093.727,-855.859;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;104;-1019.698,1759.292;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;81;-894.638,1514.823;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;9;30.52811,-71.7894;Float;False;Property;_MainColor;Main Color;10;1;[HDR];Create;True;0;0;False;0;1,1,1,1;0.25,0.8911881,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;164;25.9692,-312.0665;Float;False;Property;_BackColor;BackColor;11;1;[HDR];Create;True;0;0;False;0;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FaceVariableNode;161;45.003,189.2933;Float;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;145;-627.5089,-425.8396;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;2;-637.3904,-697.317;Float;True;Property;_MainTex;Main Tex;13;0;Create;True;0;0;False;0;None;ba503f279d56594488fa6369a0896ef8;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.SaturateNode;106;-887.1955,1729.831;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-310.2979,871.5981;Half;False;Constant;_Clipfloat;Clip float;15;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;158;65.73193,1355.059;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;163;232.0898,178.7692;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;289.1778,-426.507;Half;False;Property;_Contrast;Contrast;9;0;Create;True;0;0;False;0;1;0.58;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;166;269.5369,-254.7638;Float;False;Property;_UseBackColor;Use BackColor;12;0;Create;True;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;3;-292.804,-499.6114;Float;True;Property;_TextureSample0;Texture Sample 0;1;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;23;128.0212,2412.225;Float;True;Property;_MaskTex;Mask Tex;21;0;Create;True;0;0;False;0;None;2f70f40b8b6efb54c990fd3329377143;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.PowerNode;7;458.3999,-504.2292;Float;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;58;211.1605,952.3995;Float;False;Property;_UseClip;Use Clip;7;0;Create;True;0;0;False;0;0;0;1;True;;Toggle;2;Key0;Key1;Create;False;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;162;581.2712,-216.3141;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;55;484.1347,1936.437;Half;False;Constant;_Maskfloat;Mask float;13;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;22;740.7388,-127.7228;Float;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;152;-2288.523,60.05524;Half;False;edgebrightness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;24;434.5605,2313.413;Float;True;Property;_TextureSample1;Texture Sample 1;6;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4;295.0165,-348.9959;Half;False;Property;_Brightness;Brightness;8;0;Create;True;0;0;False;0;1;4.32;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;54;830.5983,2165.243;Float;False;Property;_UseMask;Use Mask;6;0;Create;True;0;0;False;0;0;0;1;True;;Toggle;2;Key0;Key1;Create;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;72;1214.948,1247.215;Half;False;Property;_Alpha;Alpha;26;0;Create;True;0;0;False;0;1;1.15;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;53;143.414,393.8081;Float;False;Property;_AlphaR;Alpha R;16;0;Create;True;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;159;609.4059,834.7795;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;1026.161,-293.8664;Float;True;4;4;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;110;1385.224,-678.2095;Float;False;Property;_WidthColor;WidthColor;24;1;[HDR];Create;True;0;0;False;0;1,1,1,1;0.2941177,0.3058824,0.7490196,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;153;1473.93,-318.7834;Float;False;152;edgebrightness;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;75;2118.799,474.3028;Half;False;Property;_DepthMode;Depth Mode;3;1;[Enum];Create;True;2;On;1;Off;0;0;True;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;168;2044.596,177.3045;Half;False;Property;_CUTOUT;CUTOUT;4;0;Create;True;0;0;False;0;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;120;1833.584,-487.8231;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;113;1708.739,684.2477;Float;False;6;6;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;176;2360.712,145.1033;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;109;1961.781,-214.2301;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMinOpNode;74;1976.933,20.10745;Float;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClipNode;167;2483.281,42.4887;Float;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;171;2668.48,69.67953;Float;False;FLOAT3;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;172;2834.463,71.90204;Float;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;173;2747.845,-65.99467;Float;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;177;2934.279,445.4286;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;170;3058.242,-59.03242;Float;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;70;-1847.143,3225.386;Half;False;Property;_BlendMode;Blend Mode;1;1;[Enum];Create;True;0;1;UnityEngine.Rendering.BlendMode;True;0;10;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;18;-1833.959,3131.04;Half;False;Property;_CullMode;Cull Mode;2;1;[Enum];Create;True;0;1;UnityEngine.Rendering.CullMode;True;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;112;3253.242,-60.07266;Float;True;FLOAT4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;3557.278,50.47424;Half;False;True;2;Half;ASEMaterialInspector;0;1;VFX/UV_Effect_uvall;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;2;5;False;58;10;True;70;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;True;False;True;2;True;18;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;True;75;True;3;False;-1;True;False;0;False;-1;0;False;-1;True;2;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;True;2;0;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;0
WireConnection;160;0;61;4
WireConnection;141;0;140;0
WireConnection;141;1;140;0
WireConnection;141;2;98;0
WireConnection;141;3;140;0
WireConnection;123;0;61;1
WireConnection;123;1;61;2
WireConnection;123;2;61;3
WireConnection;123;3;160;0
WireConnection;139;0;133;2
WireConnection;139;1;131;0
WireConnection;138;0;130;0
WireConnection;138;1;133;2
WireConnection;143;0;123;0
WireConnection;143;1;141;0
WireConnection;143;2;126;0
WireConnection;137;0;138;0
WireConnection;137;1;139;0
WireConnection;137;2;82;0
WireConnection;137;3;136;0
WireConnection;129;0;19;1
WireConnection;129;1;19;2
WireConnection;129;2;19;3
WireConnection;129;3;19;4
WireConnection;125;0;129;0
WireConnection;125;1;137;0
WireConnection;125;2;126;0
WireConnection;144;0;143;0
WireConnection;128;0;125;0
WireConnection;150;0;144;2
WireConnection;89;0;50;0
WireConnection;36;0;33;0
WireConnection;36;1;35;0
WireConnection;146;0;128;2
WireConnection;38;0;36;0
WireConnection;38;1;37;2
WireConnection;115;1;147;0
WireConnection;40;0;39;0
WireConnection;40;1;38;0
WireConnection;116;0;151;0
WireConnection;116;1;115;0
WireConnection;91;0;90;0
WireConnection;31;0;30;0
WireConnection;31;1;40;0
WireConnection;99;1;91;0
WireConnection;148;0;128;3
WireConnection;114;0;116;0
WireConnection;114;1;147;0
WireConnection;92;1;91;0
WireConnection;62;0;144;0
WireConnection;62;1;144;1
WireConnection;100;0;114;0
WireConnection;100;1;99;0
WireConnection;87;0;31;1
WireConnection;83;0;116;0
WireConnection;83;1;92;0
WireConnection;71;0;31;1
WireConnection;63;0;62;0
WireConnection;21;0;128;0
WireConnection;21;1;128;1
WireConnection;41;0;71;0
WireConnection;41;1;149;0
WireConnection;101;0;87;0
WireConnection;101;1;100;0
WireConnection;88;0;87;0
WireConnection;88;1;83;0
WireConnection;16;0;15;0
WireConnection;16;1;21;0
WireConnection;103;0;101;0
WireConnection;103;1;107;0
WireConnection;78;0;88;0
WireConnection;78;1;89;0
WireConnection;79;1;89;0
WireConnection;67;0;63;0
WireConnection;56;1;57;0
WireConnection;56;0;41;0
WireConnection;66;0;65;0
WireConnection;66;1;63;0
WireConnection;105;1;107;0
WireConnection;80;0;78;0
WireConnection;80;1;79;0
WireConnection;43;0;16;0
WireConnection;43;1;56;0
WireConnection;69;0;66;0
WireConnection;69;1;67;0
WireConnection;104;0;103;0
WireConnection;104;1;105;0
WireConnection;81;0;80;0
WireConnection;145;0;69;0
WireConnection;145;1;43;0
WireConnection;106;0;104;0
WireConnection;158;0;81;0
WireConnection;158;1;106;0
WireConnection;163;0;161;0
WireConnection;166;1;9;0
WireConnection;166;0;164;0
WireConnection;3;0;2;0
WireConnection;3;1;145;0
WireConnection;7;0;3;0
WireConnection;7;1;5;0
WireConnection;58;1;59;0
WireConnection;58;0;158;0
WireConnection;162;0;166;0
WireConnection;162;1;9;0
WireConnection;162;2;163;0
WireConnection;152;0;144;3
WireConnection;24;0;23;0
WireConnection;54;1;55;0
WireConnection;54;0;24;1
WireConnection;53;1;3;4
WireConnection;53;0;3;1
WireConnection;159;0;58;0
WireConnection;8;0;7;0
WireConnection;8;1;4;0
WireConnection;8;2;162;0
WireConnection;8;3;22;0
WireConnection;120;0;110;0
WireConnection;120;1;8;0
WireConnection;120;2;153;0
WireConnection;113;0;22;4
WireConnection;113;1;9;4
WireConnection;113;2;53;0
WireConnection;113;3;159;1
WireConnection;113;4;72;0
WireConnection;113;5;54;0
WireConnection;176;0;168;0
WireConnection;176;1;75;0
WireConnection;109;0;120;0
WireConnection;109;1;8;0
WireConnection;109;2;159;0
WireConnection;74;0;113;0
WireConnection;167;0;109;0
WireConnection;167;1;74;0
WireConnection;167;2;176;0
WireConnection;171;0;167;0
WireConnection;172;0;171;0
WireConnection;173;0;109;0
WireConnection;173;3;74;0
WireConnection;177;0;75;0
WireConnection;170;0;173;0
WireConnection;170;1;172;0
WireConnection;170;2;177;0
WireConnection;112;0;170;0
WireConnection;1;0;112;0
ASEEND*/
//CHKSM=D52272150759D0F629321DF29D339372FAC6EE66