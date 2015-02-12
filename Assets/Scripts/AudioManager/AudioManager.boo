import UnityEngine

class AudioManager (MonoBehaviour): 

	private singleton as AudioSingleton
	
	public musicVolumeToggle as UI.Toggle
	public soundVolumeToggle as UI.Toggle
	
	public startMusic as MusicClass
	
	def Start ():
		singleton = AudioSingleton.instance
		children as (Transform)
		children = self.GetComponentsInChildren[of Transform]()
		singleChildren = singleton.GetComponentsInChildren[of Transform]()
		for child as Transform in children:
			if child.name != self.name:
				for singleChild as Transform in singleChildren:
					if child.name == singleChild.name:
						Destroy(singleChild.gameObject)
				child.parent = singleton.transform
		if musicVolumeToggle is not null:
			musicVolumeToggle.isOn = (true if PlayerPrefs.GetInt("MusicOn", 1) else false)
		if soundVolumeToggle is not null:
			soundVolumeToggle.isOn = (true if PlayerPrefs.GetInt("SoundOn", 1) else false)
		if startMusic is not null:
			PlayMusic(startMusic.name)
		
	def MusicToggle (newState as bool):
		musics as (MusicClass)
		musics = singleton.GetComponentsInChildren[of MusicClass]()
		for music as MusicClass in musics:
			music.ToggleOn(newState)
		PlayerPrefs.SetInt("MusicOn", (1 if newState else 0))
		
	def SoundEffectsToggle (newState as bool):
		sounds as (SoundEffectClass)
		sounds = singleton.GetComponentsInChildren[of SoundEffectClass]()
		for sound as SoundEffectClass in sounds:
			sound.ToggleOn(newState)
		PlayerPrefs.SetInt("SoundOn", (1 if newState else 0))
		
	def MusicVolume (newVolume as single):
		musics as (MusicClass)
		musics = singleton.GetComponentsInChildren[of MusicClass]()
		for music as MusicClass in musics:
			music.Volume(newVolume)
		PlayerPrefs.SetFloat("MusicVolume", newVolume)
		
	def SoundEffectsVolume (newVolume as single):
		sounds as (SoundEffectClass)
		sounds = singleton.GetComponentsInChildren[of SoundEffectClass]()
		for sound as SoundEffectClass in sounds:
			sound.Volume(newVolume)
		PlayerPrefs.SetFloat("SoundVolume", newVolume)
		
	def PlayMusic (id as string):
		musics as (MusicClass)
		musics = singleton.GetComponentsInChildren[of MusicClass]()
		for music as MusicClass in musics:
			if music.name == id:
				if music.source != null:
					music.source.Play()
			else:
				if music.source != null:
					music.source.Stop()
				Destroy(music.gameObject)
	
	def StopMusics():
		musics as (MusicClass)
		musics = singleton.GetComponentsInChildren[of MusicClass]()
		for music as MusicClass in musics:
			if music.source != null:
				music.source.Stop()

	def PlaySound (id as string):
		sounds as (SoundEffectClass)
		sounds = singleton.GetComponentsInChildren[of SoundEffectClass]()
		for sound as SoundEffectClass in sounds:
			if sound.name == id:
				if sound.source != null:
					sound.source.Play()
	
	def StopSounds():
		sounds as (SoundEffectClass)
		sounds = singleton.GetComponentsInChildren[of SoundEffectClass]()
		for sound as SoundEffectClass in sounds:
			if sound.source != null:
				sound.source.Stop()
