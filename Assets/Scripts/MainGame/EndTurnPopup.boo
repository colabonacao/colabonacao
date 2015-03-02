import UnityEngine
import UnityEngine.UI

class EndTurnPopup (RegularPopup): 
	
	private selections = ["Resumo Geral","Você","Jogador 2","Jogador 3","Jogador 4","Jogador 5","Jogador 6","Jogador 7","Jogador 8"]
	public piechart as PieChartMeshController 
	public chartName as Text
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
		city.newTurn()
		
	override def invoke():
		super()
		ShowStats(0)
	
	