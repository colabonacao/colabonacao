import UnityEngine

class MusicClass (MonoBehaviour): 

	public source as AudioSource
		
	def Volume(newVolume as single):
		if source != null:
			source.volume = newVolume
			
	def ToggleOn(newState as bool):
		source.mute = not newState
		