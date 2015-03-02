import UnityEngine
import UnityEngine.UI
import RegularPopup

class PopupConfirmExit (RegularPopup): 
	public warningbox as Text
	public contentbox as GameObject
	public endChosen as GameObject
	private starty as single = 0

	override def initialize():
		super()
		gameObject.active = false
		starty = (contentbox.transform as RectTransform).localPosition.y
	
	new def Update ():
		pass
			
	public def ExitGame():
		Destroy(endChosen)
		AutoFade.LoadLevel('MainMenu', 0.2f, 0.1f, Color.black)
		PlayerPrefs.Save()