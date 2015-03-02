import UnityEngine

class EndChosen (MonoBehaviour): 

	private city as City = null
	private stagePicked as StageEnum.Stages = StageEnum.Stages.Brasilia
	public news as NewsScroll
	
	def Awake() as void:
		DontDestroyOnLoad(transform.gameObject)
		
	def Start() as void:
		stageCheckInstance = GameObject.FindObjectOfType(StageCheck)
		
		if stageCheckInstance is not null:
			stagePicked = stageCheckInstance.stagePicked
		
	def setEnding() as void:
		city = GameObject.FindObjectOfType(City) as City
		city.transform.SetParent(gameObject.transform, false)
		news.transform.SetParent(gameObject.transform, false)
		AutoFade.LoadLevel("EndGame", 0.2f, 0.1f, Color.black)
		PlayerPrefs.Save()
		
	public def getStagePicked() as StageEnum.Stages:
		return stagePicked
		
	public def getCity() as City:
		return city
		
	public def getNews() as NewsScroll:
		return news
