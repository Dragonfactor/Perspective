Shader "Custom/CustomShader"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _MainTex("Albedo (RGB)", 2D) = "white" {}
        _Glossiness("Smoothness", Range(0,1)) = 0.5
        _Metallic("Metallic", Range(0,1)) = 0.0
        _Transparancy("Transparancy", Range(0,1)) = 0.5
        _Division("Division", Range(0,1)) = 0.5
    }
    SubShader
    {
        Tags {"Queue" = "Transparent"}
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model
        #pragma surface surf Standard alpha

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
            float4 screenPos;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;
        float _Transparancy;
        float _Division;

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            float2 coords = IN.screenPos.xy / IN.screenPos.w;
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;
            // Metallic and smoothness come from slider variables
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            // full alpha applied ( not transparent)
            if (coords.x < _Division)
            {
                o.Alpha = _Transparancy;
            }
            else
            {
                o.Alpha = 0.0;
            }
        }
        ENDCG
    }
}
