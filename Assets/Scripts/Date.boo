import UnityEngine
import UnityEngine.UI
import City

class Date (MonoBehaviour): 
	private textbox as Text
	private dt as System.DateTime
	private timeelapsed as single = 0.0F
	private city as City
	private paused = false

	def Start ():
		textbox = gameObject.GetComponent(Text)
		dt = System.Convert.ToDateTime("01/01/2014");
		city = GameObject.FindObjectOfType(City) as City
	
	def Update ():
		if not paused:
			timeelapsed = timeelapsed + Time.deltaTime
		daystoadd = Mathf.Floor(timeelapsed / 1.6)
		monthstoadd = (city.getTurn()) * 6
		//if time is up
		if (dt + dt.AddDays(daystoadd).AddMonths(monthstoadd).Subtract(dt.AddMonths(monthstoadd))).Month > 5:
			//only on casual - stop the timer
			timeelapsed = timeelapsed - Time.deltaTime 
			daystoadd = Mathf.Floor(timeelapsed / 1.6)

		textbox.text = string.Format("{0:dd/MM/yyyy}", dt.AddDays(daystoadd).AddMonths(monthstoadd))
		
	def setPaused(toset):
		paused = toset

	def reset():
		timeelapsed = 0.0F
		
		

