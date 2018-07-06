// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-2877-OUT;n:type:ShaderForge.SFN_Lerp,id:2877,x:32407,y:32820,varname:node_2877,prsc:2|A-1441-OUT,B-1923-XYZ,T-8344-OUT;n:type:ShaderForge.SFN_Tex2d,id:1325,x:31841,y:32832,ptovrint:False,ptlb:road_tex,ptin:_road_tex,varname:node_1325,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:cb33353b3acc0c34e97dc69341303254,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8794,x:31476,y:33250,ptovrint:False,ptlb:dither_tex,ptin:_dither_tex,varname:node_8794,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2fadaee653cb15b4fb84eafc31a33730,ntxv:0,isnm:False|UVIN-2885-OUT;n:type:ShaderForge.SFN_Vector4Property,id:1923,x:31841,y:33049,ptovrint:False,ptlb:blend color,ptin:_blendcolor,varname:node_1923,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0.9586205,v3:1,v4:0;n:type:ShaderForge.SFN_ScreenPos,id:3245,x:31135,y:33250,varname:node_3245,prsc:2,sctp:0;n:type:ShaderForge.SFN_RemapRange,id:2885,x:31312,y:33250,varname:node_2885,prsc:2,frmn:-1,frmx:0,tomn:0,tomx:1|IN-3245-UVOUT;n:type:ShaderForge.SFN_Multiply,id:1441,x:32053,y:32822,varname:node_1441,prsc:2|A-4086-OUT,B-1325-RGB;n:type:ShaderForge.SFN_ViewPosition,id:8459,x:30319,y:33486,varname:node_8459,prsc:2;n:type:ShaderForge.SFN_FragmentPosition,id:9481,x:30319,y:33627,varname:node_9481,prsc:2;n:type:ShaderForge.SFN_Subtract,id:857,x:30516,y:33582,varname:node_857,prsc:2|A-8459-XYZ,B-9481-XYZ;n:type:ShaderForge.SFN_Transform,id:7871,x:30700,y:33582,varname:node_7871,prsc:2,tffrom:0,tfto:3|IN-857-OUT;n:type:ShaderForge.SFN_ComponentMask,id:1731,x:30873,y:33582,varname:node_1731,prsc:2,cc1:2,cc2:-1,cc3:-1,cc4:-1|IN-7871-XYZ;n:type:ShaderForge.SFN_ProjectionParameters,id:8319,x:30700,y:33759,varname:node_8319,prsc:2;n:type:ShaderForge.SFN_Subtract,id:6336,x:31063,y:33582,varname:node_6336,prsc:2|A-1731-OUT,B-8319-NEAR;n:type:ShaderForge.SFN_Divide,id:9551,x:31250,y:33627,varname:node_9551,prsc:2|A-6336-OUT,B-9279-OUT;n:type:ShaderForge.SFN_Clamp01,id:6924,x:31624,y:33630,varname:node_6924,prsc:2|IN-855-OUT;n:type:ShaderForge.SFN_Blend,id:9675,x:31818,y:33630,varname:node_9675,prsc:2,blmd:6,clmp:True|SRC-6924-OUT,DST-6924-OUT;n:type:ShaderForge.SFN_Lerp,id:8344,x:32214,y:33414,varname:node_8344,prsc:2|A-5954-OUT,B-9168-OUT,T-2650-OUT;n:type:ShaderForge.SFN_Vector1,id:9168,x:31476,y:33431,varname:node_9168,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:855,x:31436,y:33630,varname:node_855,prsc:2|VAL-9551-OUT,EXP-5071-OUT;n:type:ShaderForge.SFN_OneMinus,id:2650,x:31995,y:33630,varname:node_2650,prsc:2|IN-9675-OUT;n:type:ShaderForge.SFN_Slider,id:5071,x:31250,y:33817,ptovrint:False,ptlb:Transition Power,ptin:_TransitionPower,varname:node_5071,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Slider,id:9279,x:30883,y:33818,ptovrint:False,ptlb:Transition Distance,ptin:_TransitionDistance,varname:_TransitionPower_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:10,max:100;n:type:ShaderForge.SFN_Slider,id:4086,x:31684,y:32702,ptovrint:False,ptlb:road boost,ptin:_roadboost,varname:node_4086,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4,max:10;n:type:ShaderForge.SFN_Slider,id:1252,x:31312,y:33129,ptovrint:False,ptlb:dither boost,ptin:_ditherboost,varname:_roadboost_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:5;n:type:ShaderForge.SFN_Multiply,id:5954,x:31697,y:33250,varname:node_5954,prsc:2|A-1252-OUT,B-8794-RGB;proporder:1325-8794-1923-5071-9279-4086-1252;pass:END;sub:END;*/

Shader "Shader Forge/road_space" {
    Properties {
        _road_tex ("road_tex", 2D) = "white" {}
        _dither_tex ("dither_tex", 2D) = "white" {}
        _blendcolor ("blend color", Vector) = (0,0.9586205,1,0)
        _TransitionPower ("Transition Power", Range(0, 10)) = 1
        _TransitionDistance ("Transition Distance", Range(0, 100)) = 10
        _roadboost ("road boost", Range(0, 10)) = 4
        _ditherboost ("dither boost", Range(0, 5)) = 1
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _road_tex; uniform float4 _road_tex_ST;
            uniform sampler2D _dither_tex; uniform float4 _dither_tex_ST;
            uniform float4 _blendcolor;
            uniform float _TransitionPower;
            uniform float _TransitionDistance;
            uniform float _roadboost;
            uniform float _ditherboost;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float4 screenPos : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
////// Lighting:
////// Emissive:
                float4 _road_tex_var = tex2D(_road_tex,TRANSFORM_TEX(i.uv0, _road_tex));
                float2 node_2885 = (i.screenPos.rg*1.0+1.0);
                float4 _dither_tex_var = tex2D(_dither_tex,TRANSFORM_TEX(node_2885, _dither_tex));
                float node_9168 = 0.0;
                float node_6924 = saturate(pow(((mul( UNITY_MATRIX_V, float4((_WorldSpaceCameraPos-i.posWorld.rgb),0) ).xyz.rgb.b-_ProjectionParams.g)/_TransitionDistance),_TransitionPower));
                float3 emissive = lerp((_roadboost*_road_tex_var.rgb),_blendcolor.rgb,lerp((_ditherboost*_dither_tex_var.rgb),float3(node_9168,node_9168,node_9168),(1.0 - saturate((1.0-(1.0-node_6924)*(1.0-node_6924))))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
