package pkg3;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import java.util.ArrayList;
import java.io.*;

public class PatientAppointmentDAO implements Serializable {
	static Connection conn=null;
	public PatientAppointmentDAO()
	{
		//conn= Generate_SQLConnection.ReturnConnection();
	}
	
	public void Insert_PatientAppointment(PatientAppointment obj)
	{
            Connection conn1=getConnection();
		String sql="Insert into patientappointment(P_name,P_contact,P_disease,P_apt_date,P_apt_day,D_id,D_location) values(?,?,?,?,?,?,?) ";
		try
		{
		PreparedStatement preStmt = conn1.prepareStatement(sql);
		//preStmt.setInt(1,obj.getP_id());
		preStmt.setString(1,obj.getP_name());
		preStmt.setString(2,obj.getP_contact());
		preStmt.setString(3,obj.getP_disease());
		preStmt.setString(4,obj.getP_apt_date());
		preStmt.setString(5,obj.getP_apt_day());
		preStmt.setInt(6,obj.getD_id());
		preStmt.setString(7,obj.getL_name());
		System.out.println(preStmt.execute());
		preStmt.close();
		}
		catch(Exception e)
		{
			System.out.println("not inserted");
		}
                finally{
                    
                }
                

	}
        public Connection getConnection()
	{
		String CONN_STRING="jdbc:mysql://localhost/health_care";
		 try {
			Class.forName("com.mysql.jdbc.Driver");
		 conn=DriverManager.getConnection(CONN_STRING,"root","");
                 System.out.println("connected");
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		 return conn;
	}
        
        public ArrayList getAppointments(int id)
        {
            Connection conn1=getConnection();
            ArrayList list=new ArrayList();
		
		String sql = "SELECT * FROM patientappointment WHERE D_id=? AND  YEARWEEK(P_apt_date)=YEARWEEK(NOW()); ";
		
		try 
		{
		PreparedStatement preStmt = conn1.prepareStatement(sql);
		preStmt.setInt(1,id);
		ResultSet rs = preStmt.executeQuery();
		while(rs.next())
		{
			PatientAppointment obj=new PatientAppointment ();
                        obj.setP_name(rs.getString(2));
                        obj.setP_contact(rs.getString(3));
                        obj.setP_disease(rs.getString(4));
                        obj.setP_apt_date(rs.getString(5));
                        obj.setP_apt_day(rs.getString(6));
                        obj.setL_name(rs.getString(8)); 
			list.add(obj);
		}

		}
		catch(Exception e)
		{
			
		}
		finally
		{
			try {
				conn1.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return list;
		}
        }
	public void Delete_PatientAppointment(PatientAppointment obj) throws SQLException {
		String sql = "DELETE FROM patientAppointment WHERE P_id=?;";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setInt(1,obj.getP_id());
		System.out.println(preStmt.execute());
		preStmt.close();

	}
	public void Update_Appointment(PatientAppointment obj) throws SQLException {
		String sql = "UPDATE patientappointment SET P_name=?,P_contact=?,P_disease=?,P_apt_date=?,P_apt_time=?,P_apt_day=?,D_id=?,L_name=? " + //
				"WHERE P_id=?";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setString(1,obj.getP_name());
		preStmt.setString(2,obj.getP_contact());
		preStmt.setString(3,obj.getP_disease());
		preStmt.setString(4,obj.getP_apt_date());
		preStmt.setString(5,obj.getP_apt_time());
		preStmt.setString(6,obj.getP_apt_day());
		preStmt.setInt(7,obj.getD_id());
		preStmt.setString(8,obj.getL_name());
		preStmt.setInt(9,obj.getP_id());
		System.out.println(preStmt.execute());
		preStmt.close();


	}

	/*public static void main(String args[])
                {
                    pkg3.PatientAppointment obj=new pkg3.PatientAppointment();
                    obj.setP_name("ahmad faraz");
                    obj.setP_contact("0321-1371154");
                    obj.setP_disease("Heart");
                    obj.setP_apt_date("2018-02-09");
                    obj.setP_apt_day("Friday");
                    obj.setD_id(1);
                    obj.setL_name("Defence H-Block");
                    //obj.setP_id(1);
                    pkg3.PatientAppointmentDAO ob=new pkg3.PatientAppointmentDAO();
                    ob.Insert_PatientAppointment(obj);
        }*/


}
