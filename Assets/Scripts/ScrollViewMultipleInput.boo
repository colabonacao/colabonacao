import UnityEngine

class ScrollViewMultipleInput (MonoBehaviour): 
	
	def Update ():
		if (Input.touchCount > 1):
			self.GetComponent[of ScrollRect]().horizontal = false
			self.GetComponent[of ScrollRect]().vertical = false
		else:
			self.GetComponent[of ScrollRect]().horizontal = true
			self.GetComponent[of ScrollRect]().vertical = true
