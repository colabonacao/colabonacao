import UnityEngine
import UnityEngine.UI
import MouseCameraControl
import Area

class InGameMenu (MonoBehaviour): 
	public CityName as Text = null
	public SliderCultura as Slider = null
	public SliderEducacao as Slider = null
	public SliderEsporte as Slider = null
	public SliderInfraestrutura as Slider = null
	public SliderMeioambiente as Slider = null
	public SliderMobilidade as Slider = null
	public SliderAgropecuaria as Slider = null
	public SliderSaude as Slider = null
	public SliderTrabalho as Slider = null
	public SliderSeguranca as Slider = null
	
	private ValueCultura as Text = null
	private ValueEducacao as Text = null
	private ValueEsporte as Text = null
	private ValueInfraestrutura as Text = null
	private ValueMeioambiente as Text = null
	private ValueMobilidade as Text = null
	private ValueAgropecuaria as Text = null
	private ValueSaude as Text = null
	private ValueTrabalho as Text = null
	private ValueSeguranca as Text = null
	private city as City = null
	
	area as Area = null
	mousecontrol as MouseCameraControl = null

	def Start ():
		city = GameObject.FindObjectOfType(City) as City
		ValueCultura = SliderCultura.transform.FindChild("Value").GetComponent[of Text]()
		ValueEducacao = SliderEducacao.transform.FindChild("Value").GetComponent[of Text]()
		ValueEsporte = SliderEsporte.transform.FindChild("Value").GetComponent[of Text]()
		ValueInfraestrutura = SliderInfraestrutura.transform.FindChild("Value").GetComponent[of Text]()
		ValueMeioambiente = SliderMeioambiente.transform.FindChild("Value").GetComponent[of Text]()
		ValueMobilidade = SliderMobilidade.transform.FindChild("Value").GetComponent[of Text]()
		ValueAgropecuaria = SliderAgropecuaria.transform.FindChild("Value").GetComponent[of Text]()
		ValueSaude = SliderSaude.transform.FindChild("Value").GetComponent[of Text]()
		ValueTrabalho = SliderTrabalho.transform.FindChild("Value").GetComponent[of Text]()
		ValueSeguranca = SliderSeguranca.transform.FindChild("Value").GetComponent[of Text]()
		
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
		ValueCultura.text = "\$ $(area.InvestimentoCultura)"

	public def setInvestEducacao(toset as single):
		area.InvestimentoEducacao = toset
		ValueEducacao.text = "\$ $(area.InvestimentoEducacao)"

	public def setInvestEsporte(toset as single):
		area.InvestimentoEsporte = toset
		ValueEsporte.text = "\$ $(area.InvestimentoEsporte)"

	public def setInvestInfraEstrutura(toset as single):
		area.InvestimentoInfraestrutura = toset
		ValueInfraestrutura.text = "\$ $(area.InvestimentoInfraestrutura)"

	public def setInvestMeioAmbiente(toset as single):
		area.InvestimentoMeioAmbiente = toset
		ValueMeioambiente.text = "\$ $(area.InvestimentoMeioAmbiente)"

	public def setInvestMobilidade(toset as single):
		area.InvestimentoMobilidade = toset
		ValueMobilidade.text = "\$ $(area.InvestimentoMobilidade)"

	public def setInvestAgropecuaria(toset as single):
		area.InvestimentoAgropecuaria = toset
		ValueAgropecuaria.text = "\$ $(area.InvestimentoAgropecuaria)"

	public def setInvestSaude(toset as single):
		area.InvestimentoSaude = toset
		ValueSaude.text = "\$ $(area.InvestimentoSaude)"

	public def setInvestTrabalho(toset as single):
		area.InvestimentoTrabalho = toset
		ValueTrabalho.text = "\$ $(area.InvestimentoTrabalho)"

	public def setInvestSeguranca(toset as single):
		area.InvestimentoSeguranca = toset
		ValueSeguranca.text = "\$ $(area.InvestimentoSeguranca)"
		
	private def configAreaValues():
		CityName.text = area.name
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
		

