import UnityEngine

class StageCheck (MonoBehaviour): 

	public stagePicked as StageEnum.Stages = StageEnum.Stages.Brasilia
	public WhereToInsert as GameObject
	private citynames = ["Manaus","Rio Branco","Maceió","Macapá","Salvador","Brasília",
	"Fortaleza","Vitória","Goiânia","São Luis","Cuiabá","Campo Grande","Belo Horizonte","Belém",
	"João Pessoa","Curitiba","Recife","Terezina","Rio de Janeiro","Natal","Porto Alegre","Porto Velho",
	"Boa Vista","Florianópolis","São Paulo","Aracaju","Palmas"]
	
	def Start():
		
		StageChosenInstance = GameObject.FindObjectOfType(StageChosen)
		
		if StageChosenInstance is not null:
			stagePicked = StageChosenInstance.stagePicked
			Destroy(StageChosenInstance.gameObject)
			
		loadcity = Resources.Load("City/$(citynames[stagePicked])")
		if loadcity == null:
			loadcity = Resources.Load("City/Brasília")
		
		cityObj = Instantiate(loadcity) as GameObject
		cityObj.transform.SetParent(WhereToInsert.transform)
		t = cityObj.transform as RectTransform
		t.position = Vector3(0,0,0)
		t.sizeDelta = Vector3(0,0,0)
		t.localScale = Vector3(1,1,1)
		audioman = GameObject.FindObjectOfType(AudioManager) as AudioManager
		audioman.PlayMusic((cityObj.GetComponent[of City]() as City).getMusicName())
		cityObj.name = citynames[stagePicked]
		
		
			
	