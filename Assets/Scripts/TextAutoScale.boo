import UnityEngine

class TextAutoScale (MonoBehaviour):

	def Awake():
		sizeScaleFactor = Screen.width/800.0f
		self.GetComponentInChildren[of Text]().fontSize = (self.GetComponentInChildren[of Text]().fontSize * sizeScaleFactor)
		