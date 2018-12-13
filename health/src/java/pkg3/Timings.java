package pkg3;
import java.io.Serializable;

public class Timings implements Serializable{
	private int D_id;
	private String Time;
	private String Day;
	private int duration;
	private int patient_limit;
	public Timings()
	{
		
	}
	public int getD_id() {
		return D_id;
	}
	public void setD_id(int d_id) {
		D_id = d_id;
	}
	public String getTime() {
		return Time;
	}
	public void setTime(String time) {
		Time = time;
	}
	public String getDay() {
		return Day;
	}
	public void setDay(String day) {
		Day = day;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public int getPatient_limit() {
		return patient_limit;
	}
	public void setPatient_limit(int patient_limit) {
		this.patient_limit = patient_limit;
	}
	
		

}
