using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class MySQLResults : MonoBehaviour {
	public string addScoreURL = "http://ataitson.com.br/sendData.php?"; //be sure to add a ? to your url
	private string secretKey = "key"; // Edit this value and make sure it's the same as the one stored on the server
	public Dictionary<int, Dictionary<string, string>> jogadores = new Dictionary<int, Dictionary<string, string>>();
	public List<List<string>> objetos = new List<List<string>>();
	public Dictionary<int, Dictionary<string, double>> investimentoTurnos = new Dictionary<int, Dictionary<string, double>>();
	List<string> queries = new List<string>();
	
	// Use this for initialization
	void Start () {
		
	}

	public IEnumerator BuildData(string cidade, string dificuldade)
	{
		//Debug.Log ("Building");
		string ID = "";
		foreach (KeyValuePair<int, Dictionary<string, double>> item in investimentoTurnos) 
		{
			string queryString = addScoreURL + "turno=" + (item.Key+1) + "&" + "cidade=" + cidade + "&dificuldade=" + dificuldade + "&";
			foreach(KeyValuePair<string, double> investimento in investimentoTurnos[item.Key])
			{
				queryString += investimento.Key + "=" + investimento.Value + "&";
			}
			queryString = queryString.Substring(0, queryString.Length-1);
			queries.Add(queryString);
		}
		yield return StartCoroutine(SendFirstData(queries[0], value => ID = value));
		foreach (string str in queries) {
			StartCoroutine(SendData(str));
		}
		//Debug.Log ("Done");
	}

	public IEnumerator SendData(string post_url)
	{
		//This connects to a server side php script that will add the name and score to a MySQL DB.
		// Supply it with a string representing the players name and the players score.
		Debug.Log (post_url);
		//string post_url = addScoreURL + "cidade=" + WWW.EscapeURL(cidade) + "&dificuldade=" + WWW.EscapeURL(dificuldade) + "&hash=" + hash;
		// Post the URL to the site and create a download object to get the result.
		WWW hs_post = new WWW(post_url);
		//Debug.Log (post_url);
		yield return hs_post; // Wait until the download is done
		Debug.Log("ID: " + hs_post.text);
		if (hs_post.error != null) {
			print ("There was an error posting the high score: " + hs_post.error);
			Debug.Log ("Erro");
		} else {

			//result(hs_post.responseHeaders);
		}
	}

	public IEnumerator SendFirstData(string post_url, System.Action<string> result)
	{
		//This connects to a server side php script that will add the name and score to a MySQL DB.
		// Supply it with a string representing the players name and the players score.
		
		//string post_url = addScoreURL + "cidade=" + WWW.EscapeURL(cidade) + "&dificuldade=" + WWW.EscapeURL(dificuldade) + "&hash=" + hash;
		// Post the URL to the site and create a download object to get the result.
		WWW hs_post = new WWW(post_url);
		//Debug.Log (post_url);
		yield return hs_post; // Wait until the download is done
		Debug.Log("ID: " + hs_post.text);
		if (hs_post.error != null) {
			print ("There was an error posting the high score: " + hs_post.error);
			Debug.Log ("Erro");
		} else {

			foreach(KeyValuePair<string, string> item in hs_post.responseHeaders)
			{
				//Debug.Log(item.Key + ": " + item.Value);
			}
			result(hs_post.text);
		}
	}

	// Update is called once per frame
	void Update () {
		
	}
}