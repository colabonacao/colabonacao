import UnityEngine

class TextAutoScale (MonoBehaviour):

	def Awake():
		sizeScaleFactor = Screen.width/800
		self.GetComponentInChildren[of Text]().fontSize = (self.GetComponentInChildren[of Text]().fontSize * sizeScaleFactor)
		