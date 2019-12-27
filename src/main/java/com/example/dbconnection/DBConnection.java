package com.example.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

public class DBConnection {

	private Connection connect = null;

	final private String host = "bookapplication.c2yfvxjghykt.us-east-2.rds.amazonaws.com ";
	final private String user = "ramkumar";
	final private String passwd = "ramkumar";
	final private String database = "testdata";

	public Connection connectToDB() {
		try {
			// This will load the MySQL driver, each DB has its own driver
			Class.forName("com.mysql.jdbc.Driver");

			// Setup the connection with the DB
			 	connect = DriverManager.getConnection("jdbc:mysql://" + host + "/"
					+ database + "?" + "user=" + user + "&password=" + passwd);
//			connect = DriverManager.getConnection(
//					"jdbc:mysql://" + host + "/" + database + "?" + "user=" + user + "&password=" + passwd + "'");
			System.out.println("Inside TRY connectToDB");
			return connect;
		} catch (Exception e) {
			System.out.println("Error in TRY connectToDB" + e);
		}
		return connect;
	}

	public int postDataForReq(Connection con, String tdrReq,String username) throws SQLException {
		int i = 0;
		Statement stmt = con.createStatement();
		System.out.println("select userid from testdata.user where username like '" + username+ "'" );
		ResultSet rs = stmt.executeQuery("select userid from testdata.user where username like '" + username+ "'" );
		while (rs.next()) {
		int userid=rs.getInt("userid");
		System.out.println("UserID:"+userid);
		PreparedStatement preparedStatement = null;

		String query = "insert into testdata.REQUIREMENTS(TEST_CONDITION,userid) values (?,?)"; 
		preparedStatement = con.prepareStatement(query);
		preparedStatement.setString(1, tdrReq);
		preparedStatement.setInt(2, userid);
		 i = preparedStatement.executeUpdate();
		System.out.println(i);
		
		}
		return i;
	}
	
	

	public int deleteFromDB(Connection con, int id) throws SQLException {
		PreparedStatement preparedStatement = null;

		String query = "delete from testdata.REQUIREMENTS where TDR_ID = " + id;

		preparedStatement = con.prepareStatement(query);

		int i = preparedStatement.executeUpdate();
		System.out.println(i);
		return i;

	}

	public int checkUser(Connection con, String username, String password) throws SQLException {
		// TODO Auto-generated method stub
		Statement stmt = con.createStatement();
		System.out.println("select * from testdata.user where username like '" + username
				+ "' and password like '" + password+"'");
		ResultSet rs = stmt.executeQuery("select * from testdata.user where username like '" + username
				+ "' and password like '" + password+"'");
		int i = 0;
		while (rs.next()) {

			i = rs.getInt("userid");

		}
		return i;
	}
	
	public int registerUserInDB(Connection con,String username,String password,String teamname,String lob) throws SQLException {

		PreparedStatement preparedStatement = null;

		String query = "insert into testdata.user(username,password,teamname,lob) values (?,?,?,?)";
		preparedStatement = con.prepareStatement(query);
		preparedStatement.setString(1, username);
		preparedStatement.setString(2, password);
		preparedStatement.setString(3, teamname);
		preparedStatement.setString(4, lob);		
		int i= preparedStatement.executeUpdate();
		System.out.println(i);
		return i;
	}
}
