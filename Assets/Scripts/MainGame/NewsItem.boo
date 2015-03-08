import UnityEngine

class NewsItem (MonoBehaviour): 
	
	public newsText as Text
	public newsLogo as Image
	
	def Awake():
		sizeScaleFactor = Mathf.Min(Screen.width/800.0f, Screen.height/600.0f)
		newsText.fontSize = (newsText.fontSize * sizeScaleFactor)

	def SetNews(description as string, logo as Sprite):
		newsText.text = description
		if (logo is not null):
			newsLogo.sprite = logo
