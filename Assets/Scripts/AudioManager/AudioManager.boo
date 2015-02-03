import UnityEngine

class AudioManager (MonoBehaviour): 

	private singleton as AudioSingleton
	
	public MusicVolumeSlider as UI.Slider
	public SoundVolumeSlider as UI.Slider
	
	def Start ():
		singleton = AudioSingleton.instance
		if MusicVolumeSlider is not null:
			MusicVolumeSlider.value = PlayerPrefs.GetFloat("MusicVolume", 1.0f)
		if SoundVolumeSlider is not null:
			SoundVolumeSlider.value = PlayerPrefs.GetFloat("SoundVolume", 1.0f)
		
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
		
	/*
		Acceptable values:
			MM_music
			
		This uses string instead of enum because OnClick does not accept enums.
	*/
	def PlayMusic (id as string):
		musics as (MusicClass)
		musics = singleton.GetComponentsInChildren[of MusicClass]()
		for music as MusicClass in musics:
			music.source.Stop()
			if music.name == id:
				music.source.Play()
	
	def StopMusics():
		musics as (MusicClass)
		musics = singleton.GetComponentsInChildren[of MusicClass]()
		for music as MusicClass in musics:
			music.source.Stop()
	/*
		Acceptable values:
			button_select
			
		This uses int instead of enum because OnClick does not accept enums.
	*/	
	def PlaySound (id as string):
		sounds as (SoundEffectClass)
		sounds = singleton.GetComponentsInChildren[of SoundEffectClass]()
		for sound as SoundEffectClass in sounds:
			if sound.name == id:
				sound.source.Play()
	
	def StopSounds():
		sounds as (SoundEffectClass)
		sounds = singleton.GetComponentsInChildren[of SoundEffectClass]()
		for sound as SoundEffectClass in sounds:
			sound.source.Stop()