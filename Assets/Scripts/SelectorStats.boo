import UnityEngine
import UnityEngine.UI
import PieChartMeshController
import City

class SelectorStats (MonoBehaviour):
	
	private selections = ["Resumo Geral","Você","Jogador 2","Jogador 3","Jogador 4","Jogador 5","Jogador 6","Jogador 7","Jogador 8"]
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
			setPieChartValues(index-1)
		else:
			setPieChartGeneral()
			
	def previousselection():
		index = ((index - 1) < 0) and (len(selections)-1) or (index-1)
		textbox.text = selections[index]
		if (index >= 1):
			setPieChartValues(index -1)
		
	def setPieChartValues(player):
		piechart.setValues((
		((city.getInvestimentoAgropecuariaPlayer(player,-2))/city.getCaixa()),\
		((city.getInvestimentoCulturaPlayer(player,-2))/city.getCaixa()),\
		((city.getInvestimentoEducacaoPlayer(player,-2))/city.getCaixa()),\
		((city.getInvestimentoEsportePlayer(player,-2))/city.getCaixa()),\
		((city.getInvestimentoInfraestruturaPlayer(player,-2))/city.getCaixa()),\
		((city.getInvestimentoMeioAmbientePlayer(player,-2))/city.getCaixa()),\
		((city.getInvestimentoMobilidadePlayer(player,-2))/city.getCaixa()),\
		((city.getInvestimentoSaudePlayer(player,-2))/city.getCaixa()),\
		((city.getInvestimentoSegurancaPlayer(player,-2))/city.getCaixa()),\
		((city.getInvestimentoTrabalhoPlayer(player,-2))/city.getCaixa()),
		((city.getInvestimentoDisponivelPlayer(player,-2))/city.getCaixa())))
		
	def setPieChartGeneral():
		piechart.setValues((
		((city.getInvestimentoAgropecuariaTotal(-2))/(city.getCaixa()*8)),\
		((city.getInvestimentoCulturaTotal(-2))/(city.getCaixa()*8)),\
		((city.getInvestimentoEducacaoTotal(-2))/(city.getCaixa()*8)),\
		((city.getInvestimentoEsporteTotal(-2))/(city.getCaixa()*8)),\
		((city.getInvestimentoInfraestruturaTotal(-2))/(city.getCaixa()*8)),\
		((city.getInvestimentoMeioAmbienteTotal(-2))/(city.getCaixa()*8)),\
		((city.getInvestimentoMobilidadeTotal(-2))/(city.getCaixa()*8)),\
		((city.getInvestimentoSaudeTotal(-2))/(city.getCaixa()*8)),\
		((city.getInvestimentoSegurancaTotal(-2))/(city.getCaixa()*8)),\
		((city.getInvestimentoTrabalhoTotal(-2))/(city.getCaixa()*8)),
		((city.getInvestimentoDisponivelTotal(-2))/(city.getCaixa()*8))))
	
	
		
