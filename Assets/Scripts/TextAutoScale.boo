import UnityEngine

class TextAutoScale (MonoBehaviour):

	def Awake():
		sizeScaleFactor = Mathf.Min(Screen.width/800.0f, Screen.height/600.0f)
		self.GetComponentInChildren[of Text]().fontSize = (self.GetComponentInChildren[of Text]().fontSize * sizeScaleFactor)
		