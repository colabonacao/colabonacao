import UnityEngine

class StageChosen (MonoBehaviour): 

	public stagePicked as StageEnum.Stages = 0
	
	def Awake() as void:
		DontDestroyOnLoad(transform.gameObject)
		
	def SetStage(selected as int) as void:
		stagePicked = selected
