import UnityEngine

class EndCheck (MonoBehaviour): 

	private city as City
	public stagePicked as StageEnum.Stages = StageEnum.Stages.Brasilia
	public statsPie as GameObject = null
	public stageChosen as StageChosen = null
	
	public statisticsText as Text
	public statisticsPieArea as GameObject
	public endingAnim as (GameObject)
	
	public audioManager as AudioManager
	
	private endEnumInstance as EndEnum
	
	private InvestimentoAgropecuariaMod as single = 0.0F
	private InvestimentoCulturaMod as single = 0.0F
	private InvestimentoEducacaoMod as single = 0.0F
	private InvestimentoEsporteMod as single = 0.0F
	private InvestimentoInfraestruturaMod as single = 0.0F
	private InvestimentoMeioAmbienteMod as single = 0.0F
	private InvestimentoMobilidadeMod as single = 0.0F
	private InvestimentoSaudeMod as single = 0.0F
	private InvestimentoSegurancaMod as single = 0.0F
	private InvestimentoTrabalhoMod as single = 0.0F
	
	def Awake ():
		EndChosenInstance = GameObject.FindObjectOfType(EndChosen)
		endEnumInstance = GameObject.FindObjectOfType(EndEnum)
		
		if EndChosenInstance is not null:
			city = EndChosenInstance.getCity()
			stagePicked = EndChosenInstance.getStagePicked()
			city.transform.SetParent(gameObject.transform, false)
			Destroy(EndChosenInstance.gameObject)
			
		if stageChosen is not null:
			stageChosen.stagePicked = stagePicked
			
		SetEnding()

	def checkAbsoluteSuccess() as bool:
		caixaAllTurns = city.getCaixaAllTurns() * 8
		InvestmentAvailable = caixaAllTurns / 10
		InvestmentAvailablePerAreaCategory = InvestmentAvailable/len(city.getAreas())
		absolutesuccess = true
		//sucesso absoluto
		for a in city.getAreas():
			if not absolutesuccess:
				break
			total = 0.0F
			for i in range(8):
				for t in range(city.getTurn()):
					total += a.getInvestimentoCulturaPlayer(i,t)
			if total/InvestmentAvailablePerAreaCategory < 0.5:
				absolutesuccess = false
				break
			total = 0.0F
			for i in range(8):
				for t in range(city.getTurn()):
					total += a.getInvestimentoAgropecuariaPlayer(i,t)
			if total/InvestmentAvailablePerAreaCategory < 0.5:
				absolutesuccess = false
				break
			total = 0.0F
			for i in range(8):
				for t in range(city.getTurn()):
					total += a.getInvestimentoEducacaoPlayer(i,t)
			if total/InvestmentAvailablePerAreaCategory < 0.5:
				absolutesuccess = false
				break
			total = 0.0F
			for i in range(8):
				for t in range(city.getTurn()):
					total += a.getInvestimentoEsportePlayer(i,t)
			if total/InvestmentAvailablePerAreaCategory < 0.5:
				absolutesuccess = false
				break
			total = 0.0F
			for i in range(8):
				for t in range(city.getTurn()):
					total += a.getInvestimentoInfraestruturaPlayer(i,t)
			if total/InvestmentAvailablePerAreaCategory < 0.5:
				absolutesuccess = false
				break
			total = 0.0F
			for i in range(8):
				for t in range(city.getTurn()):
					total += a.getInvestimentoMeioAmbientePlayer(i,t)
			if total/InvestmentAvailablePerAreaCategory < 0.5:
				absolutesuccess = false
				break
			total = 0.0F
			for i in range(8):
				for t in range(city.getTurn()):
					total += a.getInvestimentoMobilidadePlayer(i,t)
			if total/InvestmentAvailablePerAreaCategory < 0.5:
				absolutesuccess = false
				break
			total = 0.0F
			for i in range(8):
				for t in range(city.getTurn()):
					total += a.getInvestimentoSaudePlayer(i,t)
			if total/InvestmentAvailablePerAreaCategory < 0.5:
				absolutesuccess = false
				break
			total = 0.0F
			for i in range(8):
				for t in range(city.getTurn()):
					total += a.getInvestimentoSegurancaPlayer(i,t)
			if total/InvestmentAvailablePerAreaCategory < 0.5:
				absolutesuccess = false
				break
			total = 0.0F
			for i in range(8):
				for t in range(city.getTurn()):
					total += a.getInvestimentoTrabalhoPlayer(i,t)
			if total/InvestmentAvailablePerAreaCategory < 0.5:
				absolutesuccess = false
				break
		return absolutesuccess
		
	def SetEnding():
		resultsText as string = ""
		caixaAllTurns = city.getCaixaAllTurns() * 8
		InvestmentAvailable = caixaAllTurns / 10
		InvestmentAvailablePerAreaCategory = InvestmentAvailable/len(city.getAreas())
		
		absolutesuccess = checkAbsoluteSuccess()

		partialsuccess = true
		initialsuccess = false
		partialfail = false
		chaoticfail = false
		
		//modifier data is being calculated, but not used yet
		/*
		for n as News in news.getNews():
			if n.getModifier() != null and n.getModifier().investment != "":
				investment = n.getModifier().investment
				if investment == "agropecuaria":
					InvestimentoAgropecuariaMod += n.getModifier().mod
				if investment == "cultura":
					InvestimentoCulturaMod += n.getModifier().mod
				if investment == "educacao":
					InvestimentoEducacaoMod += n.getModifier().mod
				if investment == "esporte":
					InvestimentoEsporteMod += n.getModifier().mod
				if investment == "infraestrutura":
					InvestimentoInfraestruturaMod += n.getModifier().mod
				if investment == "meioambiente":
					InvestimentoMeioAmbienteMod += n.getModifier().mod
				if investment == "mobilidade":
					InvestimentoMobilidadeMod += n.getModifier().mod
				if investment == "saude":
					InvestimentoSaudeMod += n.getModifier().mod
				if investment == "seguranca":
					InvestimentoSegurancaMod += n.getModifier().mod
				if investment == "trabalho":
					InvestimentoTrabalhoMod += n.getModifier().mod
		*/
					
		x = city.getInvestimentoAgropecuariaAllTurns()/InvestmentAvailable
		if (x < 0.45f):
			partialsuccess = false
			if (x < 0.20f):
				chaoticfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailAgro]
			else:
				partialfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailAgro]
		else:
			if (x < 0.5f):
				partialsuccess = false
				
		x = city.getInvestimentoCulturaAllTurns()/InvestmentAvailable
		if (x < 0.45f):
			partialsuccess = false
			if (x < 0.20f):
				chaoticfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailCult]
			else:
				partialfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailCult]
		else:
			if (x < 0.5f):
				partialsuccess = false		
				
		x = city.getInvestimentoEducacaoAllTurns()/InvestmentAvailable
		if (x < 0.45f):
			partialsuccess = false
			if (x < 0.20f):
				chaoticfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailEdu]
			else:
				partialfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailEdu]
		else:
			if (x < 0.5f):
				partialsuccess = false		
				
				
		x = city.getInvestimentoEsporteAllTurns()/InvestmentAvailable
		if (x < 0.45f):
			partialsuccess = false
			if (x < 0.20f):
				chaoticfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailEsp]
			else:
				partialfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailEsp]
		else:
			if (x < 0.5f):
				partialsuccess = false		
				
				
		x = city.getInvestimentoInfraestruturaAllTurns()/InvestmentAvailable
		if (x < 0.45f):
			partialsuccess = false
			if (x < 0.20f):
				chaoticfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailInfra]
			else:
				partialfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailInfra]
		else:
			if (x < 0.5f):
				partialsuccess = false		
				
				
		x = city.getInvestimentoMeioAmbienteAllTurns()/InvestmentAvailable
		if (x < 0.45f):
			partialsuccess = false
			if (x < 0.20f):
				chaoticfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailMeio]
			else:
				partialfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailMeio]
		else:
			if (x < 0.5f):
				partialsuccess = false		
				
				
		x = city.getInvestimentoMobilidadeAllTurns()/InvestmentAvailable
		if (x < 0.45f):
			partialsuccess = false
			if (x < 0.20f):
				chaoticfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailMobi]
			else:
				partialfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailMobi]
		else:
			if (x < 0.5f):
				partialsuccess = false		
				
				
		x = city.getInvestimentoSaudeAllTurns()/InvestmentAvailable
		if (x < 0.45f):
			partialsuccess = false
			if (x < 0.20f):
				chaoticfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailSaude]
			else:
				partialfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailSaude]
		else:
			if (x < 0.5f):
				partialsuccess = false		
				
				
		x = city.getInvestimentoSegurancaAllTurns()/InvestmentAvailable
		if (x < 0.45f):
			partialsuccess = false
			if (x < 0.20f):
				chaoticfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailSeg]
			else:
				partialfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailSeg]
		else:
			if (x < 0.5f):
				partialsuccess = false		
				
				
		x = city.getInvestimentoTrabalhoAllTurns()/InvestmentAvailable
		if (x < 0.45f):
			partialsuccess = false
			if (x < 0.20f):
				chaoticfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.CriticalFailTrab]
			else:
				partialfail = true
				resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.FailTrab]
		else:
			if (x < 0.5f):
				partialsuccess = false		
				
				
		if not (partialsuccess or partialfail or chaoticfail):
			initialsuccess = true
		
		if absolutesuccess:
			endingAnim[0].SetActive(true)
			resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.SuccessComplete]
			audioManager.PlayMusic(endingAnim[0].GetComponent[of AnimMusic]().musicName)
		elif partialsuccess:
			endingAnim[1].SetActive(true)
			resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.SuccessModerate]
			audioManager.PlayMusic(endingAnim[1].GetComponent[of AnimMusic]().musicName)
		elif initialsuccess:
			endingAnim[2].SetActive(true)
			resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.SuccessSmall]
			audioManager.PlayMusic(endingAnim[2].GetComponent[of AnimMusic]().musicName)
		elif partialfail:
			endingAnim[3].SetActive(true)
			audioManager.PlayMusic(endingAnim[3].GetComponent[of AnimMusic]().musicName)
		elif chaoticfail:
			endingAnim[4].SetActive(true)
			audioManager.PlayMusic(endingAnim[4].GetComponent[of AnimMusic]().musicName)
			
		statisticsText.text = resultsText
		//statisticsImage.sprite = statsSprite
		//anim = Instantiate(endings[endPicked].resultAnim as GameObject)
		//anim.transform.SetParent(endingAnim.transform, false)
		
	