import UnityEngine
import MouseCameraControl
import Area

class InGameMenu (MonoBehaviour): 
	public SliderCultura as UnityEngine.UI.Slider = null
	public SliderEducacao as UnityEngine.UI.Slider = null
	public SliderEsporte as UnityEngine.UI.Slider = null
	public SliderInfraestrutura as UnityEngine.UI.Slider = null
	public SliderMeioambiente as UnityEngine.UI.Slider = null
	public SliderMobilidade as UnityEngine.UI.Slider = null
	public SliderAgropecuaria as UnityEngine.UI.Slider = null
	public SliderSaude as UnityEngine.UI.Slider = null
	public SliderTrabalho as UnityEngine.UI.Slider = null
	public SliderSeguranca as UnityEngine.UI.Slider = null
	
	area as Area = null
	mousecontrol as MouseCameraControl = null

	def Start ():
		dismiss()
	
	def Update ():
		pass
		
	public def invoke(areatocontrol as Area):
		area = areatocontrol
		configAreaValues()
		gameObject.active = true
		GameObject.FindObjectOfType(MouseCameraControl).disable()
		areas = GameObject.FindObjectsOfType(Area)
		for area in areas:
			area.setSelectable(false)
		
	public def dismiss():
		areas = GameObject.FindObjectsOfType(Area)
		for area in areas:
			area.setSelected(false)
			area.setSelectable(true)
		GameObject.FindObjectOfType(MouseCameraControl).enable()
		gameObject.active = false
		
	public def setInvestCultura(toset as single):
		area.InvestimentoCultura = toset

	public def setInvestEducacao(toset as single):
		area.InvestimentoEducacao = toset

	public def setInvestEsporte(toset as single):
		area.InvestimentoEsporte = toset

	public def setInvestInfraEstrutura(toset as single):
		area.InvestimentoInfraestrutura = toset

	public def setInvestMeioAmbiente(toset as single):
		area.InvestimentoMeioAmbiente = toset

	public def setInvestMobilidade(toset as single):
		area.InvestimentoMobilidade = toset

	public def setInvestAgropecuaria(toset as single):
		area.InvestimentoAgropecuaria = toset

	public def setInvestSaude(toset as single):
		area.InvestimentoSaude = toset

	public def setInvestTrabalho(toset as single):
		area.InvestimentoTrabalho = toset

	public def setInvestSeguranca(toset as single):
		area.InvestimentoSeguranca = toset
		
	private def configAreaValues():
		SliderCultura.value = area.InvestimentoCultura
		SliderEducacao.value = area.InvestimentoEducacao
		SliderEsporte.value = area.InvestimentoEsporte
		SliderInfraestrutura.value = area.InvestimentoInfraestrutura
		SliderMeioambiente.value = area.InvestimentoMeioAmbiente
		SliderMobilidade.value = area.InvestimentoMobilidade
		SliderAgropecuaria.value = area.InvestimentoAgropecuaria
		SliderSaude.value = area.InvestimentoSaude
		SliderTrabalho.value = area.InvestimentoTrabalho
		SliderSeguranca.value = area.InvestimentoSeguranca
		

