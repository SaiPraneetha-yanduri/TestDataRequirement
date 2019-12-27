package com.example.dbconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Map;

public class QueryFetching {

	public Map<Integer, LinkedList<String>> fetchALLTDR(Connection con) throws Exception {
		Map<Integer, LinkedList<String>> allData = new LinkedHashMap<Integer, LinkedList<String>>();
		Statement stmt = con.createStatement();
		System.out.println("select * from testdata.REQUIREMENTS");
		ResultSet rs = stmt.executeQuery("select * from testdata.REQUIREMENTS");
		int i = 1;
		while (rs.next()) {
			LinkedList<String> allUsersList = new LinkedList<String>();
			allUsersList.add(rs.getString("TEST_CONDITION"));
			allUsersList.add(rs.getString("DATA_USED"));
			allUsersList.add(rs.getString("TOTAL_DATA"));
			allUsersList.add(rs.getString("DATA_REMAINING"));
			allUsersList.add(rs.getString("SAMPLE_API"));
			allUsersList.add(fetchLOBAndTeam(con,rs.getInt("userid")).split(",")[0].toUpperCase());
			allUsersList.add(fetchLOBAndTeam(con,rs.getInt("userid")).split(",")[1].toUpperCase());
//			allUsersList.add(rs.getString("userid"));
//			allUsersList.add("card");
			allData.put(rs.getInt("TDR_ID"), allUsersList);
			i++;
		}

		return allData;
	}
	
	public Map<Integer, LinkedList<String>> fetchTDRbasedOnusername(Connection con, String username) throws Exception {
		Map<Integer, LinkedList<String>> allData = new LinkedHashMap<Integer, LinkedList<String>>();

		// SELECT * FROM testdata.REQUIREMENTS u1,testdata.user u2 where
		// u1.userid=u2.userid and u2.lob like 'card';

		Statement stmt = con.createStatement();
		System.out.println("select * from testdata.REQUIREMENTS where ");
		ResultSet rs = stmt.executeQuery(
				"SELECT * FROM testdata.REQUIREMENTS u1,testdata.user u2 where u1.userid=u2.userid and u2.username like '"
						+ username + "'");
		int i = 1;
		while (rs.next()) {
			LinkedList<String> allUsersList = new LinkedList<String>();
			allUsersList.add(rs.getString("TEST_CONDITION"));
			allUsersList.add(rs.getString("DATA_USED"));
			allUsersList.add(rs.getString("TOTAL_DATA"));
			allUsersList.add(rs.getString("DATA_REMAINING"));
			allUsersList.add(rs.getString("SAMPLE_API"));
			allUsersList.add(rs.getString("lob").toUpperCase());
			allUsersList.add(rs.getString("teamname").toUpperCase());
			allData.put(rs.getInt("TDR_ID"), allUsersList);
			i++;
		}

		return allData;
	}

	public String fetchLOBAndTeam(Connection con ,int userid) throws Exception {
		Map<Integer, LinkedList<String>> allData = new LinkedHashMap<Integer, LinkedList<String>>();

		// SELECT * FROM testdata.REQUIREMENTS u1,testdata.user u2 where
		// u1.userid=u2.userid and u2.lob like 'card';
//		DBConnection dbObj = new DBConnection();
//
//		Connection con = dbObj.connectToDB();
		Statement stmt = con.createStatement();
		// System.out.println("select * from testdata.REQUIREMENTS where ");
		ResultSet rs = stmt.executeQuery("SELECT * FROM testdata.user where userid=" + userid);
		String val = null;
		while (rs.next()) {
			// LinkedList<String> allUsersList = new LinkedList<String>();
			val = rs.getString("teamname") + "," + rs.getString("lob");

			// allData.put(rs.getInt("TDR_ID"), allUsersList);

		}

		return val;
	}
	
	public String fetchLOBAndTeam(Connection con ,String username) throws Exception {
		Map<Integer, LinkedList<String>> allData = new LinkedHashMap<Integer, LinkedList<String>>();

		// SELECT * FROM testdata.REQUIREMENTS u1,testdata.user u2 where
		// u1.userid=u2.userid and u2.lob like 'card';
//		DBConnection dbObj = new DBConnection();
//
//		Connection con = dbObj.connectToDB();
		Statement stmt = con.createStatement();
		// System.out.println("select * from testdata.REQUIREMENTS where ");
		ResultSet rs = stmt.executeQuery("SELECT * FROM testdata.user where username=" + username);
		String val = null;
		while (rs.next()) {
			// LinkedList<String> allUsersList = new LinkedList<String>();
			val = rs.getString("teamname") + "," + rs.getString("lob");

			// allData.put(rs.getInt("TDR_ID"), allUsersList);

		}

		return val;
	}

	public Map<Integer, LinkedList<String>> fetchPatternTDR(Connection con, String pattern) throws Exception {
		Map<Integer, LinkedList<String>> allData = new LinkedHashMap<Integer, LinkedList<String>>();

		// SELECT * FROM testdata.REQUIREMENTS u1,testdata.user u2 where
		// u1.userid=u2.userid and u2.lob like 'card';

		Statement stmt = con.createStatement();
		System.out.println("select * from testdata.REQUIREMENTS where ");
		ResultSet rs = stmt.executeQuery(
				"SELECT * FROM testdata.REQUIREMENTS u1,testdata.user u2 where u1.userid=u2.userid and u2.lob like '"
						+ pattern + "'");
		int i = 1;
		while (rs.next()) {
			LinkedList<String> allUsersList = new LinkedList<String>();
			allUsersList.add(rs.getString("TEST_CONDITION"));
			allUsersList.add(rs.getString("DATA_USED"));
			allUsersList.add(rs.getString("TOTAL_DATA"));
			allUsersList.add(rs.getString("DATA_REMAINING"));
			allUsersList.add(rs.getString("SAMPLE_API"));
			allData.put(rs.getInt("TDR_ID"), allUsersList);
			i++;
		}

		return allData;
	}
}
