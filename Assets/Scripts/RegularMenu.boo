import UnityEngine
import UnityEngine.UI
import MouseCameraControl
import Area

class RegularMenu (MonoBehaviour): 
	def Start ():
		dismiss()
	
	def Update ():
		pass
		
	public def invoke():
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