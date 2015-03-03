import UnityEngine

class MoviePlayer (MonoBehaviour): 
	
	public movieArray as (string)

	def Start ():
		StartCoroutine(MoviePlay())
		
	private def ChangeScene (sceneName as string):
		AutoFade.LoadLevel(sceneName, 0.2f, 0.1f, Color.black)
		
	def MoviesEnded ():
		ChangeScene('MainMenu')
		
	def MoviePlay () as IEnumerator:
		for movie as string in movieArray:
			Handheld.PlayFullScreenMovie (movie, Color.black, FullScreenMovieControlMode.CancelOnInput, FullScreenMovieScalingMode.AspectFit)
			yield WaitForSeconds(1)
		MoviesEnded()
