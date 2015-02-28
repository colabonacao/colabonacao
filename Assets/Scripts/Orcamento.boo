import UnityEngine
import UnityEngine.UI
import City

class Orcamento (MonoBehaviour): 
	private textbox as Text
	private city as City

	def Start ():
		textbox = gameObject.GetComponent(Text)
		city = GameObject.FindObjectOfType(City) as City
	
	def Update ():
		textbox.text = "\$ $(city.getOrcamento())"