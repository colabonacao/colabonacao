import UnityEngine
import Area

class City (MonoBehaviour): 
	private turn as int = 0
	private maxturns = 4
	public orcamento as (single)
	public MusicName as string
	private caixa as single
	private areas as (Area)
	private city as City
	private gotoending = false

	def Start ():
		areas = GameObject.FindObjectsOfType(Area)
		t = turn/2
		caixa = orcamento[t]/2
		generateRandomPlayers()
	
	def Update ():
		//pass
		if gotoending:
			newTurn()
			
	def getAreas():
		return areas
		
	def getOrcamento() as single:
		gasto = 0
		for a in areas:
			gasto += a.getInvestimentoCultura()
			gasto += a.getInvestimentoEducacao()
			gasto += a.getInvestimentoEsporte()
			gasto += a.getInvestimentoInfraestrutura()
			gasto += a.getInvestimentoMeioAmbiente()
			gasto += a.getInvestimentoMobilidade()
			gasto += a.getInvestimentoAgropecuaria()
			gasto += a.getInvestimentoSaude()
			gasto += a.getInvestimentoTrabalho()
			gasto += a.getInvestimentoSeguranca()
		return caixa - gasto
		
	public def getCaixa() as single:
		return caixa
		
	def newTurn():
		turn++
		if turn >= getMaxTurns():
			gotoending = false
			(GameObject.FindObjectOfType(EndChosen) as EndChosen).setEnding()
			return
		t = turn/2
		caixa = orcamento[t]/2
		generateRandomPlayers()
		(GameObject.FindObjectOfType(ButtonHistorico) as ButtonHistorico).activate()
		for a in areas:
			a.setSelected(false)
		
	def getTurn():
		return turn
		
	def getMaxTurns():
		return maxturns
		
	def getCaixaAtTurn(turnnum as int):
		if (turnnum < 0):
			turnnum = turn + 1 + turnnum
		t = turnnum/2
		return orcamento[t]/2
		
	public def getCaixaAllTurns():
		total = 0.0F
		for i in range(turn):
			total += getCaixaAtTurn(i)
		return total

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
			factor = (caixa/sum)*0.50 // bots invest 50% less
			for j in randomnums:
				j = j*factor
			playervals.Add(randomnums)

		for a in range(len(areas)):
			playerlist = array(Player,8)
			playerlist[0] = Player()
			playerlist[0].InvestimentoCultura = 0
			playerlist[0].InvestimentoEducacao = 0
			playerlist[0].InvestimentoEsporte = 0
			playerlist[0].InvestimentoInfraestrutura = 0
			playerlist[0].InvestimentoMeioAmbiente = 0
			playerlist[0].InvestimentoMobilidade = 0
			playerlist[0].InvestimentoAgropecuaria = 0
			playerlist[0].InvestimentoSaude = 0
			playerlist[0].InvestimentoTrabalho = 0
			playerlist[0].InvestimentoSeguranca = 0
			for p in range(1,8):
				playerlist[p] = Player()
				playerlist[p].InvestimentoCultura = (playervals[p-1] as (single))[0+a*10]
				playerlist[p].InvestimentoEducacao = (playervals[p-1] as (single))[1+a*10]
				playerlist[p].InvestimentoEsporte = (playervals[p-1] as (single))[2+a*10]
				playerlist[p].InvestimentoInfraestrutura = (playervals[p-1] as (single))[3+a*10]
				playerlist[p].InvestimentoMeioAmbiente = (playervals[p-1] as (single))[4+a*10]
				playerlist[p].InvestimentoMobilidade = (playervals[p-1] as (single))[5+a*10]
				playerlist[p].InvestimentoAgropecuaria = (playervals[p-1] as (single))[6+a*10]
				playerlist[p].InvestimentoSaude = (playervals[p-1] as (single))[7+a*10]
				playerlist[p].InvestimentoTrabalho = (playervals[p-1] as (single))[8+a*10]
				playerlist[p].InvestimentoSeguranca = (playervals[p-1] as (single))[9+a*10]
			areas[a].AddTurn(playerlist)
			
	public def getInvestimentoCulturaPlayer(playernum,turnnum as int) as single:
		total = 0.0F
		for a in areas:
			total += a.getInvestimentoCulturaPlayer(playernum,turnnum)
		return total
		
	public def getInvestimentoEducacaoPlayer(playernum,turnnum as int) as single:
		total = 0.0F
		for a in areas:
			total += a.getInvestimentoEducacaoPlayer(playernum,turnnum)
		return total
		
	public def getInvestimentoEsportePlayer(playernum,turnnum as int) as single:
		total = 0.0F
		for a in areas:
			total += a.getInvestimentoEsportePlayer(playernum,turnnum)
		return total
		
	public def getInvestimentoInfraestruturaPlayer(playernum,turnnum as int) as single:
		total = 0.0F
		for a in areas:
			total += a.getInvestimentoInfraestruturaPlayer(playernum,turnnum)
		return total
		
	public def getInvestimentoMeioAmbientePlayer(playernum,turnnum as int) as single:
		total = 0.0F
		for a in areas:
			total += a.getInvestimentoMeioAmbientePlayer(playernum,turnnum)
		return total
		
	public def getInvestimentoMobilidadePlayer(playernum,turnnum as int) as single:
		total = 0.0F
		for a in areas:
			total += a.getInvestimentoMobilidadePlayer(playernum,turnnum)
		return total
		
	public def getInvestimentoAgropecuariaPlayer(playernum,turnnum as int) as single:
		total = 0.0F
		for a in areas:
			total += a.getInvestimentoAgropecuariaPlayer(playernum,turnnum)
		return total
		
	public def getInvestimentoSaudePlayer(playernum,turnnum as int) as single:
		total = 0.0F
		for a in areas:
			total += a.getInvestimentoSaudePlayer(playernum,turnnum)
		return total
		
	public def getInvestimentoTrabalhoPlayer(playernum,turnnum as int) as single:
		total = 0.0F
		for a in areas:
			total += a.getInvestimentoTrabalhoPlayer(playernum,turnnum)
		return total
		
	public def getInvestimentoSegurancaPlayer(playernum,turnnum as int) as single:
		total = 0.0F
		for a in areas:
			total += a.getInvestimentoSegurancaPlayer(playernum,turnnum)
		return total
		
	public def getInvestimentoDisponivelPlayer(playernum,turnnum as int) as single:
		gasto = 0.0F
		for a in areas:
			gasto += a.getInvestimentoCulturaPlayer(playernum,turnnum)
			gasto += a.getInvestimentoEducacaoPlayer(playernum,turnnum)
			gasto += a.getInvestimentoEsportePlayer(playernum,turnnum)
			gasto += a.getInvestimentoInfraestruturaPlayer(playernum,turnnum)
			gasto += a.getInvestimentoMeioAmbientePlayer(playernum,turnnum)
			gasto += a.getInvestimentoMobilidadePlayer(playernum,turnnum)
			gasto += a.getInvestimentoAgropecuariaPlayer(playernum,turnnum)
			gasto += a.getInvestimentoSaudePlayer(playernum,turnnum)
			gasto += a.getInvestimentoTrabalhoPlayer(playernum,turnnum)
			gasto += a.getInvestimentoSegurancaPlayer(playernum,turnnum)
		return getCaixaAtTurn(turnnum)-gasto
		
	public def getInvestimentoCulturaTotal(turnnum as int) as single:
		total = 0.0F
		for i in range(8):
			total += getInvestimentoCulturaPlayer(i,turnnum)
		return total

	public def getInvestimentoEducacaoTotal(turnnum as int) as single:
		total = 0.0F
		for i in range(8):
			total += getInvestimentoEducacaoPlayer(i,turnnum)
		return total

	public def getInvestimentoEsporteTotal(turnnum as int) as single:
		total = 0.0F
		for i in range(8):
			total += getInvestimentoEsportePlayer(i,turnnum)
		return total

	public def getInvestimentoInfraestruturaTotal(turnnum as int) as single:
		total = 0.0F
		for i in range(8):
			total += getInvestimentoInfraestruturaPlayer(i,turnnum)
		return total

	public def getInvestimentoMeioAmbienteTotal(turnnum as int) as single:
		total = 0.0F
		for i in range(8):
			total += getInvestimentoMeioAmbientePlayer(i,turnnum)
		return total

	public def getInvestimentoMobilidadeTotal(turnnum as int) as single:
		total = 0.0F
		for i in range(8):
			total += getInvestimentoMobilidadePlayer(i,turnnum)
		return total

	public def getInvestimentoAgropecuariaTotal(turnnum as int) as single:
		total = 0.0F
		for i in range(8):
			total += getInvestimentoAgropecuariaPlayer(i,turnnum)
		return total

	public def getInvestimentoSaudeTotal(turnnum as int) as single:
		total = 0.0F
		for i in range(8):
			total += getInvestimentoSaudePlayer(i,turnnum)
		return total

	public def getInvestimentoTrabalhoTotal(turnnum as int) as single:
		total = 0.0F
		for i in range(8):
			total += getInvestimentoTrabalhoPlayer(i,turnnum)
		return total

	public def getInvestimentoSegurancaTotal(turnnum as int) as single:
		total = 0.0F
		for i in range(8):
			total += getInvestimentoSegurancaPlayer(i,turnnum)
		return total

	public def getInvestimentoDisponivelTotal(turnnum as int) as single:
		gasto = 0.0F
		gasto += getInvestimentoCulturaTotal(turnnum)
		gasto += getInvestimentoEducacaoTotal(turnnum)
		gasto += getInvestimentoEsporteTotal(turnnum)
		gasto += getInvestimentoInfraestruturaTotal(turnnum)
		gasto += getInvestimentoMeioAmbienteTotal(turnnum)
		gasto += getInvestimentoMobilidadeTotal(turnnum)
		gasto += getInvestimentoAgropecuariaTotal(turnnum)
		gasto += getInvestimentoSaudeTotal(turnnum)
		gasto += getInvestimentoTrabalhoTotal(turnnum)
		gasto += getInvestimentoSegurancaTotal(turnnum)
		return getCaixaAtTurn(turnnum)*8-gasto
		
	public def getInvestimentoCulturaAllTurns() as single:
		total = 0.0F
		for i in range(turn):
			total += getInvestimentoCulturaTotal(i)
		return total

	public def getInvestimentoEducacaoAllTurns() as single:
		total = 0.0F
		for i in range(turn):
			total += getInvestimentoEducacaoTotal(i)
		return total

	public def getInvestimentoEsporteAllTurns() as single:
		total = 0.0F
		for i in range(turn):
			total += getInvestimentoEsporteTotal(i)
		return total

	public def getInvestimentoInfraestruturaAllTurns() as single:
		total = 0.0F
		for i in range(turn):
			total += getInvestimentoInfraestruturaTotal(i)
		return total

	public def getInvestimentoMeioAmbienteAllTurns() as single:
		total = 0.0F
		for i in range(turn):
			total += getInvestimentoMeioAmbienteTotal(i)
		return total

	public def getInvestimentoMobilidadeAllTurns() as single:
		total = 0.0F
		for i in range(turn):
			total += getInvestimentoMobilidadeTotal(i)
		return total

	public def getInvestimentoAgropecuariaAllTurns() as single:
		total = 0.0F
		for i in range(turn):
			total += getInvestimentoAgropecuariaTotal(i)
		return total

	public def getInvestimentoSaudeAllTurns() as single:
		total = 0.0F
		for i in range(turn):
			total += getInvestimentoSaudeTotal(i)
		return total

	public def getInvestimentoTrabalhoAllTurns() as single:
		total = 0.0F
		for i in range(turn):
			total += getInvestimentoTrabalhoTotal(i)
		return total

	public def getInvestimentoSegurancaAllTurns() as single:
		total = 0.0F
		for i in range(turn):
			total += getInvestimentoSegurancaTotal(i)
		return total
		
	public def getInvestimentoDisponivelAllTurns() as single:
		total = 0.0F
		for i in range(turn):
			total += getInvestimentoDisponivelTotal(i)
		return total

	

		

