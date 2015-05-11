using UnityEngine;
using System.Collections;
using MySql.Data.MySqlClient;
using System;

public class MySQLAccess : MonoBehaviour {
	private MySqlConnection connection = new MySqlConnection ();
	private MySqlDataReader rdr;
	private string server = "127.0.0.1";
	private string database = "condominio";
	private string uid = "colabonacao";
	private string password = "colab123";

	public MySQLAccess(string host, string db, string user, string psw)
	{
		connection = null;
		rdr = null;
		
		Initialize(host, db, user, psw);
		
	}

	private void Initialize(string host, string db, string user, string psw)
	{
		server = host;
		database = db;
		uid = user;
		password = psw;
		string connectionString;
		connectionString = "server=" + server + ";" + "database=" +
			database + ";" + "user=" + uid + ";";
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
