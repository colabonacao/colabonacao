import UnityEngine

class RegionDetails (MonoBehaviour): 

	public statistics as string = ""
	public history as string = ""
	private stageDetails as string = "<size=30>Estatísticas</size>\n\n[statsText]\n\n<size=30>História</size>\n\n[histText]"
	
	def Awake():
		stageDetails = stageDetails.Replace("[statsText]", statistics)
		stageDetails = stageDetails.Replace("[histText]", history)
		
	def GetDetails() as string:
		return stageDetails
	