import UnityEngine
import UnityEngine.UI
import PieChartMeshController

class SelectorStats (MonoBehaviour):
	
	private selections = ["Resumo Geral","Jogador 1","Jogador 2","Jogador 3","Jogador 4","Jogador 5","Jogador 6","Jogador 8"]
	private textbox as Text
	private index = 0
	public piechart as PieChartMeshController

	def Start ():
		textbox = gameObject.GetComponentInChildren[of Text]()
	
	def Update ():
		pass
		
	def nextselection():
		index = (index + 1) % len(selections)
		textbox.text = selections[index]
		piechart.setValues()
		
	def previousselection():
		index = ((index - 1) < 0) and (len(selections)-1) or (index-1)
		textbox.text = selections[index]
		piechart.setValues()
		
