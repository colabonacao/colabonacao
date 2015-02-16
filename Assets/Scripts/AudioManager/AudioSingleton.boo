import UnityEngine

class AudioSingleton(MonoBehaviour):

	private static _instance as AudioSingleton

	public static instance as AudioSingleton:
		get:
			if _instance is null:
				_instance = GameObject.FindObjectOfType(AudioSingleton)
				
			if _instance is not null:
				//Tell unity not to destroy this object when loading a new scene!
				DontDestroyOnLoad(_instance.gameObject)
			
			return _instance

	
	private def Awake() as void:
		if _instance is null:
			//If I am the first instance, make me the Singleton
			_instance = self
			DontDestroyOnLoad(self)
		elif self != _instance:
		//If a Singleton already exists and you find
		//another reference in scene, destroy it!
			Destroy(self.gameObject)

	def ClearSounds(time as single):
		musics as (MusicClass) = (FindObjectsOfType(typeof(MusicClass)) as (MusicClass))
		sounds as (SoundEffectClass) = (FindObjectsOfType(typeof(SoundEffectClass)) as (SoundEffectClass))
		for music as MusicClass in musics:
			if music.source == null:
				Destroy(music.gameObject, time)
		for sound as SoundEffectClass in sounds:
			if sound.source == null:
				Destroy(sound.gameObject, time)