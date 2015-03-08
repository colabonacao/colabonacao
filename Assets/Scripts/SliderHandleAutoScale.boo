import UnityEngine

class SliderHandleAutoScale (MonoBehaviour):
	
	public desiredWidthAt800 as single

	def Awake():
		sizeScaleFactor as single = Mathf.Min(Screen.width/800.0f, Screen.height/600.0f)
		self.GetComponent[of RectTransform]().sizeDelta = Vector2(desiredWidthAt800 * sizeScaleFactor, self.GetComponentInChildren[of RectTransform]().sizeDelta.y)
		