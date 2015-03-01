import UnityEngine

class NewsMenuPopulate (MonoBehaviour): 
	
	public newsScroll as NewsScroll
	
	public newsPrefab as NewsItem

	def Start ():
		newsList = newsScroll.getNews()
		for i in range(newsList.Count):
			newsObj = Instantiate(newsPrefab as NewsItem)
			newsObj.transform.SetParent(gameObject.transform, false)
			newsObj.SetNews((newsList[i] as News).getText(), false)
