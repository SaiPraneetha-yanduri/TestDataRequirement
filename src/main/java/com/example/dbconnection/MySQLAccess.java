package com.example.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;

public class MySQLAccess {
	public static int i = 0;
	final private static String host = "bookapplication.c2yfvxjghykt.us-east-2.rds.amazonaws.com ";
	final private static String user = "ramkumar";
	final private static String passwd = "ramkumar";
	final private static String database = "testdata";
	public static void main(String args[]) {
//	public void readStudents() {
		try {
			i++;
			Class.forName("com.mysql.jdbc.Driver");
			Connection 	con = DriverManager.getConnection("jdbc:mysql://" + host + "/"
					+ database + "?" + "user=" + user + "&password=" + passwd);
			// here Ramkumar is database name, root is username and password
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from testdata.REQUIREMENTS");
			while (rs.next())
				System.out.println(rs.getInt(1) + " --- " + rs.getString("TEST_CONDITION") + "----" + rs.getString(2));
			con.close();

		} catch (Exception e) {
			System.out.println("EXCEPTION IN MYSQLACCESS CLASS" + e);
		}
	}
}
