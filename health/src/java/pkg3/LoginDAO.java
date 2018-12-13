package pkg3;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginDAO implements Serializable {
	/**
	 * 
	 */
	Connection conn=null;
	private static final long serialVersionUID = 1L;
	public LoginDAO()
	{
		
		
	}
	
	public void Insert_Login(String usr,String pass)
	{
            Connection conn1=getConnection();
		String sql="Insert into login(username,password) values(?,?) ";
		try
		{
		PreparedStatement preStmt = conn1.prepareStatement(sql);
		preStmt.setString(1,usr);
		preStmt.setString(2,pass);
		
		System.out.println(preStmt.execute());
		preStmt.close();
		}
		catch(Exception e)
		{
			System.out.println("not inserted");
		}

	}
	public void Delete_Login(Login obj) throws SQLException {
		String sql = "DELETE FROM login WHERE username=?;";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setString(1,obj.getUsername());
		System.out.println(preStmt.execute());
		preStmt.close();

	}
	public void Update_Login(String usr,String pass) throws SQLException {
	Connection conn1=getConnection();	
            String sql = "UPDATE login SET password=?,status=? " + //
				"WHERE username=?";
		PreparedStatement preStmt = conn1.prepareStatement(sql);
		preStmt.setString(1,pass);
		preStmt.setString(2,"doctor");
		preStmt.setString(3,usr);
		
		System.out.println(preStmt.execute());
		preStmt.close();

conn1.close();
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
	public boolean Check_Login(String u,String p) throws Exception {
		
		Connection conn1=getConnection();
		/*if(conn==null)
			return true;
		else
			return false;*/
		//return false;
		boolean flag=false;

		PreparedStatement preStmt=null; 
		String sql = "select * from login WHERE username=? AND password=?";
		 preStmt = conn1.prepareStatement(sql);
		preStmt.setString(1,u);
		preStmt.setString(2,p);
		ResultSet rs = preStmt.executeQuery();
		
		
		if(rs.next()==false)
			flag= false;
		else
			flag= true;
		conn1.close();
		preStmt.close();
		return flag;
		
	}
        public boolean Check_Username(String u) throws Exception {
		
		Connection conn1=getConnection();
		/*if(conn==null)
			return true;
		else
			return false;*/
		//return false;
		boolean flag=false;

		PreparedStatement preStmt=null; 
		String sql = "select * from login WHERE username=?";
		 preStmt = conn1.prepareStatement(sql);
		preStmt.setString(1,u);
		ResultSet rs = preStmt.executeQuery();
		
		
		if(rs.next()==false)
			flag= false;
		else
			flag= true;
		conn1.close();
		preStmt.close();
		return flag;
		
	}
	public static void main(String args[])
	{
		LoginDAO obj=new LoginDAO();
		Login o=new Login();
		o.setUsername("ahmad123");
		o.setPassword("ahmad");
		try {
			if(obj.Check_Login("bilal123","bilal"))
				System.out.println("Found");
			else
				System.out.println("not found");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}

