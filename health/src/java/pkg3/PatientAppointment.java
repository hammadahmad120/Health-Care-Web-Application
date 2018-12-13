package pkg3;
import java.io.Serializable;
public class PatientAppointment implements Serializable {
	private int P_id;
	private String P_name;
	private String P_contact;
	private String P_disease;
	private String P_apt_date;
	private String P_apt_time;
	private String P_apt_day;
	private int D_id;
	private String L_name;
        public PatientAppointment()
        {
            
        }
	public int getP_id() {
		return P_id;
	}
	public void setP_id(int p_id) {
		P_id = p_id;
	}
	public String getP_name() {
		return P_name;
	}
	public void setP_name(String p_name) {
		P_name = p_name;
	}
	public String getP_contact() {
		return P_contact;
	}
	public void setP_contact(String p_contact) {
		P_contact = p_contact;
	}
	public String getP_disease() {
		return P_disease;
	}
	public void setP_disease(String p_disease) {
		P_disease = p_disease;
	}
	public String getP_apt_date() {
		return P_apt_date;
	}
	public void setP_apt_date(String p_apt_date) {
		P_apt_date = p_apt_date;
	}
	public String getP_apt_time() {
		return P_apt_time;
	}
	public void setP_apt_time(String p_apt_time) {
		P_apt_time = p_apt_time;
	}
	public String getP_apt_day() {
		return P_apt_day;
	}
	public void setP_apt_day(String p_apt_day) {
		P_apt_day = p_apt_day;
	}
	public int getD_id() {
		return D_id;
	}
	public void setD_id(int d_id) {
		D_id = d_id;
	}
	public String getL_name() {
		return L_name;
	}
	public void setL_name(String l_name) {
		L_name = l_name;
	}
	
	

}
