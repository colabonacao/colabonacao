import UnityEngine

class MedalMenu (MonoBehaviour): 
	public medalhas as (Medalhas)
	def Start ():
		for medalha in medalhas:
			medalImage as Image 
			medalIndex as int
			medalIndex = PlayerPrefs.GetInt(medalha.name)
			medalImage = medalha.gameObject.GetComponent[of Image]() as Image
			medalImage.sprite = medalha.medalhas[medalIndex]
	
	def Update ():
		pass
