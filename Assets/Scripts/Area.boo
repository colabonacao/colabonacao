import UnityEngine
import ClickDetect

class Area (ClickDetect): 
	selected = false

	def Start ():
		renderer.material.color.a = 0.0f
	
	def Update ():
		pass
			
	override def OnClick():
		setSelected(true)
		
	public def setSelected(toset):
		if toset:
			areas = GameObject.FindObjectsOfType(Area)
			for area in areas:
				area.setSelected(false)
			renderer.material.color.a = 0.6f
		else:
			renderer.material.color.a = 0.0f
		selected = toset
		
	public def isSelected():
		return selected
