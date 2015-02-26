import UnityEngine

class StageCheck (MonoBehaviour): 

	public stagePicked as StageEnum.Stages = StageEnum.Stages.Brasilia
	
	def Awake ():
		
		StageChosenInstance = GameObject.FindObjectOfType(StageChosen)
		
		if StageChosenInstance is not null:
			stagePicked = StageChosenInstance.stagePicked
			Destroy(StageChosenInstance.gameObject)
	