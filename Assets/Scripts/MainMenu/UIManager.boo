import UnityEngine

class UIManager (MonoBehaviour): 

	def StartGame ():
		Application.LoadLevel('Main Game')
		
	def StartTutorial ():
		Application.LoadLevel('Tutorial')
	