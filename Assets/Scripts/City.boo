import UnityEngine
import Area

class City (MonoBehaviour): 
	private turn = 1
	public orcamento as (single)
	public MusicName as string
	private caixa as single
	private areas as (Area)
	private city as City

	def Start ():
		areas = GameObject.FindObjectsOfType(Area)
		caixa = orcamento[turn-1]/2
		generateRandomPlayers()
	
	def Update ():
		pass
		
	def getOrcamento() as single:
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
		
	public def getCaixa() as single:
		return caixa
		
	def newTurn():
		turn++
		caixa = orcamento[turn-1]/2
		
	def getTurn():
		return turn

	public def getMusicName():
		return MusicName
		
	def GenerateRandomValues(start as single,end as single,length as int) as (single):
		targets as (single) = array(single,length)

		for i in range(length):
			targets[i] = Random.Range(start, end)
		return targets
 		
	def generateRandomPlayers():
		playervals = []
		for i in range(7):
			randomnums = GenerateRandomValues(0,caixa,len(areas)*10)
			sum as single = 0.0F
			for j in range(len(areas)*10):
				sum += randomnums[j]
			factor = caixa/sum
			for j in randomnums:
				j = j*factor
			playervals.Add(randomnums)

		for a in range(len(areas)):
			playerlist = array(Player,7)
			for p in range(7):
				playerlist[p] = Player()
				playerlist[p].InvestimentoCultura = (playervals[p] as (single))[0+a*10]
				playerlist[p].InvestimentoEducacao = (playervals[p] as (single))[1+a*10]
				playerlist[p].InvestimentoEsporte = (playervals[p] as (single))[2+a*10]
				playerlist[p].InvestimentoInfraestrutura = (playervals[p] as (single))[3+a*10]
				playerlist[p].InvestimentoMeioAmbiente = (playervals[p] as (single))[4+a*10]
				playerlist[p].InvestimentoMobilidade = (playervals[p] as (single))[5+a*10]
				playerlist[p].InvestimentoAgropecuaria = (playervals[p] as (single))[6+a*10]
				playerlist[p].InvestimentoSaude = (playervals[p] as (single))[7+a*10]
				playerlist[p].InvestimentoTrabalho = (playervals[p] as (single))[8+a*10]
				playerlist[p].InvestimentoSeguranca = (playervals[p] as (single))[9+a*10]
			areas[a].setPlayers(playerlist)
			
	public def getInvestimentoCulturaPlayer(playernum) as single:
		total = 0.0F
		for a in areas:
			total += a.getPlayer(playernum).InvestimentoCultura
		return total
		
	public def getInvestimentoEducacaoPlayer(playernum) as single:
		total = 0.0F
		for a in areas:
			total += a.getPlayer(playernum).InvestimentoEducacao
		return total
		
	public def getInvestimentoEsportePlayer(playernum) as single:
		total = 0.0F
		for a in areas:
			total += a.getPlayer(playernum).InvestimentoEsporte
		return total
		
	public def getInvestimentoInfraestruturaPlayer(playernum) as single:
		total = 0.0F
		for a in areas:
			total += a.getPlayer(playernum).InvestimentoInfraestrutura
		return total
		
	public def getInvestimentoMeioAmbientePlayer(playernum) as single:
		total = 0.0F
		for a in areas:
			total += a.getPlayer(playernum).InvestimentoMeioAmbiente
		return total
		
	public def getInvestimentoMobilidadePlayer(playernum) as single:
		total = 0.0F
		for a in areas:
			total += a.getPlayer(playernum).InvestimentoMobilidade
		return total
		
	public def getInvestimentoAgropecuariaPlayer(playernum) as single:
		total = 0.0F
		for a in areas:
			total += a.getPlayer(playernum).InvestimentoAgropecuaria
		return total
		
	public def getInvestimentoSaudePlayer(playernum) as single:
		total = 0.0F
		for a in areas:
			total += a.getPlayer(playernum).InvestimentoSaude
		return total
		
	public def getInvestimentoTrabalhoPlayer(playernum) as single:
		total = 0.0F
		for a in areas:
			total += a.getPlayer(playernum).InvestimentoTrabalho
		return total
		
	public def getInvestimentoSegurancaPlayer(playernum) as single:
		total = 0.0F
		for a in areas:
			total += a.getPlayer(playernum).InvestimentoSeguranca
		return total
		
	public def getInvestimentoDisponivelPlayer(playernum) as single:
		gasto = 0.0F
		for a in areas:
			gasto += a.getPlayer(playernum).InvestimentoCultura
			gasto += a.getPlayer(playernum).InvestimentoEducacao
			gasto += a.getPlayer(playernum).InvestimentoEsporte
			gasto += a.getPlayer(playernum).InvestimentoInfraestrutura
			gasto += a.getPlayer(playernum).InvestimentoMeioAmbiente
			gasto += a.getPlayer(playernum).InvestimentoMobilidade
			gasto += a.getPlayer(playernum).InvestimentoAgropecuaria
			gasto += a.getPlayer(playernum).InvestimentoSaude
			gasto += a.getPlayer(playernum).InvestimentoTrabalho
			gasto += a.getPlayer(playernum).InvestimentoSeguranca
		Debug.Log(caixa-gasto)
		return caixa-gasto


