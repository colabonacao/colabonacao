import UnityEngine
import UnityEngine.UI
import RegularPopup

class PopupPrestacao (RegularPopup): 
	public warningbox as Text
	public contentbox as GameObject
	private starty as single = 0

	override def initialize():
		super()
		gameObject.active = false
		starty = (contentbox.transform as RectTransform).localPosition.y
	
	new def Update ():
		pass

	public override def invoke():
		super()
		areas = GameObject.FindObjectsOfType(Area) as (Area)
		invested = true
		for a in areas:
			invested = invested and a.isinvested()
		warningbox.active = not invested
		if invested:
			(contentbox.transform as RectTransform).localPosition.y = starty - 25
		else:
			(contentbox.transform as RectTransform).localPosition.y = starty