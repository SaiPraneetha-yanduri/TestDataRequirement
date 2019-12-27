package com.example.TDR;

import java.sql.Connection;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.example.bean.FormBean;
import com.example.bean.MessageBean;
import com.example.bean.RestFormBean;
import com.example.dbconnection.DBConnection;
import com.example.dbconnection.QueryFetching;

@RestController
public class RestAPIController {
//	@Autowired
//	private FormBean form;
//	

	/** Get api for fetching data from TDR **/
	@RequestMapping(value = "/data", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Map<Integer, LinkedList<String>> searchData() throws Exception {
		DBConnection dbObj = new DBConnection();
		QueryFetching queryObj = new QueryFetching();
		Connection con = dbObj.connectToDB();
		Map<Integer, LinkedList<String>> allTDRData = queryObj.fetchALLTDR(con);
		return allTDRData;
	}

	/** 1... Post api for creating order id **/
	@RequestMapping(method = RequestMethod.POST, value = "/insertTDR", headers = { "content-type=application/json" })
	@ResponseStatus(HttpStatus.ACCEPTED)
	@ResponseBody
	public String insertTDR(@RequestBody RestFormBean restjson) throws Exception {
		try {
			System.out.println("insert tdr.........");
			DBConnection dbObj = new DBConnection();
			Connection con = dbObj.connectToDB();
			String tdrReq = restjson.getTestdata();
			int val = dbObj.postDataForReq(con, tdrReq,restjson.getUsername());
			if (val == 1) {
				return "inserted successfully";
			} else {

				return "Please try after sometime....";
			}
		} catch (Exception e) {
			return "Please try after sometime....";
		}

	}

}
