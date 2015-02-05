import UnityEngine

class AudioManager (MonoBehaviour): 

	private singleton as AudioSingleton
	
	public musicVolumeSlider as UI.Slider
	public soundVolumeSlider as UI.Slider
	
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
		if musicVolumeSlider is not null:
			musicVolumeSlider.value = PlayerPrefs.GetFloat("MusicVolume", 1.0f)
		if soundVolumeSlider is not null:
			soundVolumeSlider.value = PlayerPrefs.GetFloat("SoundVolume", 1.0f)
		if startMusic is not null:
			PlayMusic(startMusic.name)
		
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
