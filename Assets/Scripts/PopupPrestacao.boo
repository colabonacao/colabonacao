import UnityEngine

class PopupPrestacao (MonoBehaviour): 

	def Start ():
		gameObject.active = false
	
	def Update ():
		pass
		
	def Show():
		GameObject.FindObjectOfType(MouseCameraControl).disable()
		gamemenu = GameObject.FindObjectOfType(InGameMenu) as InGameMenu
		if gamemenu != null:
			gamemenu.dismiss()
		gameObject.active = true
		
	def Dismiss():
		GameObject.FindObjectOfType(MouseCameraControl).enable()
		gamemenu = GameObject.FindObjectOfType(InGameMenu) as InGameMenu
		if gamemenu != null:
			gamemenu.dismiss()
		gameObject.active = false
