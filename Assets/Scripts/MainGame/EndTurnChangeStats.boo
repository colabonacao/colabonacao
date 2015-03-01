import UnityEngine

class EndTurnChangeStats (MonoBehaviour): 
	
	public chartImage as Image
	public chartName as Text
	
	public stats as (StatisticsDetails)

	def Start():
		ShowStats(0)
		
	def SetStats(choice as int, image as Sprite, name as string):
		if (name != "") and (name is not null):
			stats[choice].chartName = name
		
	def ShowStats(choice as int):
		chartName.text = stats[choice].chartName

	