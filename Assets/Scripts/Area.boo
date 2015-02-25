import UnityEngine
import ClickDetect
import InGameMenu

class Area (ClickDetect):
	public Orcamento = 0
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
	
	public menu as InGameMenu = null
	selected = false
	selectable = true
	
	def Start ():
		renderer.material.color.a = 0.0f
		
	
	def Update ():
		pass
			
	override def OnClick():
		if selectable:
			setSelected(true)
		
	public def setSelected(toset):
		if toset:
			areas = GameObject.FindObjectsOfType(Area)
			for area in areas:
				area.setSelected(false)
			renderer.material.color.a = 0.6f
			if menu != null:
				menu.invoke(self)
		else:
			renderer.material.color.a = 0.0f
		selected = toset
		
	public def isSelected():
		return selected
		
	public def setSelectable(toset):
		selectable = toset
