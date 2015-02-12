import UnityEngine

class MouseCameraControl (MonoBehaviour): 
	hasinertia = false
	velocity = Vector2(0,0)
	minCamSize = 1
	maxCamSize = 10
	startPosition = Vector3(0,0,0)
	public inertia = 0.9f
	public restrainTo as GameObject = null
	public on as bool = true

	def Start ():
		pass
	
	def Update ():
		if on:
			if Input.GetMouseButtonDown(0):
				startPosition = transform.position
			
			if Input.GetMouseButton(0):
				hasinertia = false
				velocity = Vector2(0,0)
				speed = Camera.main.orthographicSize //reduce speed when zoomed in
				transform.position += Vector3(-Input.GetAxisRaw ("Mouse X") * Time.deltaTime * speed, -Input.GetAxisRaw ("Mouse Y") * Time.deltaTime * speed, 0f)
				velocity = Vector2(-Input.GetAxisRaw ("Mouse X")*speed,-Input.GetAxisRaw ("Mouse Y")*speed)
			
			if Input.GetMouseButtonUp(0):
				if (velocity.magnitude >= Vector2(0.01f,0.01f).magnitude):
					hasinertia = true
		
			if hasinertia: //inertial movement
				transform.position += Vector3 (velocity.x * Time.deltaTime, velocity.y * Time.deltaTime, 0f)
				velocity = Vector2.Scale(velocity,Vector2(Mathf.Max(inertia-Time.deltaTime,0),Mathf.Max(inertia-Time.deltaTime,0))) //0.9f
				if (velocity.magnitude < Vector2(0.01f,0.01f).magnitude):
					hasinertia = false;
					
			//Zoom
			if (Input.GetAxis("Mouse ScrollWheel") < 0): // zoom back 
				Camera.main.orthographicSize = Mathf.Max(Camera.main.orthographicSize-1, minCamSize)
			if (Input.GetAxis("Mouse ScrollWheel") > 0): // zoom forward
				Camera.main.orthographicSize = Mathf.Min(Camera.main.orthographicSize+1, maxCamSize)
				
			if restrainTo != null:
				camBL = Camera.main.ViewportToWorldPoint(Vector2(0,0))
				camTR = Camera.main.ViewportToWorldPoint(Vector2(1,1))
				cameraRect = Rect(camBL.x,camTR.y,camTR.x-camBL.x,camBL.y-camTR.y)
				if cameraRect.left < restrainTo.renderer.bounds.min.x:
					transform.position.x = restrainTo.renderer.bounds.min.x + cameraRect.width/2
				if cameraRect.right > restrainTo.renderer.bounds.max.x:
					transform.position.x = restrainTo.renderer.bounds.max.x - cameraRect.width/2
				if cameraRect.top > restrainTo.renderer.bounds.max.y:
					transform.position.y = restrainTo.renderer.bounds.max.y + cameraRect.height/2 //height is negative
				if cameraRect.bottom < restrainTo.renderer.bounds.min.y:
					transform.position.y = restrainTo.renderer.bounds.min.y - cameraRect.height/2 //height is negative
				
	public def hasMoved():
		if on:
			//how much movement we will tolerate before considering this a click
			return Vector3.Distance(startPosition,transform.position) > 0.15f 
		else:
			return false
		
	public def enable():
		enabled = true
		
	public def disable():
		enabled = false