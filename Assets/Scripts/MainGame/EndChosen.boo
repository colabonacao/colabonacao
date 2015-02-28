import UnityEngine

class EndChosen (MonoBehaviour): 

	public finalStats as (single) = (0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f)
	public stagePicked as StageEnum.Stages = StageEnum.Stages.Brasilia
	public statsPie as GameObject = null
	
	def Awake() as void:
		DontDestroyOnLoad(transform.gameObject)
		
	def Start() as void:
		stageCheckInstance = GameObject.FindObjectOfType(StageCheck)
		
		if stageCheckInstance is not null:
			stagePicked = stageCheckInstance.stagePicked
		
	def SetEnding(stats as (single), statsImg as GameObject) as void:
		finalStats = stats
		statsPie = statsImg
