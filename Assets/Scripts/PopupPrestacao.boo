import UnityEngine
import UnityEngine.UI
import RegularPopup

class PopupPrestacao (RegularPopup): 
	public warningbox as Text
	public contentbox as GameObject
	private starty as single = 0
	cidade as City

	override def initialize():
		super()
		gameObject.active = false
		starty = (contentbox.transform as RectTransform).localPosition.y
		cidade = GameObject.FindObjectOfType(City) as City
		
	new def Update ():
		pass

	public override def invoke():
		super()
		results = MySQLResults()
		results = FindObjectOfType(MySQLResults)
		areas = GameObject.FindObjectsOfType(Area) as (Area)
		valores as Dictionary[of string, double] = Dictionary[of string, double]()
		//Debug.Log(areas[0].turns.Count)
		/*valores.Add("cultura", cidade.getInvestimentoCulturaPlayer(0,cidade.getTurn()-1))
		valores.Add("educacao", cidade.getInvestimentoEducacaoPlayer(0,cidade.getTurn()-1))
		valores.Add("esporte", cidade.getInvestimentoEsportePlayer(0,cidade.getTurn()-1))
		valores.Add("infraestrutura", cidade.getInvestimentoInfraestruturaPlayer(0,cidade.getTurn()-1))
		valores.Add("meioAmbiente", cidade.getInvestimentoMeioAmbientePlayer(0,cidade.getTurn()-1))
		valores.Add("mobilidade", cidade.getInvestimentoMobilidadePlayer(0,cidade.getTurn()-1))
		valores.Add("agropecuaria", cidade.getInvestimentoAgropecuariaPlayer(0,cidade.getTurn()-1))
		valores.Add("saude", cidade.getInvestimentoSaudePlayer(0,cidade.getTurn()-1))
		valores.Add("trabalho", cidade.getInvestimentoTrabalhoPlayer(0,cidade.getTurn()-1))
		valores.Add("seguranca", cidade.getInvestimentoSegurancaPlayer(0,cidade.getTurn()-1))*/

		results.investimentoTurnos.Add(cidade.getTurn()+1, valores)
		invested = true
		for a in areas:
			Debug.Log(a.getInvestimentoCultura())
			invested = invested and a.isinvested()
		warningbox.active = not invested
		if invested:
			(contentbox.transform as RectTransform).localPosition.y = starty - 25
		else:
			(contentbox.transform as RectTransform).localPosition.y = starty
//		Debug.Log(results.investimentoTurnos.Count)