import UnityEngine

class RegularPopup (MonoBehaviour): 
	protected initialized as bool = false

	def Start ():
		if not initialized:
			gameObject.active = false
		
	def Update ():
		pass
		
	virtual public def invoke():
		if not initialized:
			Initialize()
		gameObject.active = true
		
	virtual public def dismiss():
		gameObject.active = false
		
	virtual public def Initialize():
		initialized = true
		
	
