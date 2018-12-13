package pkg3;

import java.io.Serializable;

public class Doctor implements Serializable {
	private int D_id;
	private String D_name;
	private String D_spec;
	private String D_contact;
	private String D_city;
	private String D_location;
        private String D_username;
	private int D_charges;
	
	public Doctor()
	{
		
	}


	public int getD_id() {
		return D_id;
	}


	public void setD_id(int d_id) {
		D_id = d_id;
	}


	public String getD_name() {
		return D_name;
	}
public int getD_charges() {
		return D_charges;
	}


	public void setD_charges(int d_charges) {
		D_charges = d_charges;
	}

	public void setD_name(String d_name) {
		D_name = d_name;
	}


	public String getD_spec() {
		return D_spec;
	}


	public void setD_spec(String d_spec) {
		D_spec = d_spec;
	}


	public String getD_contact() {
		return D_contact;
	}


	public void setD_contact(String d_contact) {
		D_contact = d_contact;
	}


	

	public String getD_city() {
		return D_city;
	}


	public void setD_city(String d_city) {
		D_city = d_city;
	}


	public String getD_location() {
		return D_location;
	}


	public void setD_location(String d_location) {
		D_location = d_location;
	}
        
        public String getD_username() {
		return D_username;
	}


	public void setD_username(String d_username) {
		D_username = d_username;
	}
		
	

}
