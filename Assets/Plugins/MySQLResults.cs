using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class MySQLResults : MonoBehaviour {
	public string addScoreURL = "http://colabonacao.com.br/sendData.php?"; 
	public string newGameURL = "http://colabonacao.com.br/newGame.php?";
	private string secretKey = "key"; // Edit this value and make sure it's the same as the one stored on the server
	public Dictionary<int, Dictionary<int, Dictionary<string, double>>> jogadores = new Dictionary<int, Dictionary<int, Dictionary<string, double>>> ();
	public List<List<string>> objetos = new List<List<string>>();
	public Dictionary<int, Dictionary<string, double>> investimentoTurnos = new Dictionary<int, Dictionary<string, double>>();
	List<string> queries = new List<string>();
	public List<System.DateTime> dataJogada = new List<System.DateTime>();
	public int dicSize;
	// Use this for initialization
	void Start () {

	}

	void Awake () {
		DontDestroyOnLoad (transform.gameObject);
	}

	void Update () {
		dicSize = jogadores.Count;	
	}

	public float[] GetValuesList(int player, int turn)
	{
		float[] temp = new float[10];
		int i = 0;
		foreach(KeyValuePair<string, double> investimento in jogadores[player][turn]){
			if(!investimento.Key.Contains("turno"))
			{
				float margem = 5;
				if(investimento.Value > 0)
					margem = 0;
				temp[i] = (float)investimento.Value + margem;
				i++;
			}
		}
			
		return temp;
	}

	public void ListaPlayers()
	{
		foreach (KeyValuePair<int, Dictionary<int, Dictionary<string, double>>> item in jogadores) {
			Debug.Log(item.Key);
		}
	}

	public IEnumerator BuildData(string cidade, string dificuldade)
	{
		//Debug.Log ("Building");
		string ID = "";
		foreach (KeyValuePair<int, Dictionary<string, double>> item in investimentoTurnos) 
		{
			string formattedDate = dataJogada[item.Key].Year 
				+ "-" + dataJogada[item.Key].Month 
					+ "-" + dataJogada[item.Key].Day 
					+ "%20" + dataJogada[item.Key].Hour 
					+ ":" + dataJogada[item.Key].Minute 
					+ ":" + dataJogada[item.Key].Second;

			string queryString = addScoreURL + "turno=" + (item.Key+1) + "&" + "cidade=" + cidade 
				+ "&dificuldade=" + dificuldade + "&jogador=" + SystemInfo.deviceUniqueIdentifier + "&dataJogada=" + formattedDate + "&";
			foreach(KeyValuePair<string, double> investimento in investimentoTurnos[item.Key])
			{
				queryString += investimento.Key + "=" + investimento.Value + "&";
			}
			queryString = queryString.Substring(0, queryString.Length-1);
			queries.Add(queryString);
		}
		foreach (string str in queries) {
			StartCoroutine(SendData(str));
		}
		yield return new WaitForSeconds (0.0f);
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

		if (hs_post.error != null) {
			print ("There was an error posting the high score: " + hs_post.error);
			Debug.Log ("Erro");
		} else {
			//Debug.Log("Sucesso");
			//result(hs_post.responseHeaders);
		}
	}

	public IEnumerator GetValues(int playerID, string cidade)
	{
		string getURL = newGameURL + "cidade=" + WWW.EscapeURL (cidade) + "&jogador=" + SystemInfo.deviceUniqueIdentifier;
		WWW hs_get = new WWW(getURL);
		yield return hs_get;
		//System.Single[] randomNums = new float[lenght];
		if (hs_get.error != null)
		{
			print("There was an error getting the high score: " + hs_get.error);
		}
		else
		{
			string[] retorno = hs_get.text.Substring(0, hs_get.text.Length-1).Split('|');
			Dictionary<int, Dictionary<string, double>> jogadas = new Dictionary<int, Dictionary<string, double>>();
			for(int i = 0; i < retorno.Length; i++)
			{
				string[] turno = retorno[i].Replace("{", "").Replace("}","").Split(',');
				Dictionary<string, double> temp = new Dictionary<string, double>();
				for(int j = 0; j < turno.Length; j++)
				{
					string[] dados = turno[j].Split(':');
					if(!temp.ContainsKey(dados[0]))
					{
						temp.Add(dados[0], double.Parse(dados[1]));
					}
				}
				if(!jogadas.ContainsKey(i))
				{
					jogadas.Add(i, temp);
				}
			}
			if(!jogadores.ContainsKey(playerID))
			{
				jogadores.Add(playerID, jogadas);
			}
		}
	}
}