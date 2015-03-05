import UnityEngine

class VerticalScrollableAutoScale (MonoBehaviour):
	
	public desiredHeightAt600 as single

	def Awake():
		sizeScaleFactor as single = Screen.height/600.0f
		self.GetComponent[of RectTransform]().sizeDelta = Vector2(self.GetComponentInChildren[of RectTransform]().sizeDelta.x, desiredHeightAt600 * sizeScaleFactor)
		