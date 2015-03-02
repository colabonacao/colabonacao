import UnityEngine

class MoviePlayer (MonoBehaviour): 
	
	public movieArray as (GameObject)

	def Start ():
		StartCoroutine(MoviePlay())
		
	private def ChangeScene (sceneName as string):
		AutoFade.LoadLevel(sceneName, 0.2f, 0.1f, Color.black)
		
	def MoviesEnded ():
		ChangeScene('MainMenu')
		
	def MoviePlay () as IEnumerator:
		Handheld.PlayFullScreenMovie ("sinapses.mp4", Color.black, FullScreenMovieControlMode.CancelOnInput, FullScreenMovieScalingMode.AspectFit);
		yield WaitForSeconds(1)
		Handheld.PlayFullScreenMovie ("vinheta_tg_studio.mp4", Color.black, FullScreenMovieControlMode.CancelOnInput, FullScreenMovieScalingMode.AspectFit);
		yield WaitForSeconds(1)
		MoviesEnded()
