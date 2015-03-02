import UnityEngine

class SliderDragStop (MonoBehaviour): 

	private city as City
	private slider as Slider
	private areaMenu as AreaMenu
	
	def Start():
		city = GameObject.FindObjectOfType(City) as City
		slider = self.GetComponent[of Slider]()
		areaMenu = GameObject.FindObjectOfType(AreaMenu) as AreaMenu
		
	def Update():
		if slider is null:
			slider = self.GetComponent[of Slider]()
		if city is null:
			city = GameObject.FindObjectOfType(City) as City
		budget = city.getOrcamento()
		if budget < 0:
			if (areaMenu.getLastSlider().name == self.name):
				Debug.Log(slider.value)
				slider.value += budget
				Debug.Log(slider.value)
		
	def SetPotentialDrag():
		if areaMenu is null:
			areaMenu = GameObject.FindObjectOfType(AreaMenu) as AreaMenu
		areaMenu.setLastSlider(slider)
		Debug.Log("areaSet")
		
		