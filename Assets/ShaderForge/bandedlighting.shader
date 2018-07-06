// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-5085-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:8068,x:32761,y:33099,varname:node_8068,prsc:2;n:type:ShaderForge.SFN_LightColor,id:3406,x:32776,y:32952,varname:node_3406,prsc:2;n:type:ShaderForge.SFN_LightVector,id:6869,x:31858,y:32654,varname:node_6869,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:9684,x:31858,y:32782,prsc:2,pt:True;n:type:ShaderForge.SFN_HalfVector,id:9471,x:31846,y:32985,varname:node_9471,prsc:2;n:type:ShaderForge.SFN_Dot,id:7782,x:32070,y:32697,cmnt:Lambert,varname:node_7782,prsc:2,dt:1|A-6869-OUT,B-9684-OUT;n:type:ShaderForge.SFN_Dot,id:3269,x:32058,y:32923,cmnt:Blinn-Phong,varname:node_3269,prsc:2,dt:1|A-9684-OUT,B-9471-OUT;n:type:ShaderForge.SFN_Multiply,id:1941,x:32604,y:32704,cmnt:Diffuse Contribution,varname:node_1941,prsc:2|A-6467-RGB,B-4344-RGB,C-1908-OUT;n:type:ShaderForge.SFN_Exp,id:1700,x:32143,y:33189,varname:node_1700,prsc:2,et:1|IN-6000-OUT;n:type:ShaderForge.SFN_Slider,id:5328,x:31383,y:33229,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:node_5328,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2179279,max:1;n:type:ShaderForge.SFN_Add,id:2159,x:32859,y:32763,cmnt:Combine,varname:node_2159,prsc:2|A-1941-OUT,B-7528-RGB,C-7919-OUT;n:type:ShaderForge.SFN_Multiply,id:5085,x:32979,y:32952,cmnt:Attenuate and Color,varname:node_5085,prsc:2|A-2159-OUT,B-3406-RGB,C-8068-OUT;n:type:ShaderForge.SFN_AmbientLight,id:7528,x:32587,y:32859,varname:node_7528,prsc:2;n:type:ShaderForge.SFN_Vector1,id:7614,x:31497,y:33327,varname:node_7614,prsc:2,v1:20;n:type:ShaderForge.SFN_Multiply,id:6747,x:31717,y:33283,varname:node_6747,prsc:2|A-5328-OUT,B-7614-OUT;n:type:ShaderForge.SFN_Add,id:6000,x:31971,y:33208,varname:node_6000,prsc:2|A-6747-OUT,B-1382-OUT;n:type:ShaderForge.SFN_Vector1,id:1382,x:31844,y:33307,varname:node_1382,prsc:2,v1:1;n:type:ShaderForge.SFN_Power,id:3527,x:32342,y:33129,varname:node_3527,prsc:2|VAL-3269-OUT,EXP-1700-OUT;n:type:ShaderForge.SFN_TexCoord,id:8899,x:31985,y:32437,varname:node_8899,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:6467,x:32299,y:32328,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_6467,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:04b052c3e708e4503b6da18d85fb2951,ntxv:0,isnm:False|UVIN-8899-UVOUT;n:type:ShaderForge.SFN_Vector1,id:6730,x:32210,y:32868,varname:node_6730,prsc:2,v1:8;n:type:ShaderForge.SFN_Posterize,id:7919,x:32541,y:33074,varname:node_7919,prsc:2|IN-3527-OUT,STPS-6730-OUT;n:type:ShaderForge.SFN_Posterize,id:1908,x:32422,y:32813,varname:node_1908,prsc:2|IN-7782-OUT,STPS-6730-OUT;n:type:ShaderForge.SFN_Color,id:4344,x:32299,y:32521,ptovrint:False,ptlb:node_4344,ptin:_node_4344,varname:node_4344,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;proporder:5328-4344-6467;pass:END;sub:END;*/

Shader "Shader Forge/bandedlighting" {
    Properties {
        _Gloss ("Gloss", Range(0, 1)) = 0.2179279
        _node_4344 ("node_4344", Color) = (1,1,1,1)
        _Diffuse ("Diffuse", 2D) = "white" {}
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
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _Gloss;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float4 _node_4344;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float node_6730 = 8.0;
                float3 finalColor = (((_Diffuse_var.rgb*_node_4344.rgb*floor(max(0,dot(lightDirection,normalDirection)) * node_6730) / (node_6730 - 1))+UNITY_LIGHTMODEL_AMBIENT.rgb+floor(pow(max(0,dot(normalDirection,halfDirection)),exp2(((_Gloss*20.0)+1.0))) * node_6730) / (node_6730 - 1))*_LightColor0.rgb*attenuation);
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _Gloss;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float4 _node_4344;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float node_6730 = 8.0;
                float3 finalColor = (((_Diffuse_var.rgb*_node_4344.rgb*floor(max(0,dot(lightDirection,normalDirection)) * node_6730) / (node_6730 - 1))+UNITY_LIGHTMODEL_AMBIENT.rgb+floor(pow(max(0,dot(normalDirection,halfDirection)),exp2(((_Gloss*20.0)+1.0))) * node_6730) / (node_6730 - 1))*_LightColor0.rgb*attenuation);
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
