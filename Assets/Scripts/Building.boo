import UnityEngine

class Building (MonoBehaviour): 
	public imagens as (Sprite)
	public nivelInvestimento as int = 0
	public novoNivelInvestimento as int = 0
	private buildImage as Image 
	def Start ():
		buildImage = gameObject.gameObject.GetComponent[of Image]() as Image
		buildImage.sprite = imagens[0]
	
	def Update ():
//		if novoNivelInvestimento != nivelInvestimento:
//			buildImage.sprite = imagens[novoNivelInvestimento]
		pass