package pkg3;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.io.*;

public class TimingsDAO implements Serializable {
	static Connection conn=null;
	public TimingsDAO()
	{
	}
	
	public void Insert_Timings(int id,String tim,String day)
	{
            Connection conn1=getConnection();
		String sql="Insert into timing(D_id,time,day) values(?,?,?) ";
                
		try
		{
		PreparedStatement preStmt = conn1.prepareStatement(sql);
		preStmt.setInt(1,id);
		preStmt.setString(2,tim);
		preStmt.setString(3,day);
		System.out.println(preStmt.execute());
		preStmt.close();
                conn1.close();
		}
		catch(Exception e)
		{
			System.out.println("not inserted");
		}

	}
	public void Delete_Timings(int id) throws SQLException {
	Connection conn1=getConnection();	
            String sql = "DELETE FROM timing WHERE D_id=?;";
		PreparedStatement preStmt = conn1.prepareStatement(sql);
		preStmt.setInt(1,id);
		
		System.out.println(preStmt.execute());
		preStmt.close();
                conn1.close();

	}
	public void Update_Timings(Timings obj) throws SQLException {
		String sql = "UPDATE timing SET time=?,day=?,duration=?,patient_limit=? " + //
				"WHERE D_id=?";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setString(1,obj.getTime());
		preStmt.setString(2,obj.getDay());
		preStmt.setInt(3,obj.getDuration());
		preStmt.setInt(4,obj.getPatient_limit());
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
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		 return conn;
	}
	
	public ArrayList getList(int id) 
	{
		Connection conn1=getConnection();
		ArrayList list=new ArrayList();
		String sql = "SELECT time,day FROM timing WHERE D_id=? ";
		
		try 
		{
			PreparedStatement preStmt = conn1.prepareStatement(sql);
		preStmt.setInt(1,id);
		ResultSet rs = preStmt.executeQuery();
		while(rs.next())
		{
			Timings obj=new Timings();
			if(rs.getString(1).equals("0"))
				obj.setTime("-");
			else
			obj.setTime(rs.getString(1));
			
			obj.setDay(rs.getString(2));
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
        
        
        public String getDays(int id) 
	{
		Connection conn1=getConnection();
		String rslt="";
		String sql = "SELECT time,day FROM timing WHERE D_id=? ";
		
		try 
		{
			PreparedStatement preStmt = conn1.prepareStatement(sql);
		preStmt.setInt(1,id);
		ResultSet rs = preStmt.executeQuery();
		while(rs.next())
		{
			Timings obj=new Timings();
			if(rs.getString(1).equals("0"))
                        {
                            rslt=rslt+rs.getString(2);
                            rslt=rslt+",";
                        }
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
		return rslt;
		}
	}

	
	/*public static void main(String args[])
{
    ArrayList l=new ArrayList();
    TimingsDAO d=new TimingsDAO();
    
    l=d.getList(1);
    System.out.println("Result is :"+l.size());
}*/

}
