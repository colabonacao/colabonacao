import UnityEngine
import ClickDetect
import InGameMenu

class Area (ClickDetect):
	public menu as InGameMenu = null
	selected = false
	selectable = true
	
	def Start ():
		renderer.material.color.a = 0.0f
	
	def Update ():
		pass
			
	override def OnClick():
		if selectable:
			setSelected(true)
		
	public def setSelected(toset):
		if toset:
			areas = GameObject.FindObjectsOfType(Area)
			for area in areas:
				area.setSelected(false)
			renderer.material.color.a = 0.6f
			if menu != null:
				menu.invoke()
		else:
			renderer.material.color.a = 0.0f
		selected = toset
		
	public def isSelected():
		return selected
		
	public def setSelectable(toset):
		selectable = toset
