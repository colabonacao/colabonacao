import UnityEngine

class NewsMenuPopulate (MonoBehaviour): 
	
	public newsScroll as NewsScroll
	
	public newsPrefab as GameObject
	
	private lastNews as RectTransform

	def Start ():
		newsList = newsScroll.getNews()
		for i in range(len(newsList)):
			newsObj = Instantiate(newsPrefab as GameObject)
			newsObj.transform.SetParent(gameObject.transform, false)
			newsObj.GetComponentInChildren[of NewsItem]().SetNews((newsList[i] as News).getText(), (newsList[i] as News).getSourceSprite())
			if (lastNews is not null):
				newsObj.transform.localPosition = Vector3(0, (lastNews.localPosition.y - lastNews.rect.height), 0)
			lastNews = newsObj.GetComponent[of RectTransform]()
