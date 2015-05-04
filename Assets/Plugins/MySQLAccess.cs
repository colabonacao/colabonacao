using UnityEngine;
using System.Collections;
using MySql.Data.MySqlClient;
using System;

public class MySQLAccess : MonoBehaviour {
	private MySqlConnection connection = new MySqlConnection ();
	private MySqlDataReader rdr;
	private string server;
	private string database;
	private string uid;
	private string password;

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
			database + ";" + "user=" + uid + ";" + "password=" + password + ";";
		
		connection = new MySqlConnection(connectionString);
		
		
		
	}

	//open connection to database
	public bool OpenConnection()
	{
		try
		{
			connection.Open();
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
