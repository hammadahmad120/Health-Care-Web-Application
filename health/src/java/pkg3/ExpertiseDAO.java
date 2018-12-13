package pkg3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.io.*;
import static pkg3.TimingsDAO.conn;

public class ExpertiseDAO implements Serializable {
	static Connection conn=null;
	public ExpertiseDAO()
	{
		//conn= Generate_SQLConnection.ReturnConnection();
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
	
	public void Insert_Expertise(int id,String dis,String exp)
	{
            Connection conn1=getConnection();
		String sql="Insert into expertise values(?,?,?) ";
		try
		{
		PreparedStatement preStmt = conn1.prepareStatement(sql);
		preStmt.setInt(1,id);
		preStmt.setString(2,dis);
		preStmt.setString(3,exp);
		System.out.println(preStmt.execute());
		preStmt.close();
                conn1.close();
		}
		catch(Exception e)
		{
			System.out.println("not inserted");
		}

	}
	public void Delete_Expertise(Expertise obj) throws SQLException {
		String sql = "DELETE FROM expertise WHERE D_id=?;";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setInt(1,obj.getD_id());
		System.out.println(preStmt.execute());
		preStmt.close();

	}
	public void Update_Expertise(Expertise obj) throws SQLException {
		String sql = "UPDATE expertise SET disease=?,comments=? " + //
				"WHERE D_id=?";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setString(1,obj.getDisease_name());
		preStmt.setString(2,obj.getComments());
		preStmt.setInt(3,obj.getD_id());
		
		System.out.println(preStmt.execute());
		preStmt.close();


	}
        public ArrayList Get_Expertise(String rel)
	{
            Connection conn1=getConnection();
            ArrayList list=new ArrayList();
		String sql="select * from expertise where disease=? ";
               
		try
		{
		PreparedStatement preStmt = conn1.prepareStatement(sql);
		preStmt.setString(1,rel);
		
		ResultSet rs = preStmt.executeQuery();
		while(rs.next())
		{
			 Expertise obj=new Expertise();
			obj.setD_id(rs.getInt(1));
			
			obj.setDisease_name(rs.getString(2));
                        obj.setComments(rs.getString(3));
                        list.add(obj);
		}
		preStmt.close();
                conn1.close();
		}
		catch(Exception e)
		{
			System.out.println("not inserted");
		}
                return list;

	}

}
