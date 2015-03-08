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
			//Handheld.PlayFullScreenMovie(movie, Color.black, FullScreenMovieControlMode.CancelOnInput, FullScreenMovieScalingMode.AspectFit)
			//yield WaitForSeconds(1)
			
			currentTime as single = Time.timeSinceLevelLoad
			timeDifference as single = (Time.realtimeSinceStartup - currentTime)
 
			Handheld.PlayFullScreenMovie(movie, Color.black, FullScreenMovieControlMode.CancelOnInput, FullScreenMovieScalingMode.AspectFit)
			currentTime = Time.timeSinceLevelLoad + timeDifference // in theory this should be a few seconds off of the real time by now
			if (Mathf.Abs (currentTime - Time.realtimeSinceStartup) < 0.5f):
				// then we didnt actually pause anything.
				// start counting down until Unity is paused
				currentTime = Time.timeSinceLevelLoad + timeDifference; // if we are not paused then this should be close to the real time
				while (Mathf.Abs(currentTime - Time.realtimeSinceStartup) < 0.5f):
					yield WaitForSeconds(0.1f)
					currentTime = Time.timeSinceLevelLoad + timeDifference; // if we are not paused then this should be close to the real time
		MoviesEnded()
