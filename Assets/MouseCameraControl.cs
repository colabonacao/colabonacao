using UnityEngine;
using System.Collections;

public class MouseCameraControl : MonoBehaviour {	
	private bool hasinertia = false;
	private Vector2 velocity = new Vector2(0,0);
	public float inertia = 0.9f;
	
// Update is called once per frame
	void Update () {
		//Pan
		if (Input.GetMouseButton(0)) 
		{
			hasinertia = false;
			velocity = new Vector2(0,0);
			float speed = (float)Camera.main.orthographicSize;
			transform.position += new Vector3 (-Input.GetAxisRaw ("Mouse X") * Time.deltaTime * speed, -Input.GetAxisRaw ("Mouse Y") * Time.deltaTime * speed, 0f);
			velocity = new Vector2(-Input.GetAxisRaw ("Mouse X")*speed,-Input.GetAxisRaw ("Mouse Y")*speed);
		}

		if (Input.GetMouseButtonUp (0)) 
		{
			if (velocity.magnitude >= new Vector2(0.01f,0.01f).magnitude)
			{
				hasinertia = true;
			}
		}
		if (hasinertia) 
		{
			transform.position += new Vector3 (velocity.x * Time.deltaTime, velocity.y * Time.deltaTime, 0f);
			velocity = Vector2.Scale(velocity,new Vector2(Mathf.Max(inertia-Time.deltaTime,0),Mathf.Max(inertia-Time.deltaTime,0))); //0.9f
			Debug.Log("time "+Time.deltaTime*0.09f);
			if (velocity.magnitude < new Vector2(0.01f,0.01f).magnitude)
			{
				hasinertia = false;
			}
		}
		
		//Zoom
		if (Input.GetAxis("Mouse ScrollWheel") < 0) // zoom back 
		{ 
			Camera.main.orthographicSize = Mathf.Max(Camera.main.orthographicSize-1, 1);
			Debug.Log("Drag ended!");
		}
		if (Input.GetAxis("Mouse ScrollWheel") > 0) // zoom forward
		{
			Camera.main.orthographicSize = Mathf.Min(Camera.main.orthographicSize+1, 6);
		}
			
	}
}
	