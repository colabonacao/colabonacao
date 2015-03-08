import UnityEngine

class AspectFit (MonoBehaviour): 

	def Awake ():
		image = gameObject.GetComponent[of Image]() as Image
		factor = image.sprite.bounds.size.x/image.sprite.bounds.size.y
		t = (transform as RectTransform)
		t.sizeDelta.y = Screen.height
		t.sizeDelta.x = Screen.height * factor
		if t.sizeDelta.x < Screen.width:
			factor = image.sprite.bounds.size.y/image.sprite.bounds.size.x
			t.sizeDelta.y = Screen.width * factor
			t.sizeDelta.x = Screen.width 
	
	def Update ():
		pass
