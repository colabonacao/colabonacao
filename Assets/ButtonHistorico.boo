import UnityEngine
import UnityEngine.UI

class ButtonHistorico (MonoBehaviour): 

	def Start ():
		(gameObject.GetComponent(Button) as Button).interactable = false
	
	def Update ():
		pass
		
	public def activate():
		(gameObject.GetComponent(Button) as Button).interactable = true
