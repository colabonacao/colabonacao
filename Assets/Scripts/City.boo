import UnityEngine
import Area

class City (MonoBehaviour): 
	public orcamentoinicial as single = 1000.0
	private areas as (Area)

	def Start ():
		areas = GameObject.FindObjectsOfType(Area)
	
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
		return orcamentoinicial - gasto
