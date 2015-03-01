import UnityEngine
import UnityEngine.UI
import PieChartMeshController
import City

class SelectorStats (MonoBehaviour):
	
	private selections = ["Resumo Geral","Jogador 1","Jogador 2","Jogador 3","Jogador 4","Jogador 5","Jogador 6","Jogador 7"]
	private textbox as Text
	private index = 0
	public piechart as PieChartMeshController
	private city as City = null
	
	def Start ():
		textbox = gameObject.GetComponentInChildren[of Text]()
		city = GameObject.FindObjectOfType(City) as City
	
	def Update ():
		pass
		
	def nextselection():
		index = (index + 1) % len(selections)
		textbox.text = selections[index]
		if (index >= 1):
			setPieChartValues(index - 1)
		
	def previousselection():
		index = ((index - 1) < 0) and (len(selections)-1) or (index-1)
		textbox.text = selections[index]
		if (index >= 1):
			setPieChartValues(index - 1)
		
	def setPieChartValues(player):
		piechart.setValues((
		((city.getInvestimentoAgropecuariaPlayer(player))/city.getCaixa())*100.0F,\
		((city.getInvestimentoCulturaPlayer(player))/city.getCaixa())*100.0F,\
		((city.getInvestimentoEducacaoPlayer(player))/city.getCaixa())*100.0F,\
		((city.getInvestimentoEsportePlayer(player))/city.getCaixa())*100.0F,\
		((city.getInvestimentoInfraestruturaPlayer(player))/city.getCaixa())*100.0F,\
		((city.getInvestimentoMeioAmbientePlayer(player))/city.getCaixa())*100.0F,\
		((city.getInvestimentoMobilidadePlayer(player))/city.getCaixa())*100.0F,\
		((city.getInvestimentoSaudePlayer(player))/city.getCaixa())*100.0F,\
		((city.getInvestimentoSegurancaPlayer(player))/city.getCaixa())*100.0F,\
		((city.getInvestimentoTrabalhoPlayer(player))/city.getCaixa())*100.0F,
		((city.getInvestimentoDisponivelPlayer(player))/city.getCaixa())*100.0F))
		
