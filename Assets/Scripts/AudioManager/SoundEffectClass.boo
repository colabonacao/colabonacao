import UnityEngine

class SoundEffectClass (MonoBehaviour): 
	
	public source as AudioSource

	def Volume(newVolume as single):
		source.volume = newVolume
		