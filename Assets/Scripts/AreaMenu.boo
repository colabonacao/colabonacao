import UnityEngine
import UnityEngine.UI
import Area

class AreaMenu (RegularMenu): 
	public AreaName as Text = null
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

	override def initialize ():
		super()
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
	
	new def Update ():
		pass
		
	public def invoke(areatocontrol as Area):
		invoke()
		area = areatocontrol
		configAreaValues()
		
	public def setInvestCultura(toset as single):
		area.setInvestimentoCultura(toset)
		ValueCultura.text = "\$ $(area.getInvestimentoCultura())"

	public def setInvestEducacao(toset as single):
		area.setInvestimentoEducacao(toset)
		ValueEducacao.text = "\$ $(area.getInvestimentoEducacao())"

	public def setInvestEsporte(toset as single):
		area.setInvestimentoEsporte(toset)
		ValueEsporte.text = "\$ $(area.getInvestimentoEsporte())"

	public def setInvestInfraEstrutura(toset as single):
		area.setInvestimentoInfraestrutura(toset)
		ValueInfraestrutura.text = "\$ $(area.getInvestimentoInfraestrutura())"

	public def setInvestMeioAmbiente(toset as single):
		area.setInvestimentoMeioAmbiente(toset)
		ValueMeioambiente.text = "\$ $(area.getInvestimentoMeioAmbiente())"

	public def setInvestMobilidade(toset as single):
		area.setInvestimentoMobilidade(toset)
		ValueMobilidade.text = "\$ $(area.getInvestimentoMobilidade())"

	public def setInvestAgropecuaria(toset as single):
		area.setInvestimentoAgropecuaria(toset)
		ValueAgropecuaria.text = "\$ $(area.getInvestimentoAgropecuaria())"

	public def setInvestSaude(toset as single):
		area.setInvestimentoSaude(toset)
		ValueSaude.text = "\$ $(area.getInvestimentoSaude())"

	public def setInvestTrabalho(toset as single):
		area.setInvestimentoTrabalho(toset)
		ValueTrabalho.text = "\$ $(area.getInvestimentoTrabalho())"

	public def setInvestSeguranca(toset as single):
		area.setInvestimentoSeguranca(toset)
		ValueSeguranca.text = "\$ $(area.getInvestimentoSeguranca())"
		
	private def configAreaValues():
		AreaName.text = area.name
		SliderCultura.value = area.getInvestimentoCultura()
		SliderEducacao.value = area.getInvestimentoEducacao()
		SliderEsporte.value = area.getInvestimentoEsporte()
		SliderInfraestrutura.value = area.getInvestimentoInfraestrutura()
		SliderMeioambiente.value = area.getInvestimentoMeioAmbiente()
		SliderMobilidade.value = area.getInvestimentoMobilidade()
		SliderAgropecuaria.value = area.getInvestimentoAgropecuaria()
		SliderSaude.value = area.getInvestimentoSaude()
		SliderTrabalho.value = area.getInvestimentoTrabalho()
		SliderSeguranca.value = area.getInvestimentoSeguranca()
		SliderCultura.value = area.getInvestimentoCultura()

		SliderEducacao.maxValue = city.getCaixa()
		SliderEsporte.maxValue = city.getCaixa()
		SliderInfraestrutura.maxValue = city.getCaixa()
		SliderMeioambiente.maxValue = city.getCaixa()
		SliderMobilidade.maxValue = city.getCaixa()
		SliderAgropecuaria.maxValue = city.getCaixa()
		SliderSaude.maxValue = city.getCaixa()
		SliderTrabalho.maxValue = city.getCaixa()
		SliderSeguranca.maxValue = city.getCaixa()
		SliderCultura.maxValue = city.getCaixa()
		
		

