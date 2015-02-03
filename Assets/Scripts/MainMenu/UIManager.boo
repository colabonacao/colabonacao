import UnityEngine

class UIManager (MonoBehaviour): 

	def StartGame ():
		Application.LoadLevel('Main Game')
		PlayerPrefs.Save()
		
	def StartTutorial ():
		Application.LoadLevel('Tutorial')
		PlayerPrefs.Save()
	