import UnityEngine

class UIManager (MonoBehaviour): 

	public tutorialArea as GameObject
	public tutorialPrefab as GameObject
		
	private tutorialObj as GameObject
	
	private def ChangeScene (sceneName as string):
		AutoFade.LoadLevel(sceneName, 0.2f, 0.1f, Color.black)
		PlayerPrefs.Save()
		
	def StartGame ():
		ChangeScene('Main Game')
		
	def StartStageSelect ():
		ChangeScene('StageSelect')
		
	def StartTutorial ():
		if (not tutorialArea.activeSelf):
			tutorialObj = Instantiate(tutorialPrefab as GameObject)
			tutorialObj.transform.SetParent(tutorialArea.transform, false)
			tutorialArea.SetActive(true)
		else:
			tutorialArea.SetActive(false)
			Destroy(tutorialObj)
	