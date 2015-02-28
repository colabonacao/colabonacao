import UnityEngine
import UnityEngine.UI

class PinchZoom (MonoBehaviour):
	private minCamSize as single = 1.0F
	private maxCamSize as single = 10.0F
	private perspectiveZoomSpeed as single = 0.5F
	public orthoZoomSpeed as single = 100F
	private t as RectTransform
	yproportion = 1F
	private parentscrollview as ScrollRect
	
	def Start():
		t = transform as RectTransform
		minCamSize = t.sizeDelta.x
		maxCamSize = 3000
		yproportion = t.sizeDelta.y/t.sizeDelta.x
		parentscrollview = gameObject.GetComponentInParent(ScrollRect) as ScrollRect
		
	def adjustpivot(widthchange as single):
		localPositionPivotRelative as Vector2
		sw = Screen.width / 2
		sh = Screen.height / 2
		RectTransformUtility.ScreenPointToLocalPointInRectangle(t, Vector2(sw,sh), Camera.main, localPositionPivotRelative)

		t.localPosition.x -= (localPositionPivotRelative.x/t.sizeDelta.x) * widthchange*0.5
		t.localPosition.y -= (localPositionPivotRelative.y/t.sizeDelta.y) * widthchange*yproportion*0.5

    // The rate of change of the orthographic size in orthographic mode.
	def Update():
    	//Mouse Zoom
		if (Input.GetAxis("Mouse ScrollWheel") < 0): // zoom back 
			if ((t.sizeDelta.x - orthoZoomSpeed) > minCamSize):
				adjustpivot(-orthoZoomSpeed)
			parentscrollview.velocity = Vector2(0,0)
			t.sizeDelta.x = Mathf.Max(t.sizeDelta.x-orthoZoomSpeed, minCamSize)
			t.sizeDelta.y = Mathf.Max(t.sizeDelta.y-(orthoZoomSpeed*yproportion), minCamSize*yproportion)
		if (Input.GetAxis("Mouse ScrollWheel") > 0): // zoom forward
			if ((t.sizeDelta.x + orthoZoomSpeed) < maxCamSize):
				adjustpivot(orthoZoomSpeed)
			parentscrollview.velocity = Vector2(0,0)
			t.sizeDelta.x = Mathf.Min(t.sizeDelta.x+orthoZoomSpeed, maxCamSize)
			t.sizeDelta.y = Mathf.Min(t.sizeDelta.y+(orthoZoomSpeed*yproportion), maxCamSize*yproportion)
    	
        // If there are two touches on the device...
		if Input.touchCount == 2:
			// Store both touches.
			touchZero as Touch = Input.GetTouch(0)
			touchOne as Touch = Input.GetTouch(1)

            // Find the position in the previous frame of each touch.
			touchZeroPrevPos as Vector2 = (touchZero.position - touchZero.deltaPosition)
			touchOnePrevPos as Vector2 = (touchOne.position - touchOne.deltaPosition)
            
            // Find the magnitude of the vector (the distance) between the touches in each frame.
			prevTouchDeltaMag as single = (touchZeroPrevPos - touchOnePrevPos).magnitude
			touchDeltaMag as single = (touchZero.position - touchOne.position).magnitude
            
            // Find the difference in the distances between each frame.
			deltaMagnitudeDiff as single = (prevTouchDeltaMag - touchDeltaMag)
			
			expected = (t.sizeDelta.x + deltaMagnitudeDiff * orthoZoomSpeed)
			if (expected < maxCamSize) and (expected > minCamSize):
				adjustpivot(deltaMagnitudeDiff * orthoZoomSpeed)
            
            // ... change the scale size based on the change in distance between the touches.
			t.sizeDelta.x += (deltaMagnitudeDiff * orthoZoomSpeed)
			t.sizeDelta.y += (deltaMagnitudeDiff * orthoZoomSpeed * yproportion)
            
            // Make sure the size never drops below min.
			self.transform.localScale.x = Mathf.Max(self.transform.localScale.x, minCamSize)
			self.transform.localScale.y = Mathf.Max(self.transform.localScale.y, minCamSize * yproportion)
			self.transform.localScale.x = Mathf.Min(self.transform.localScale.x, maxCamSize)
			self.transform.localScale.y = Mathf.Min(self.transform.localScale.y, maxCamSize * yproportion)



 