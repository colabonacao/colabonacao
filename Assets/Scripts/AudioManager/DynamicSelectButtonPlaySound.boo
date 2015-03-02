import UnityEngine

class DynamicSelectButtonPlaySound (MonoBehaviour): 

	def Start ():
		audioManager = GameObject.FindObjectOfType(AudioManager)
		self.GetComponent[of Button]().onClick.AddListener({audioManager.PlaySound("selectbut")})
		