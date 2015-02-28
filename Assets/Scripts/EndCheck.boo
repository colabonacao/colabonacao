import UnityEngine

class EndCheck (MonoBehaviour): 

	public endPicked as EndEnum.Endings = EndEnum.Endings.Success
	public stagePicked as StageEnum.Stages = StageEnum.Stages.Brasilia
	public statsSprite as Sprite = null
	public stageChosen as StageChosen = null
	
	public endings as (EndingsDetails)
	
	public statisticsText as Text
	public statisticsImage as Image
	public endingAnim as GameObject
	
	def Awake ():
		EndChosenInstance = GameObject.FindObjectOfType(EndChosen)
		
		if EndChosenInstance is not null:
			endPicked = EndChosenInstance.endPicked
			stagePicked = EndChosenInstance.stagePicked
			statsSprite = EndChosenInstance.statsSprite
			
			Destroy(EndChosenInstance.gameObject)
			
		if stageChosen is not null:
			stageChosen.stagePicked = stagePicked
			
		SetEnding()
			
	def SetEnding():
		statisticsText.text = endings[endPicked].resultText
		statisticsImage.sprite = statsSprite
		anim = Instantiate(endings[endPicked].resultAnim as GameObject)
		anim.transform.SetParent(endingAnim.transform, false)
		
	