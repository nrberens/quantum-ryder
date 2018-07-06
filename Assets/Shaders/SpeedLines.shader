// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-3690-RGB,alpha-1802-OUT;n:type:ShaderForge.SFN_VertexColor,id:3690,x:32372,y:32657,varname:node_3690,prsc:2;n:type:ShaderForge.SFN_DepthBlend,id:7076,x:32276,y:33096,varname:node_7076,prsc:2|DIST-9645-OUT;n:type:ShaderForge.SFN_Slider,id:9645,x:31918,y:33097,ptovrint:False,ptlb:depth blend bias,ptin:_depthblendbias,varname:node_9645,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:1802,x:32468,y:32966,varname:node_1802,prsc:2|A-5436-OUT,B-7076-OUT;n:type:ShaderForge.SFN_ScreenPos,id:5416,x:31473,y:32865,varname:node_5416,prsc:2,sctp:0;n:type:ShaderForge.SFN_RemapRange,id:3839,x:31668,y:32865,varname:node_3839,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-5416-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:7650,x:31880,y:32865,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_7650,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:95ef4804fe0be4c999ddaa383536cde8,ntxv:0,isnm:False|UVIN-3839-OUT;n:type:ShaderForge.SFN_OneMinus,id:8702,x:32061,y:32882,varname:node_8702,prsc:2|IN-7650-R;n:type:ShaderForge.SFN_Power,id:5436,x:32249,y:32867,varname:node_5436,prsc:2|VAL-8702-OUT,EXP-5240-OUT;n:type:ShaderForge.SFN_Vector1,id:5240,x:32061,y:33018,varname:node_5240,prsc:2,v1:0.5;proporder:9645-7650;pass:END;sub:END;*/

Shader "Shader Forge/SpeedLines" {
    Properties {
        _depthblendbias ("depth blend bias", Range(0, 1)) = 0
        _mask ("mask", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
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
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform float _depthblendbias;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 screenPos : TEXCOORD0;
                float4 vertexColor : COLOR;
                float4 projPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos(v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
////// Lighting:
////// Emissive:
                float3 emissive = i.vertexColor.rgb;
                float3 finalColor = emissive;
                float2 node_3839 = (i.screenPos.rg*0.5+0.5);
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(node_3839, _mask));
                return fixed4(finalColor,(pow((1.0 - _mask_var.r),0.5)*saturate((sceneZ-partZ)/_depthblendbias)));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
