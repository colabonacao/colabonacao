import UnityEngine
import UnityEngine.UI

class Date (MonoBehaviour): 
	private textbox as Text
	private dt as System.DateTime
	private timeelapsed as single
	private city as City

	def Start ():
		textbox = gameObject.GetComponent(Text)
		dt = System.Convert.ToDateTime("01/01/2014");
		city = GameObject.FindObjectOfType(City) as City
	
	def Update ():
		timeelapsed = timeelapsed + Time.deltaTime
		daystoadd = Mathf.Floor(timeelapsed / 1.6)
		monthstoadd = (city.getTurn()-1) * 6
		//if time is up
		if (dt + dt.AddDays(daystoadd).AddMonths(monthstoadd).Subtract(dt.AddMonths(monthstoadd))).Month > 5:
			//only on casual - stop the timer
			timeelapsed = timeelapsed - Time.deltaTime 
			daystoadd = Mathf.Floor(timeelapsed / 1.6)

		textbox.text = string.Format("{0:dd/MM/yyyy}", dt.AddDays(daystoadd).AddMonths(monthstoadd))
		
		

