// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32732,y:32730,varname:node_3138,prsc:2|emission-3857-OUT,clip-3040-A;n:type:ShaderForge.SFN_Color,id:7241,x:31866,y:32677,ptovrint:False,ptlb:Color 1,ptin:_Color1,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9852941,c2:0.01448963,c3:0.01448963,c4:1;n:type:ShaderForge.SFN_Tex2d,id:3040,x:31866,y:32479,ptovrint:False,ptlb:mask tex,ptin:_masktex,varname:node_3040,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:24dda0ac7b175944f8968586045fbe32,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Time,id:1271,x:31242,y:32995,varname:node_1271,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:8828,x:31242,y:33170,ptovrint:False,ptlb:speed,ptin:_speed,varname:node_8828,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:20;n:type:ShaderForge.SFN_Multiply,id:6452,x:31437,y:32995,varname:node_6452,prsc:2|A-1271-T,B-8828-OUT;n:type:ShaderForge.SFN_Sin,id:5998,x:31611,y:32995,varname:node_5998,prsc:2|IN-6452-OUT;n:type:ShaderForge.SFN_Lerp,id:3857,x:32476,y:32830,varname:node_3857,prsc:2|A-9290-OUT,B-258-OUT,T-5287-OUT;n:type:ShaderForge.SFN_Cos,id:476,x:31611,y:33151,varname:node_476,prsc:2|IN-253-OUT;n:type:ShaderForge.SFN_Multiply,id:253,x:31437,y:33151,varname:node_253,prsc:2|A-1271-T,B-8828-OUT;n:type:ShaderForge.SFN_Abs,id:7031,x:31806,y:33151,varname:node_7031,prsc:2|IN-476-OUT;n:type:ShaderForge.SFN_Add,id:1424,x:31981,y:33053,varname:node_1424,prsc:2|A-5998-OUT,B-7031-OUT;n:type:ShaderForge.SFN_Floor,id:5287,x:32161,y:33053,varname:node_5287,prsc:2|IN-1424-OUT;n:type:ShaderForge.SFN_Multiply,id:9290,x:32105,y:32599,varname:node_9290,prsc:2|A-3040-A,B-7241-RGB;n:type:ShaderForge.SFN_Color,id:4183,x:31866,y:32865,ptovrint:False,ptlb:Color 2,ptin:_Color2,varname:_Color_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9862069,c2:1,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:258,x:32091,y:32825,varname:node_258,prsc:2|A-3040-A,B-4183-RGB;proporder:7241-3040-8828-4183;pass:END;sub:END;*/

Shader "Shader Forge/Powerup_blink" {
    Properties {
        _Color1 ("Color 1", Color) = (0.9852941,0.01448963,0.01448963,1)
        _masktex ("mask tex", 2D) = "white" {}
        _speed ("speed", Float ) = 20
        _Color2 ("Color 2", Color) = (0.9862069,1,0,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
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
            uniform float4 _TimeEditor;
            uniform float4 _Color1;
            uniform sampler2D _masktex; uniform float4 _masktex_ST;
            uniform float _speed;
            uniform float4 _Color2;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _masktex_var = tex2D(_masktex,TRANSFORM_TEX(i.uv0, _masktex));
                clip(_masktex_var.a - 0.5);
////// Lighting:
////// Emissive:
                float4 node_1271 = _Time + _TimeEditor;
                float3 emissive = lerp((_masktex_var.a*_Color1.rgb),(_masktex_var.a*_Color2.rgb),floor((sin((node_1271.g*_speed))+abs(cos((node_1271.g*_speed))))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _masktex; uniform float4 _masktex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _masktex_var = tex2D(_masktex,TRANSFORM_TEX(i.uv0, _masktex));
                clip(_masktex_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
