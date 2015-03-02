import UnityEngine
import UnityEngine.UI
import City

class Orcamento (MonoBehaviour): 
	private textbox as Text
	private city as City

	def Start ():
		textbox = gameObject.GetComponent(Text)
		city = GameObject.FindObjectOfType(City) as City
	
	def LateUpdate ():
		if city.getOrcamento() >= 0:
			textbox.text = "\$ $(Mathf.Floor(city.getOrcamento()))"