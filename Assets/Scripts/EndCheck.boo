import UnityEngine

class EndCheck (MonoBehaviour): 

	public finalStats as (single) = (0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f)
	public stagePicked as StageEnum.Stages = StageEnum.Stages.Brasilia
	public statsPie as GameObject = null
	public stageChosen as StageChosen = null
	
	public statisticsText as Text
	public statisticsPieArea as GameObject
	public endingAnim as (GameObject)
	
	private endEnumInstance as EndEnum
	
	def Awake ():
		EndChosenInstance = GameObject.FindObjectOfType(EndChosen)
		endEnumInstance = GameObject.FindObjectOfType(EndEnum)
		
		if EndChosenInstance is not null:
			finalStats = EndChosenInstance.finalStats
			stagePicked = EndChosenInstance.stagePicked
			statsPie = EndChosenInstance.statsPie
			
			Destroy(EndChosenInstance.gameObject)
			
		if stageChosen is not null:
			stageChosen.stagePicked = stagePicked
			
		SetEnding()
			
	def SetEnding():
		resultsText as string = ""
		if (finalStats[0] < 0.45f):
			if (finalStats[0] < 0.20f):
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailAgro]
			else:
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailAgro]
		elif (finalStats[1] < 0.45f):
			if (finalStats[1] < 0.20f):
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailCult]
			else:
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailCult]
		elif (finalStats[2] < 0.45f):
			if (finalStats[2] < 0.20f):
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailEdu]
			else:
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailEdu]
		elif (finalStats[3] < 0.45f):
			if (finalStats[3] < 0.20f):
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailEsp]
			else:
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailEsp]
		elif (finalStats[4] < 0.45f):
			if (finalStats[4] < 0.20f):
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailInfra]
			else:
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailInfra]
		elif (finalStats[5] < 0.45f):
			if (finalStats[5] < 0.20f):
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailMeio]
			else:
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailMeio]
		elif (finalStats[6] < 0.45f):
			if (finalStats[6] < 0.20f):
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailMobi]
			else:
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailMobi]
		elif (finalStats[7] < 0.45f):
			if (finalStats[7] < 0.20f):
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailSaude]
			else:
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailSaude]
		elif (finalStats[8] < 0.45f):
			if (finalStats[8] < 0.20f):
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailSeg]
			else:
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailSeg]
		elif (finalStats[9] < 0.45f):
			if (finalStats[9] < 0.20f):
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailTrab]
			else:
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailTrab]
				
		
		statisticsText.text = resultsText
		//statisticsImage.sprite = statsSprite
		//anim = Instantiate(endings[endPicked].resultAnim as GameObject)
		//anim.transform.SetParent(endingAnim.transform, false)
		
	