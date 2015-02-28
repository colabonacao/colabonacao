import UnityEngine

class EndChosen (MonoBehaviour): 

	public endPicked as EndEnum.Endings = EndEnum.Endings.SuccessComplete
	public stagePicked as StageEnum.Stages = StageEnum.Stages.Brasilia
	public statsSprite as Sprite = null
	
	def Awake() as void:
		DontDestroyOnLoad(transform.gameObject)
		
	def Start() as void:
		stageCheckInstance = GameObject.FindObjectOfType(StageCheck)
		
		if stageCheckInstance is not null:
			stagePicked = stageCheckInstance.stagePicked
		
	def SetEnding(selected as EndEnum.Endings, statsImg as Sprite) as void:
		endPicked = selected
		statsSprite = statsImg
