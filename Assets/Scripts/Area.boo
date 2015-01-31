import UnityEngine
import ClickDetect

class Area (ClickDetect): 

	def Start ():
		renderer.material.color.a = 0.0f
	
	def Update ():
		pass
			
	override def OnClick():
		Debug.Log("click")
		renderer.material.color.a = 0.6f
