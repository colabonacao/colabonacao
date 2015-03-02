import UnityEngine
import UnityEngine.UI

class StatsPopup (RegularPopup): 
	
	public piechart as PieChartMeshController 
	private city as City = null

	override def initialize():
		super()
		city = GameObject.FindObjectOfType(City) as City
		
	def ShowStats(choice as int):
		if city == null:
			city = GameObject.FindObjectOfType(City) as City
		setPieChartGeneral()
		
	def setPieChartGeneral():
		piechart.setValues((
		((city.getInvestimentoAgropecuariaAllTurns())/(city.getCaixaAllTurns()*8)),\
		((city.getInvestimentoCulturaAllTurns())/(city.getCaixaAllTurns()*8)),\
		((city.getInvestimentoEducacaoAllTurns())/(city.getCaixaAllTurns()*8)),\
		((city.getInvestimentoEsporteAllTurns())/(city.getCaixaAllTurns()*8)),\
		((city.getInvestimentoInfraestruturaAllTurns())/(city.getCaixaAllTurns()*8)),\
		((city.getInvestimentoMeioAmbienteAllTurns())/(city.getCaixaAllTurns()*8)),\
		((city.getInvestimentoMobilidadeAllTurns())/(city.getCaixaAllTurns()*8)),\
		((city.getInvestimentoSaudeAllTurns())/(city.getCaixaAllTurns()*8)),\
		((city.getInvestimentoSegurancaAllTurns())/(city.getCaixaAllTurns()*8)),\
		((city.getInvestimentoTrabalhoAllTurns())/(city.getCaixaAllTurns()*8)),
		((city.getInvestimentoDisponivelAllTurns())/(city.getCaixaAllTurns()*8))))
		
	override def dismiss():
		super()
		
	override def invoke():
		super()
		ShowStats(0)
	
	