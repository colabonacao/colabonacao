import UnityEngine

class NewsMenuPopulate (MonoBehaviour): 
	
	public newsScroll as NewsScroll
	
	public newsPrefab as GameObject
	
	private lastNews as RectTransform
	
	def Start():
		Populate()

	def Populate ():
		for child as Transform in transform:
			GameObject.Destroy(child.gameObject)
 
		newsList = newsScroll.getNews()
		lastNews = null
		for i in range(len(newsList)):
			newsObj = Instantiate(newsPrefab as GameObject)
			newsObj.transform.SetParent(gameObject.transform, false)
			//getcomponentinchildren does not work with inactive objects
			item = null as NewsItem
			for i as Transform in newsObj.transform:
				if i.name == "NewsArea":
					for t as Transform in i:
						if t.gameObject.GetComponent[of NewsItem]() != null:
							item = t.gameObject.GetComponent[of NewsItem]() as NewsItem
			if item != null:
				item.SetNews((newsList[i] as News).getText(), (newsList[i] as News).getSourceSprite())
			if (lastNews is not null):
				newsObj.transform.localPosition = Vector3(0, (lastNews.localPosition.y - lastNews.rect.height), 0)
			lastNews = newsObj.GetComponent[of RectTransform]()
