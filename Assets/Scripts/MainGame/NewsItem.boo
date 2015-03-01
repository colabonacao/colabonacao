import UnityEngine

class NewsItem (MonoBehaviour): 
	
	public newsText as Text
	//public newsNote as GameObject
	
	def Awake():
		newsText.fontSize = (14 * Screen.width/800)

	def SetNews(description as string, hasNote as bool):
		newsText.text = description
		//newsNote.SetActive(hasNote)
