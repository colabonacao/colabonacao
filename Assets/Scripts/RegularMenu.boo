import UnityEngine
import UnityEngine.UI
import MouseCameraControl
import Area

class RegularMenu (MonoBehaviour): 
	public AnimatedPanel as Animator
	
	def Start ():
		dismiss()
	
	def Update ():
		pass
		
	public def invoke():
		gameObject.active = true
		//AnimatedPanel.SetBool("slideOut",false) 
		GameObject.FindObjectOfType(MouseCameraControl).disable()
		areas = GameObject.FindObjectsOfType(Area)
		for area in areas:
			area.setSelectable(false)
			
	public def dismiss():
		//AnimatedPanel.SetBool("slideOut",true) 
		areas = GameObject.FindObjectsOfType(Area)
		for area in areas:
			area.setSelected(false)
			area.setSelectable(true)
		GameObject.FindObjectOfType(MouseCameraControl).enable()
		gameObject.active = false
		
		
		