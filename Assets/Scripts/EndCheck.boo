import UnityEngine

class EndCheck (MonoBehaviour): 

	private city as City
	private news as NewsScroll
	public stagePicked as StageEnum.Stages = StageEnum.Stages.Brasilia
	public statsPie as GameObject = null
	public stageChosen as StageChosen = null
	
	public statisticsText as Text
	public statisticsPieArea as GameObject
	public endingAnim as (GameObject)
	
	private endEnumInstance as EndEnum
	
	def Awake ():
		EndChosenInstance = GameObject.FindObjectOfType(EndChosen)
		endEnumInstance = GameObject.FindObjectOfType(EndEnum)
		
		if EndChosenInstance is not null:
			city = EndChosenInstance.getCity()
			news = EndChosenInstance.getNews()
			stagePicked = EndChosenInstance.getStagePicked()
			city.transform.SetParent(gameObject.transform, false)
			news.transform.SetParent(gameObject.transform, false)
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
		elif partialsuccess:
			endingAnim[1].SetActive(true)
			resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.SuccessModerate]
		elif partialsuccess:
			endingAnim[2].SetActive(true)
			resultsText = resultsText + endEnumInstance.endingsText[endEnumInstance.Endings.SuccessSmall]
		elif partialfail:
			endingAnim[3].SetActive(true)
		elif chaoticfail:
			endingAnim[4].SetActive(true)
			
		statisticsText.text = resultsText
		//statisticsImage.sprite = statsSprite
		//anim = Instantiate(endings[endPicked].resultAnim as GameObject)
		//anim.transform.SetParent(endingAnim.transform, false)
		
	