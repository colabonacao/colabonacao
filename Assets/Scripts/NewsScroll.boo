import UnityEngine
import UnityEngine.UI
import Area

class NewsScroll (MonoBehaviour): 
	news = []
	textbox as Text = null
	parent as Image = null
	initx = 0

	def Start ():
		randomnews = [
			News("Grande enchente assola a região de {0}",Modifier("modinfraestrutura",0.9)),
			News("Fome em {0} atinge níveis alarmantes",Modifier("modtrabalho",1.1)),
			News("Nelson Carlos confirma show em {0}",Modifier()),
			News("Grande assalto ao banco de {0} deixa mortos e feridos",Modifier("modseguranca",0.3)),
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

		textbox = gameObject.GetComponentInChildren[of Text]()
		textbox.text = [(n as News).getText() for n in news].Join("                                                               ")
		initx = transform.position.x
	
	def Update ():
		if (transform.position.x + Camera.mainCamera.ScreenToWorldPoint(Vector3(textbox.preferredWidth+Screen.width/1.4,0,0)).x < 0):
			transform.position.x = initx
		
		transform.position.x -= 1*Time.deltaTime

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
		pickRandomArea()
	
	def constructor(investmentmod as string,modvalue as single):
		pickRandomArea()
			
	def constructor(investmentmod as string,modvalue as single,areaname as string):
		pickRandomArea()
		
	def pickRandomArea():
		areas = GameObject.FindObjectsOfType(Area)
		area = areas[Random.Range(0,len(areas))]
			
	def getAreaName():
		return area.name
			
		
		