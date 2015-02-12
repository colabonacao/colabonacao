import UnityEngine

class InGameMenu (MonoBehaviour): 

	def Start ():
		dismiss()
	
	def Update ():
		pass
		
	public def invoke():
		gameObject.active = true
		
	public def dismiss():
		areas = GameObject.FindObjectsOfType(Area)
		for area in areas:
			area.setSelected(false)
		gameObject.active = false
