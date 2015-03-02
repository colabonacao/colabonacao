import UnityEngine
import UnityEngine.UI

class PlayMovie (MonoBehaviour): 

	def PlayThis ():
		gameObject.SetActive(true)
		StartCoroutine(MoviePlay())
		
	def MoviePlay () as IEnumerator:
		yield WaitForSeconds(2)
		//movie as MovieTexture = GetComponent[of RawImage]().texture as MovieTexture
		//movie.Play()
		//sound as AudioSource = GetComponent[of AudioSource]()
		//sound.clip = movie.audioClip
		//sound.Play()
