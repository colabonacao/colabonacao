import UnityEngine

class UIManager (MonoBehaviour): 

	public tutorialArea as GameObject
	public tutorialPrefab as GameObject
	
	public blackBackground as GameObject
	public mainMenu as GameObject
	public stageMenu as GameObject
	public stageDetailsMenu as GameObject
	
	public regionsMasks as (GameObject)
	
	public stageChosen as StageChosen
	
	public statisticsText as Text
	public historyText as Text
		
	private tutorialObj as GameObject
	
	private def ChangeScene (sceneName as string):
		AutoFade.LoadLevel(sceneName, 0.2f, 0.1f, Color.black)
		PlayerPrefs.Save()
		
	def StartGame ():
		ChangeScene('Main Game')
		
	def StartStageSelect ():
		if (tutorialArea.activeSelf):
			StartTutorial()
		mainMenu.GetComponent[of Animator]().SetBool("slideOut", true)
		stageMenu.GetComponent[of Animator]().SetBool("slideOut", false)
		blackBackground.GetComponent[of Animator]().SetBool("toFade", true)
		
	def StopStageSelect ():
		mainMenu.GetComponent[of Animator]().SetBool("slideOut", false)
		stageMenu.GetComponent[of Animator]().SetBool("slideOut", true)
		blackBackground.GetComponent[of Animator]().SetBool("toFade", false)
		
	def StartStageSelectDetails ():
		statisticsText.text = regionsMasks[stageChosen.stagePicked].GetComponent[of RegionDetails]().statistics
		historyText.text = regionsMasks[stageChosen.stagePicked].GetComponent[of RegionDetails]().history
		stageMenu.GetComponent[of Animator]().SetBool("slideOut", true)
		stageDetailsMenu.GetComponent[of Animator]().SetBool("slideOut", false)
		regionsMasks[stageChosen.stagePicked].GetComponent[of Animator]().SetBool("toFade", false)
		
	def StopStageSelectDetails ():
		stageMenu.GetComponent[of Animator]().SetBool("slideOut", false)
		stageDetailsMenu.GetComponent[of Animator]().SetBool("slideOut", true)
		for region as GameObject in regionsMasks:
			region.GetComponent[of Animator]().SetBool("toFade", true)
		
	def StartTutorial ():
		if (not tutorialArea.activeSelf):
			tutorialObj = Instantiate(tutorialPrefab as GameObject)
			tutorialObj.transform.SetParent(tutorialArea.transform, false)
			tutorialArea.SetActive(true)
		else:
			tutorialArea.SetActive(false)
			Destroy(tutorialObj)
	