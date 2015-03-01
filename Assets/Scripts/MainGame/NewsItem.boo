import UnityEngine

class NewsItem (MonoBehaviour): 
	
	public newsText as Text
	public newsLogo as Image
	
	def Awake():
		newsText.fontSize = (newsText.fontSize * Screen.width/800)

	def SetNews(description as string, logo as Sprite):
		newsText.text = description
		if (logo is not null):
			newsLogo.sprite = logo
