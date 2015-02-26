import UnityEngine

class StageChosen (MonoBehaviour): 

	public stagePicked as StageEnum.Stages = StageEnum.Stages.Brasilia
	
	def Awake() as void:
		DontDestroyOnLoad(transform.gameObject)
		
	def SetStage(selected as int) as void:
		stagePicked = selected
