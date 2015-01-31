import UnityEngine
import MouseCameraControl

class ClickDetect (MonoBehaviour): 
	def OnMouseUpAsButton():
		camscript = Camera.mainCamera.GetComponent[of MouseCameraControl]() as MouseCameraControl
		if not camscript.hasMoved():
			OnClick()
		
	public virtual def OnClick():
		pass
