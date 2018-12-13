package pkg3;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.io.*;

public class DoctorDAO implements Serializable {
	 Connection conn=null;
	public DoctorDAO()
	{
		//conn= Generate_SQLConnection.ReturnConnection();
	}
	
	public void Insert_Doctor(Doctor obj) 
	{
           Connection conn1=getConnection();
		String sql="Insert into doctor(D_name,D_specification,D_contact,D_city,D_location,D_username,D_charges) values(?,?,?,?,?,?,?) ";
		try
		{
		PreparedStatement preStmt = conn1.prepareStatement(sql);
		
		preStmt.setString(1,obj.getD_name());
		preStmt.setString(2,obj.getD_spec());
		preStmt.setString(3,obj.getD_contact());
                preStmt.setString(4,obj.getD_city());
                preStmt.setString(5,obj.getD_location());
                preStmt.setString(6,obj.getD_username());
                preStmt.setInt(7,obj.getD_charges());
		System.out.println(preStmt.execute());
		preStmt.close();
                conn1.close();
		}
		catch(Exception e)
		{
			System.out.println("not inserted");
		}

	}
        
        public int Get_id() 
	{
            Connection conn1=getConnection();
            int num=0;
		String sql="select Max(D_id) from doctor ";
		try
		{
		PreparedStatement preStmt = conn1.prepareStatement(sql);
		ResultSet rs = preStmt.executeQuery();
                
                rs.next();
                 num=rs.getInt(1);
		preStmt.close();
                conn1.close();
		}
		catch(Exception e)
		{
			System.out.println("not inserted");
		}
                finally{
                    return num;
                }

	}
         public int Get_Session_id(String usr) 
	{
            Connection conn1=getConnection();
            int num=0;
		String sql="select D_id from doctor where D_username=? ";
		try
		{
		PreparedStatement preStmt = conn1.prepareStatement(sql);
                preStmt.setString(1,usr);
		ResultSet rs = preStmt.executeQuery();
                
                rs.next();
                 num=rs.getInt(1);
		preStmt.close();
                conn1.close();
		}
		catch(Exception e)
		{
			System.out.println("not inserted");
		}
                finally{
                    return num;
                }

	}
	public void Delete_Doctor(Doctor obj) throws SQLException {
		String sql = "DELETE FROM doctor WHERE D_id=?;";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setInt(1,obj.getD_id());
		System.out.println(preStmt.execute());
		preStmt.close();

	}
	public void Update_Doctor(Doctor obj) throws SQLException {
		String sql = "UPDATE doctor SET D_name=?,D_specification=?,D_rank=?,D_contact=? " + //
				"WHERE D_id=?";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setString(1,obj.getD_name());
		preStmt.setString(2,obj.getD_spec());
		//preStmt.setFloat(3,obj.getD_rank());
		preStmt.setString(4,obj.getD_contact());
		preStmt.setInt(5,obj.getD_id());
		
		System.out.println(preStmt.execute());
		preStmt.close();


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
	public Doctor getDoctor(int id)
        {
            Connection conn1=getConnection();
		Doctor obj=new Doctor();
		String sql = "SELECT D_specification,D_location FROM doctor WHERE D_id=? ";
		
		try 
		{
			PreparedStatement preStmt = conn1.prepareStatement(sql);
		preStmt.setInt(1,id);
		ResultSet rs = preStmt.executeQuery();
		while(rs.next())
		{
			
			obj.setD_spec(rs.getString(1));
			
			obj.setD_location(rs.getString(2));
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
		return obj;
		}
        }
	public ArrayList getList(String d,String L) 
	{
		Connection conn1=getConnection();
		ArrayList list=new ArrayList();
		String sql = "SELECT * FROM doctor WHERE D_specification=? AND D_city=?";
		
		try 
		{PreparedStatement preStmt = conn1.prepareStatement(sql);
		preStmt.setString(1,d);
		preStmt.setString(2,L);
		ResultSet rs = preStmt.executeQuery();
		while(rs.next())
		{
			Doctor obj=new Doctor();
			obj.setD_id(rs.getInt(1));
			obj.setD_name(rs.getString(2));
			obj.setD_spec(rs.getString(3));
			obj.setD_contact(rs.getString(5));
			obj.setD_city(rs.getString(6));
			obj.setD_location(rs.getString(7));
                        obj.setD_charges(rs.getInt(8));
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
                
          public Doctor get_complete_Doctor(int id)
        {
            Connection conn1=getConnection();
		Doctor obj=new Doctor();
		String sql = "SELECT * FROM doctor WHERE D_id=? ";
		
		try 
		{
			PreparedStatement preStmt = conn1.prepareStatement(sql);
		preStmt.setInt(1,id);
		ResultSet rs = preStmt.executeQuery();
		while(rs.next())
		{
			
			obj.setD_name(rs.getString(2));
                        obj.setD_spec(rs.getString(3));
                        obj.setD_contact(rs.getString(4));
                        obj.setD_city(rs.getString(5));
			
			obj.setD_location(rs.getString(6));
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
		return obj;
		}
        
	}
	
public static void main(String args[])
{
   
    DoctorDAO d=new DoctorDAO();
    Doctor obj=new Doctor();
    obj.setD_name("Ali Ahmad");
    obj.setD_spec("Brain");
    obj.setD_contact("0191716");
    obj.setD_city("Islamabad");
    obj.setD_username("Ali123");
    obj.setD_location("shaneen1234");
    d.Insert_Doctor(obj);
    
   
}
}

