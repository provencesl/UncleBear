Shader "Triniti/Particle/AA_COL_DO_ZWO_2P"
{
//Ϊ�˲���ʾ���屳���shader
	Properties
	{
		_Color ("Main Color", Color) = (0.5,0.5,0.5,0.5)
		_MainTex ("Particle Texture", 2D) = "white" {}
	}

	Category
	{
		Tags { "Queue"="Transparent"}
		Blend SrcAlpha One
		//Cull Off
		ZWrite On
		Fog { Color (0,0,0,0) }
		
		BindChannels
		{
			Bind "Color", color
			Bind "Vertex", vertex
			Bind "TexCoord", texcoord
		}
		
		SubShader
		{
			//ֻд�����
			Pass
			{
				ColorMask 0
				SetTexture [_MainTex]
				{
					combine texture * primary
				}
			}
			
			Pass
			{
				//ZTest Always
				Offset -1,-1
				SetTexture [_MainTex]
				{
					constantColor [_Color]
					combine constant * primary
				}
				SetTexture [_MainTex]
				{
					combine texture * previous double
				}
				
			}
		}
	}
}

