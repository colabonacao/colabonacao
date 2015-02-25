import UnityEngine

class CardManager (MonoBehaviour): 

	public cards as (GameObject)
	private currentCardIndex as int = 0
	
	def Start():
		cards[0].GetComponent[of Animator]().SetBool("isStart", true)
		cards[0].GetComponent[of Animator]().SetBool("toRight", false)
		cards[(cards.Length - 1)].GetComponent[of Animator]().SetBool("isEnd", true)
		
		
	def PreviousCard ():
		if (currentCardIndex == 0):
			cards[currentCardIndex].GetComponent[of Animator]().Play('card_slide_cant')
		else:
			cards[currentCardIndex].GetComponent[of Animator]().SetBool("toRight", true)
			currentCardIndex--
			cards[currentCardIndex].GetComponent[of Animator]().SetBool("toLeft", false)
	
	def NextCard ():
		if (currentCardIndex == (cards.Length - 1)):
			cards[currentCardIndex].GetComponent[of Animator]().Play('card_slide_cant')
		else:
			cards[currentCardIndex].GetComponent[of Animator]().SetBool("toLeft", true)
			currentCardIndex++
			cards[currentCardIndex].GetComponent[of Animator]().SetBool("toRight", false)
