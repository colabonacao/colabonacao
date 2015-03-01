import UnityEngine
import AreaMenu
import UnityEngine.UI

class Area (MonoBehaviour):
	public InvestimentoCultura = 0
	public InvestimentoEducacao = 0
	public InvestimentoEsporte = 0
	public InvestimentoInfraestrutura = 0
	public InvestimentoMeioAmbiente = 0
	public InvestimentoMobilidade = 0
	public InvestimentoAgropecuaria = 0
	public InvestimentoSaude = 0
	public InvestimentoTrabalho = 0
	public InvestimentoSeguranca = 0
	
	private menu as AreaMenu = null
	private selected = false
	private selectable = true
	private areaimage as Image = null 
	private players as (Player)
	
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
			for area in areas:
				area.setSelected(false)
			if areaimage != null:
				areaimage.color = Color(0,0,0,0.6f)
			if menu != null:
				menu.invoke(self)
		else:
			if isinvested():
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
		return InvestimentoCultura > 0 or\
			   InvestimentoEducacao > 0 or\
			   InvestimentoEsporte > 0 or\
			   InvestimentoInfraestrutura > 0 or\
			   InvestimentoMeioAmbiente > 0 or\
			   InvestimentoMobilidade > 0 or\
			   InvestimentoSaude > 0 or\
			   InvestimentoTrabalho > 0 or\
			   InvestimentoSeguranca > 0 or\
			   InvestimentoAgropecuaria > 0
	
	public def setPlayers(toset):
		players = toset
		
	public def getPlayer(x):
		return players[x]

