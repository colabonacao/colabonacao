using UnityEngine;
using System.Collections;
using MySql.Data.MySqlClient;
using System;

public class MySQLAccess : MonoBehaviour {
	private MySqlConnection connection = new MySqlConnection ();
	//private MySqlDataReader rdr;
	private string server = "colabonacao.mysql.uhserver.com";
	private string database = "colabonacao";
	private string uid = "colabonacao";
	//private string password = "Y4yHd8FjwM2PKgO!";

	public MySQLAccess(string host, string db, string user, string psw)
	{
		connection = null;
		//rdr = null;
		
		Initialize(host, db, user, psw);
		
	}

	private void Initialize(string host, string db, string user, string psw)
	{
		server = host;
		database = db;
		uid = user;
		//password = psw;
		string connectionString;
		connectionString = "server=" + server + ";" + "database=" +
			database + ";" + "user=" + uid + ";" + "password=" + psw + ";";
		connection = new MySqlConnection(connectionString);
	}

	//open connection to database
	public bool OpenConnection()
	{
		try
		{
			connection.Open();
			Debug.Log("Conectado!");
			return true;
		}
		catch (Exception ex)
		{
			Debug.Log(ex.Message);
			return false;
		}
		
	}
	
	//Close connection
	public bool CloseConnection()
	{
		try
		{
			connection.Close();
			return true;
		}
		catch (Exception ex)
		{
			Debug.Log(ex.Message);
			return false;
		}
	}    
	
	// Use this for initialization
	void Start () {
		
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
