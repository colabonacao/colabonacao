﻿import UnityEngine
import UnityEngine.UI
import MouseCameraControl
import Area


class RegularMenu (MonoBehaviour): 
	public AnimatedPanel as Animator
	
	def Start ():
		dismiss()
	
	def Update ():
		pass
		
	public def invoke():
		menus = GameObject.FindObjectsOfType(RegularMenu) as (RegularMenu)
		for m in menus:
			m.dismiss()
		gameObject.active = true
		//AnimatedPanel.SetBool("slideOut",false) 
		areas = GameObject.FindObjectsOfType(Area) as (Area)
		for area in areas:
			area.setSelectable(false)
			
	public def dismiss():
		//AnimatedPanel.SetBool("slideOut",true) 
		areas = GameObject.FindObjectsOfType(Area)
		for area in areas:
			area.setSelected(false)
			area.setSelectable(true)
		gameObject.active = false
		
		
		