import UnityEngine
import UnityEngine.UI

class EndTurnPopup (RegularPopup): 
	
	private selections = ["Resumo Geral","Você","Jogador 2","Jogador 3","Jogador 4","Jogador 5","Jogador 6","Jogador 7","Jogador 8"]
	public piechart as PieChartMeshController 
	public chartName as Text
	public ContinueButtonText as Text
	public timer as Date
	private city as City = null

	override def initialize():
		super()
		city = GameObject.FindObjectOfType(City) as City
		
	def ShowStats(choice as int):
		if city == null:
			city = GameObject.FindObjectOfType(City) as City
		chartName.text = selections[choice]
		if choice >= 1:
			setPieChartValues(choice-1)
		else:
			setPieChartGeneral()
			
	def setPieChartValues(player):
		piechart.setValues((
		((city.getInvestimentoAgropecuariaPlayer(player,-1))/city.getCaixa()),\
		((city.getInvestimentoCulturaPlayer(player,-1))/city.getCaixa()),\
		((city.getInvestimentoEducacaoPlayer(player,-1))/city.getCaixa()),\
		((city.getInvestimentoEsportePlayer(player,-1))/city.getCaixa()),\
		((city.getInvestimentoInfraestruturaPlayer(player,-1))/city.getCaixa()),\
		((city.getInvestimentoMeioAmbientePlayer(player,-1))/city.getCaixa()),\
		((city.getInvestimentoMobilidadePlayer(player,-1))/city.getCaixa()),\
		((city.getInvestimentoSaudePlayer(player,-1))/city.getCaixa()),\
		((city.getInvestimentoSegurancaPlayer(player,-1))/city.getCaixa()),\
		((city.getInvestimentoTrabalhoPlayer(player,-1))/city.getCaixa()),
		((city.getInvestimentoDisponivelPlayer(player,-1))/city.getCaixa())))
		
	def setPieChartGeneral():
		piechart.setValues((
		((city.getInvestimentoAgropecuariaTotal(-1))/(city.getCaixa()*8)),\
		((city.getInvestimentoCulturaTotal(-1))/(city.getCaixa()*8)),\
		((city.getInvestimentoEducacaoTotal(-1))/(city.getCaixa()*8)),\
		((city.getInvestimentoEsporteTotal(-1))/(city.getCaixa()*8)),\
		((city.getInvestimentoInfraestruturaTotal(-1))/(city.getCaixa()*8)),\
		((city.getInvestimentoMeioAmbienteTotal(-1))/(city.getCaixa()*8)),\
		((city.getInvestimentoMobilidadeTotal(-1))/(city.getCaixa()*8)),\
		((city.getInvestimentoSaudeTotal(-1))/(city.getCaixa()*8)),\
		((city.getInvestimentoSegurancaTotal(-1))/(city.getCaixa()*8)),\
		((city.getInvestimentoTrabalhoTotal(-1))/(city.getCaixa()*8)),
		((city.getInvestimentoDisponivelTotal(-1))/(city.getCaixa()*8))))
		
	override def dismiss():
		super()
		timer.setPaused(false)
		timer.reset()
		city.newTurn()
		
	override def invoke():
		super()
		ShowStats(0)
		results = MySQLResults()
		results = FindObjectOfType(MySQLResults)
		areas = GameObject.FindObjectsOfType(Area) as (Area)
		valores as Dictionary[of string, double] = Dictionary[of string, double]()

		valores.Add("cultura", city.getInvestimentoCulturaPlayer(0,areas[0].turns.Count-1))
		valores.Add("educacao", city.getInvestimentoEducacaoPlayer(0,areas[0].turns.Count-1))
		valores.Add("esporte", city.getInvestimentoEsportePlayer(0,areas[0].turns.Count-1))
		valores.Add("infraestrutura", city.getInvestimentoInfraestruturaPlayer(0,areas[0].turns.Count-1))
		valores.Add("meioAmbiente", city.getInvestimentoMeioAmbientePlayer(0,areas[0].turns.Count-1))
		valores.Add("mobilidade", city.getInvestimentoMobilidadePlayer(0,areas[0].turns.Count-1))
		valores.Add("agropecuaria", city.getInvestimentoAgropecuariaPlayer(0,areas[0].turns.Count-1))
		valores.Add("saude", city.getInvestimentoSaudePlayer(0,areas[0].turns.Count-1))
		valores.Add("trabalho", city.getInvestimentoTrabalhoPlayer(0,areas[0].turns.Count-1))
		valores.Add("seguranca", city.getInvestimentoSegurancaPlayer(0,areas[0].turns.Count-1))
		results.dataJogada.Add(System.DateTime.Now)
		results.investimentoTurnos.Add(city.getTurn(), valores)
		if(results.investimentoTurnos.Count == 4):
			StartCoroutine(results.BuildData(city.name, "Intermediario"))
		
		timer.setPaused(true)
		if (city.getTurn()+1) == city.getMaxTurns()-1:
			ContinueButtonText.text = "Último Turno"
		elif (city.getTurn()+1) >= city.getMaxTurns():
			ContinueButtonText.text = "Fim de Jogo"
		else:
			ContinueButtonText.text = "Ir para turno $(city.getTurn()+2)"
	