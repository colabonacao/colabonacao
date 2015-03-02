import UnityEngine
import AreaMenu
import UnityEngine.UI

class Area (MonoBehaviour):
	private menu as AreaMenu = null
	private selected = false
	private selectable = true
	private areaimage as Image = null 

	private players = []
	
	def Start ():
		areaimage = gameObject.GetComponent[of Image]() as Image
		areaimage.color = Color(0,0,0,0)
		(gameObject.GetComponent[of Button]() as Button).onClick.AddListener(OnClick)
		menu = (GameObject.FindObjectsOfTypeAll(AreaMenu) as (AreaMenu))[0]
	
	def Update ():
		pass
			
	def OnClick():
		if selectable:
			setSelected(true)
		
	public def setSelected(toset):
		if toset:
			areas = GameObject.FindObjectsOfType(Area)
			if menu != null:
				menu.invoke(self)
			for area in areas:
				area.setSelected(false)
			if areaimage != null:
				areaimage.color = Color(0,0,0,0.6f)
		else:
			if players.Count > 0 and isinvested():
			   	if areaimage != null:
			   		areaimage.color = Color(0.2,0.6,0.2,0.2)
			else:
				if areaimage != null:
					areaimage.color = Color(0,0,0,0)
		selected = toset
		
	public def isSelected():
		return selected
		
	public def setSelectable(toset):
		selectable = toset
		
	public def isinvested():
		return getInvestimentoCultura() > 0 or\
			   getInvestimentoEducacao() > 0 or\
			   getInvestimentoEsporte() > 0 or\
			   getInvestimentoInfraestrutura() > 0 or\
			   getInvestimentoMeioAmbiente() > 0 or\
			   getInvestimentoMobilidade() > 0 or\
			   getInvestimentoSaude() > 0 or\
			   getInvestimentoTrabalho() > 0 or\
			   getInvestimentoSeguranca() > 0 or\
			   getInvestimentoAgropecuaria() > 0
	
	public def AddPlayers(toset):
		players.Add(toset)
		
	public def getPlayer(playernum as int,turnnum as int) as Player:
		if turnnum < 0:
			turnnum = players.Count + turnnum
		if playernum < 0:
			playernum = len(players[turnnum] as (Player)) + playernum
		return (players[turnnum] as (Player))[playernum] as Player
		
	public def getPreviousTurnPlayer(playernum) as Player:
		if players.Count > 1:
			return getPlayer(playernum,-2)
		else:
			return null
		
	public def setInvestimentoCultura(val):
		getPlayer(0,-1).InvestimentoCultura = val
		
	public def getInvestimentoCultura() as single:
		return getInvestimentoCulturaPlayer(0,-1)
		
	public def getInvestimentoCulturaPlayer(playernum,turnnum):
		return getPlayer(playernum,turnnum).InvestimentoCultura
		
	public def setInvestimentoEducacao(val):
		getPlayer(0,-1).InvestimentoEducacao = val
		
	public def getInvestimentoEducacao() as single:
		return getInvestimentoEducacaoPlayer(0,-1)
		
	public def getInvestimentoEducacaoPlayer(playernum,turnnum):
		return getPlayer(playernum,turnnum).InvestimentoEducacao
		

	public def setInvestimentoEsporte(val):
		getPlayer(0,-1).InvestimentoEsporte = val
		
	public def getInvestimentoEsporte() as single:
		return getInvestimentoEsportePlayer(0,-1)
		
	public def getInvestimentoEsportePlayer(playernum,turnnum):
		return getPlayer(playernum,turnnum).InvestimentoEsporte
		

	public def setInvestimentoInfraestrutura(val):
		getPlayer(0,-1).InvestimentoInfraestrutura = val
		
	public def getInvestimentoInfraestrutura() as single:
		return getInvestimentoInfraestruturaPlayer(0,-1)
		
	public def getInvestimentoInfraestruturaPlayer(playernum,turnnum):
		return getPlayer(playernum,turnnum).InvestimentoInfraestrutura
		

	public def setInvestimentoMeioAmbiente(val):
		getPlayer(0,-1).InvestimentoMeioAmbiente = val
		
	public def getInvestimentoMeioAmbiente() as single:
		return getInvestimentoMeioAmbientePlayer(0,-1)
		
	public def getInvestimentoMeioAmbientePlayer(playernum,turnnum):
		return getPlayer(playernum,turnnum).InvestimentoMeioAmbiente
		

	public def setInvestimentoMobilidade(val):
		getPlayer(0,-1).InvestimentoMobilidade = val
		
	public def getInvestimentoMobilidade() as single:
		return getInvestimentoMobilidadePlayer(0,-1)
		
	public def getInvestimentoMobilidadePlayer(playernum,turnnum):
		return getPlayer(playernum,turnnum).InvestimentoMobilidade
		

	public def setInvestimentoSaude(val):
		getPlayer(0,-1).InvestimentoSaude = val
		
	public def getInvestimentoSaude() as single:
		return getInvestimentoSaudePlayer(0,-1)
		
	public def getInvestimentoSaudePlayer(playernum,turnnum):
		return getPlayer(playernum,turnnum).InvestimentoSaude
		

	public def setInvestimentoTrabalho(val):
		getPlayer(0,-1).InvestimentoTrabalho = val
		
	public def getInvestimentoTrabalho() as single:
		return getInvestimentoTrabalhoPlayer(0,-1)
		
	public def getInvestimentoTrabalhoPlayer(playernum,turnnum):
		return getPlayer(playernum,turnnum).InvestimentoTrabalho
		

	public def setInvestimentoSeguranca(val):
		getPlayer(0,-1).InvestimentoSeguranca = val
		
	public def getInvestimentoSeguranca() as single:
		return getInvestimentoSegurancaPlayer(0,-1)
		
	public def getInvestimentoSegurancaPlayer(playernum,turnnum):
		return getPlayer(playernum,turnnum).InvestimentoSeguranca
		

	public def setInvestimentoAgropecuaria(val):
		getPlayer(0,-1).InvestimentoAgropecuaria = val
		
	public def getInvestimentoAgropecuaria() as single:
		return getInvestimentoAgropecuariaPlayer(0,-1)
		
	public def getInvestimentoAgropecuariaPlayer(playernum,turnnum):
		return getPlayer(playernum,turnnum).InvestimentoAgropecuaria
		

		


