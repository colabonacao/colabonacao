import UnityEngine

class UIManager (MonoBehaviour): 

	private def ChangeScene (sceneName as string):
		AutoFade.LoadLevel(sceneName, 0.2f, 0.1f, Color.black)
		PlayerPrefs.Save()
		
	def StartGame ():
		ChangeScene('Main Game')
		
	def StageSelect ():
		ChangeScene('StageSelect')
		
	def StartTutorial ():
		ChangeScene('Tutorial')
	