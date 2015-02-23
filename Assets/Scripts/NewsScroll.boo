import UnityEngine
import Area

class NewsScroll (MonoBehaviour): 
	news = []

	def Start ():
		randomnews = [
			News("Grande enchente assola a região de {0}",Modifier("modinfraestrutura",0.9)),
			News("Fome em {0} atinge níveis alarmantes",Modifier("modtrabalho",1.1)),
			News("Nelson Carlos confirma show em {0}",Modifier()),
			News("Grande assalto ao banco de {0} deixa mortos e feridos",Modifier("modseguranca",0.3)),
			News("Grande assalto ao banco de {0} deixa mortoaushdoasuh ouashdu ohasouhduo houashdou aoushd uhouashdohusdauoh ouhasoudhouashd ouhasd uhasuohasudasoudoasdouhasouhdouahsoudhousahd houahsoudhasouhdoashoud haosuhdoaushdoaushdouhas oaushdoauhsdouahsdouha s e feridos",Modifier()),
		]
		
		nums = []
		
		//get 3 news at random
		for i in range(3):
			num = Random.Range(0,len(randomnews))
			while num in nums:
				num = Random.Range(0,len(randomnews))
			nums.Push(num)
		for i in nums:
			news.Push(randomnews[i])
	
	def Update ():
		pass

class News():
	text as string
	modifier as Modifier
	def constructor(settext,setmodifier):
		text = settext
		modifier = setmodifier
	
	def getText():
		return string.Format(text,modifier.getAreaName())
		
class Modifier():
	area as Area = null
	
	def constructor():
		areas = GameObject.FindObjectsOfType(Area)
		area = areas[Random.Range(0,len(areas))]
	
	def constructor(investmentmod as string,modvalue as single):
		areas = GameObject.FindObjectsOfType(Area)
		area = areas[Random.Range(0,len(areas))]
			
	def constructor(investmentmod as string,modvalue as single,areaname as string):
		areas = GameObject.FindObjectsOfType(Area)
		area = areas[Random.Range(0,len(areas))]
			
	def getAreaName():
		return area.name
			
		
		