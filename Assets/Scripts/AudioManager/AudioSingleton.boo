import UnityEngine

class AudioSingleton(MonoBehaviour):

	private static _instance as AudioSingleton

	public static instance as AudioSingleton:
		get:
			if _instance is null:
				_instance = GameObject.FindObjectOfType(AudioSingleton)
				
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
