import UnityEngine
import System.Collections

class AutoFade (MonoBehaviour):
	private static m_Instance as AutoFade = null
	private m_Material as Material = null
	private m_LevelName as string = ""
	private m_LevelIndex as int = 0
	private m_Fading as bool = false
	
	private static Instance as AutoFade:
		get:
			if m_Instance is null:
				m_Instance = GameObject("AutoFade").AddComponent('AutoFade') as AutoFade
			return m_Instance
			
	public static Fading as bool:
		get:
			return Instance.m_Fading
	
	private def Awake() as void:
		DontDestroyOnLoad(self)
		m_Instance = self;
		m_Material = Material("Shader \"Plane/No zTest\" { SubShader { Pass { Blend SrcAlpha OneMinusSrcAlpha ZWrite Off Cull Off Fog { Mode Off } BindChannels { Bind \"Color\",color } } } }")
	
	private def DrawQuad(aColor as Color, aAlpha as single) as void:
		aColor.a = aAlpha
		m_Material.SetPass(0)
		GL.PushMatrix()
		GL.LoadOrtho()
		GL.Begin(GL.QUADS)
		GL.Color(aColor)
		GL.Vertex3(0, 0, -1)
		GL.Vertex3(0, 1, -1)
		GL.Vertex3(1, 1, -1)
		GL.Vertex3(1, 0, -1)
		GL.End()
		GL.PopMatrix()
	
	private def Fade(aFadeOutTime as single, aFadeInTime as single, aColor as Color) as IEnumerator:
		t as single = 0.0f;
		while t < 1.0f:
			yield WaitForEndOfFrame()
			t = Mathf.Clamp01(t + Time.deltaTime / aFadeOutTime)
			DrawQuad(aColor, t)
			
		if (m_LevelName != ""):
			Application.LoadLevel(m_LevelName)
		else:
			Application.LoadLevel(m_LevelIndex)
			
		while (t>0.0f):
			yield WaitForEndOfFrame()
			t = Mathf.Clamp01(t - Time.deltaTime / aFadeInTime)
			DrawQuad(aColor, t)
		m_Fading = false

	private def StartFade(aFadeOutTime as single, aFadeInTime as single, aColor as Color) as void:
		m_Fading = true
		EventSystems.EventSystem.current.enabled = false
		StartCoroutine(Fade(aFadeOutTime, aFadeInTime, aColor))
	
	public static def LoadLevel(aLevelName as string, aFadeOutTime as single, aFadeInTime as single, aColor as Color) as void:
		if Fading:
			return
		Instance.m_LevelName = aLevelName
		Instance.StartFade(aFadeOutTime, aFadeInTime, aColor)

	public static def LoadLevel(aLevelIndex as int, aFadeOutTime as single, aFadeInTime as single, aColor as Color) as void:
		if Fading:
			return
		Instance.m_LevelName = ""
		Instance.m_LevelIndex = aLevelIndex
		Instance.StartFade(aFadeOutTime, aFadeInTime, aColor)
	