import UnityEngine
import Area

class City (MonoBehaviour): 
	private turn = 1
	public orcamento as (single)
	private caixa as single
	private areas as (Area)
	private city as City

	def Start ():
		areas = GameObject.FindObjectsOfType(Area)
		caixa = orcamento[turn-1]/2
	
	def Update ():
		pass
		
	def getOrcamento():
		gasto = 0
		for a in areas:
			gasto += a.InvestimentoCultura
			gasto += a.InvestimentoEducacao
			gasto += a.InvestimentoEsporte
			gasto += a.InvestimentoInfraestrutura
			gasto += a.InvestimentoMeioAmbiente
			gasto += a.InvestimentoMobilidade
			gasto += a.InvestimentoAgropecuaria
			gasto += a.InvestimentoSaude
			gasto += a.InvestimentoTrabalho
			gasto += a.InvestimentoSeguranca
		return caixa - gasto
		
	def newTurn():
		turn++
		caixa = orcamento[turn-1]/2
		
	def getTurn():
		return turn
