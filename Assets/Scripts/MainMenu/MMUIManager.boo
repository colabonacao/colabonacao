import UnityEngine

class MMUIManager (MonoBehaviour): 

	public tutorialArea as GameObject
	public tutorialPrefab as GameObject
	
	public creditsArea as GameObject
	public creditsPrefab as GameObject
	
	public blackBackground as GameObject
	public mainMenu as GameObject
	public stageMenu as GameObject
	public stageDetailsMenu as GameObject
	
	public regionsMasks as (GameObject)
	
	public stageChosen as StageChosen
	
	public stageDetailsText as Text
		
	private tutorialObj as GameObject
	private creditsObj as GameObject
	
	private menuState as int = 0
	
	def Update() as void:
		if (Input.GetKeyDown(KeyCode.Escape)):
			if (menuState == 0):
				Application.Quit()
			elif (menuState == 1):
				StopStageSelect()
			elif (menuState == 2):
				StopStageSelectDetails()
			elif (menuState == 10):
				StartTutorial()
			elif (menuState == 11):
				StartCredits()
			else:
				Application.Quit()
				
	
	private def ChangeScene (sceneName as string):
		AutoFade.LoadLevel(sceneName, 0.2f, 0.1f, Color.black)
		PlayerPrefs.Save()
		
	def StartGame ():
		ChangeScene('Main Game')
		
	def StartStageSelect ():
		if (tutorialArea.activeSelf):
			StartTutorial()
		menuState = 1
		mainMenu.GetComponent[of Animator]().SetBool("slideOut", true)
		stageMenu.GetComponent[of Animator]().SetBool("slideOut", false)
		//blackBackground.GetComponent[of Animator]().SetBool("toFade", true)
		
	def StopStageSelect ():
		menuState = 0
		mainMenu.GetComponent[of Animator]().SetBool("slideOut", false)
		stageMenu.GetComponent[of Animator]().SetBool("slideOut", true)
		blackBackground.GetComponent[of Animator]().SetBool("toFade", false)
		
	def StartStageSelectDetails ():
		menuState = 2
		regionsMasks[stageChosen.stagePicked].SetActive(true)
		stageDetailsText.text = regionsMasks[stageChosen.stagePicked].GetComponent[of RegionDetails]().GetDetails()
		stageMenu.GetComponent[of Animator]().SetBool("slideOut", true)
		stageDetailsMenu.GetComponent[of Animator]().SetBool("slideOut", false)
		
	def StopStageSelectDetails ():
		menuState = 1
		stageMenu.GetComponent[of Animator]().SetBool("slideOut", false)
		stageDetailsMenu.GetComponent[of Animator]().SetBool("slideOut", true)
		regionsMasks[stageChosen.stagePicked].SetActive(false)
		
	def StartTutorial ():
		if (not tutorialArea.activeSelf):
			menuState = 10
			tutorialObj = Instantiate(tutorialPrefab as GameObject)
			tutorialObj.transform.SetParent(tutorialArea.transform, false)
			tutorialArea.SetActive(true)
		else:
			menuState = 0
			tutorialArea.SetActive(false)
			Destroy(tutorialObj)
			
	def StartCredits ():
		if (not creditsArea.activeSelf):
			menuState = 11
			creditsObj = Instantiate(creditsPrefab as GameObject)
			creditsObj.transform.SetParent(creditsArea.transform, false)
			creditsArea.SetActive(true)
			closeButton = creditsArea.FindObjectOfType(Button)
			closeButton.onClick.AddListener({StartCredits()})
		else:
			menuState = 0
			creditsArea.SetActive(false)
			Destroy(creditsObj)
	