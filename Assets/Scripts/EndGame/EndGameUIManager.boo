import UnityEngine

class EndGameUIManager (MonoBehaviour): 
	
	public stageChosen as StageChosen
	
	private def ChangeScene (sceneName as string):
		AutoFade.LoadLevel(sceneName, 0.2f, 0.1f, Color.black)
		
	def StartGame ():
		ChangeScene('Main Game')
		
	def StartMenu ():
		Destroy(stageChosen.gameObject)
		ChangeScene('MainMenu')
		