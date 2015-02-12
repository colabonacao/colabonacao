import UnityEngine
import MouseCameraControl

class InGameMenu (MonoBehaviour): 
	mousecontrol as MouseCameraControl = null

	def Start ():
		dismiss()
	
	def Update ():
		pass
		
	public def invoke():
		gameObject.active = true
		GameObject.FindObjectOfType(MouseCameraControl).disable()
		
	public def dismiss():
		areas = GameObject.FindObjectsOfType(Area)
		for area in areas:
			area.setSelected(false)
		GameObject.FindObjectOfType(MouseCameraControl).enable()
		gameObject.active = false
