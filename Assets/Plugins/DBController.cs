using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class DBController : MonoBehaviour
{
	private string secretKey = "key"; // Edit this value and make sure it's the same as the one stored on the server
	public string addScoreURL = "http://ataitson.com.br/sendData.php?"; //be sure to add a ? to your url
	public string highscoreURL = "http://ataitson.com.br/newGame.php?";
	public DBController(string pCityName, string pDificuldade)
	{

	}

	void Initialize()
	{
		//StartCoroutine(PostScores(cityName, dificuldade));
	}
	
	// remember to use StartCoroutine when calling this function!
	public IEnumerator PostScores(string cidade, string dificuldade)
	{
		//This connects to a server side php script that will add the name and score to a MySQL DB.
		// Supply it with a string representing the players name and the players score.
		string hash = MD5Test.Md5Sum(cidade + dificuldade + secretKey);

		string post_url = addScoreURL + "cidade=" + WWW.EscapeURL(cidade) + "&dificuldade=" + WWW.EscapeURL(dificuldade) + "&hash=" + hash;
		// Post the URL to the site and create a download object to get the result.
		WWW hs_post = new WWW(post_url);
		yield return hs_post; // Wait until the download is done

		if (hs_post.error != null) {
			print ("There was an error posting the high score: " + hs_post.error);
			Debug.Log ("Erro");
		} else {
			foreach(KeyValuePair<string, string> item in hs_post.responseHeaders)
			{Debug.Log(item.Key + ": " + item.Value);}
		}
	}
	
	// Get the scores from the MySQL DB to display in a GUIText.
	// remember to use StartCoroutine when calling this function!
	public IEnumerator GetScores(string cidade)
	{
		WWW hs_get = new WWW(highscoreURL + "cidade=" + WWW.EscapeURL(cidade));
		yield return hs_get;
		
		if (hs_get.error != null)
		{
			print("There was an error getting the high score: " + hs_get.error);
		}
		else
		{
			//gameObject.guiText.text = hs_get.text; // this is a GUIText that will display the scores in game.
		}
	}
	
}