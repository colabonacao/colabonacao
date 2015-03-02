import UnityEngine
import UnityEngine.UI

class PlayMovie (MonoBehaviour): 

	def PlayMovie ():
		movie as MovieTexture = GetComponent[of RawImage]().texture as MovieTexture
		movie.Play()
		sound as AudioSource = GetComponent[of AudioSource]()
		sound.clip = movie.audioClip
		sound.Play()
