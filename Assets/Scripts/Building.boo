import UnityEngine

class Building (MonoBehaviour): 
	public imagens as (Sprite)
	public nivelInvestimento as int = 0
	public novoNivelInvestimento as int = 0
	public buildImage as Image 
	public city as City
	public area as Area
	def Start ():
		buildImage = gameObject.gameObject.GetComponent[of Image]() as Image
		area = gameObject.gameObject.GetComponentInParent[of Area]() as Area
		city = area.gameObject.GetComponentInParent[of City]() as City
		
		if(city.name == "São Paulo"):
			buildImage.sprite = imagens[9]
		if(city.name == "Recife"):
			buildImage.sprite = imagens[9]
		if(city.name == "Rio de Janeiro"):
			buildImage.sprite = imagens[9]
		
		for i in range(0, imagens.Length):
			if(buildImage.sprite == imagens[i]):
				nivelInvestimento = i
				novoNivelInvestimento = i
	def Update ():
		pass
			
	def CheckUpdates ():	
		if(area.getInvestimentoCultura() + area.getInvestimentoEducacao() + area.getInvestimentoEsporte() + area.getInvestimentoInfraestrutura() + area.getInvestimentoMeioAmbiente() + area.getInvestimentoMobilidade() + area.getInvestimentoAgropecuaria() + area.getInvestimentoSaude() + area.getInvestimentoTrabalho() + area.getInvestimentoSeguranca() > 0):
			novoNivelInvestimento = nivelInvestimento + 1
		if novoNivelInvestimento != nivelInvestimento:
			buildImage.sprite = imagens[novoNivelInvestimento]
			nivelInvestimento = novoNivelInvestimento
