import UnityEngine

class RegularPopup (MonoBehaviour): 

	def Start ():
		gameObject.active = false
	
	def Update ():
		pass
		
	virtual public def invoke():
		gameObject.active = true
		
	virtual public def dismiss():
		gameObject.active = false
