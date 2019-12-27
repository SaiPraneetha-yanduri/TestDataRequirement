package com.example.TDR;

import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.example.bean.DataBeanPojo;
import com.example.bean.FormBean;
import com.example.dbconnection.DBConnection;
import com.example.dbconnection.QueryFetching;
import com.examples.xml.XmlReading;

import com.example.bean.LoginBean;
import com.example.bean.RegisterBean;

@Controller
public class HomeController {

	DBConnection dbObj = new DBConnection();
	QueryFetching queryObj = new QueryFetching();
	LinkedHashMap<String, LinkedList<String>> allValues;
	String deleteString = "false";
	String username;
	// = xml.getALLXMLData();

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String table(Locale locale, Model model) throws Exception {
		System.out.println("Table Requested, locale = " + locale);
		System.out.println("TB values, locale = " + locale);
		Connection con = dbObj.connectToDB();
		Map<Integer, LinkedList<String>> allTDRData = queryObj.fetchALLTDR(con);
		int i = 1;
		for (Entry tdr : allTDRData.entrySet()) {
			System.out.println(i + "--" + tdr.getValue());
			i++;
		}

		model.addAttribute("allTDRData", allTDRData);
		return "table";
	}

//	@ModelAttribute
//	public void addAttributes(Model model) throws Exception {
//		System.out.println("Table Requested, locale = ");
//		System.out.println("TB values, locale = ");
//		Connection con = dbObj.connectToDB();
//		Map<Integer, LinkedList<String>> allTDRData = queryObj.fetchALLTDR(con);
//		int i = 1;
//		for (Entry tdr : allTDRData.entrySet()) {
//			System.out.println(i + "--" + tdr.getValue());
//			i++;
//		}
//
//		model.addAttribute("allTDRData", allTDRData);
//
//	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) throws Exception {
		return "login";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Locale locale, Model model) throws Exception {
		return "register";
	}

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String dbval(Locale locale, Model model) throws Exception {
		return "Form";
	}

	@RequestMapping(value = "/index", method = RequestMethod.POST)
	public String indexPage(@Validated LoginBean user, Model model) throws Exception {
		model.addAttribute("userName", user.getUsername());
		model.addAttribute("uPassword", user.getPassword());
		System.out.println(user.getUsername());
		System.out.println(user.getPassword());
		username = user.getUsername();
		Connection con = dbObj.connectToDB();
		int i = dbObj.checkUser(con, user.getUsername(), user.getPassword());
		if (!(i == 0)) {
			System.out.println("Table Requested, locale = ");
			System.out.println("TB values, locale = ");
			// Connection con = dbObj.connectToDB();
			Map<Integer, LinkedList<String>> allTDRData = queryObj.fetchTDRbasedOnusername(con, user.getUsername());
			int j = 1;
			for (Entry tdr : allTDRData.entrySet()) {
				System.out.println(j + "--" + tdr.getValue());
				j++;
			}
			model.addAttribute("allTDRData", allTDRData);
			return "index";
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Model model) throws Exception {
		Connection con = dbObj.connectToDB();
		Map<Integer, LinkedList<String>> allTDRData = queryObj.fetchTDRbasedOnusername(con, username);
		int j = 1;
		for (Entry tdr : allTDRData.entrySet()) {
			System.out.println(j + "--" + tdr.getValue());
			j++;
		}
		model.addAttribute("userName", username);
		model.addAttribute("allTDRData", allTDRData);
		return "index";

	}

	@RequestMapping(value = "/indexv1", method = RequestMethod.GET)
	public String indexPage(Model model) throws Exception {
		if (deleteString.equalsIgnoreCase("true")) {
			Connection con = dbObj.connectToDB();
			Map<Integer, LinkedList<String>> allTDRData = queryObj.fetchTDRbasedOnusername(con, username);
			int j = 1;
			for (Entry tdr : allTDRData.entrySet()) {
				System.out.println(j + "--" + tdr.getValue());
				j++;
			}
			model.addAttribute("userName", username);
			model.addAttribute("allTDRData", allTDRData);
			return "index";
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String input(Locale locale, Model model) throws Exception {
		XmlReading xml = new XmlReading();
		allValues = xml.getALLXMLData();
		for (Entry<String, LinkedList<String>> string : allValues.entrySet()) {
			System.out.print(string.getKey() + "---");
			for (Iterator iterator = string.getValue().iterator(); iterator.hasNext();) {
				String string2 = (String) iterator.next();
				System.out.print(string2);
//				if(string2.split(":")[0].equalsIgnoreCase("type")) {
//					System.out.println("Type:"+string2.split(":")[1].split(",")[0]);
//					System.out.println("Values:"+string2.split(":")[1].split(",")[1]);
//				}

			}

		}
		model.addAttribute("allXmlData", allValues);

		return "inputValues";
	}

	@RequestMapping(value = "/inputv1", method = RequestMethod.GET)
	public String inputv1(Locale locale, Model model) throws Exception {
		XmlReading xml = new XmlReading();
		allValues = xml.getALLXMLData();
		for (Entry<String, LinkedList<String>> string : allValues.entrySet()) {
			System.out.print(string.getKey() + "---");
			for (Iterator iterator = string.getValue().iterator(); iterator.hasNext();) {
				String string2 = (String) iterator.next();
				System.out.print(string2);
//				if(string2.split(":")[0].equalsIgnoreCase("type")) {
//					System.out.println("Type:"+string2.split(":")[1].split(",")[0]);
//					System.out.println("Values:"+string2.split(":")[1].split(",")[1]);
//				}

			}
			System.out.println();

		}
		model.addAttribute("userName", username);
		model.addAttribute("allXmlData", allValues);

		return "table-layout";
	}

	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public String registerUser(@Validated RegisterBean data, Model model) throws Exception {
		String username = data.getUsername();
		String teamname = data.getTeamname();
		String lob = data.getLobname();
		String password = data.getPassword();
		System.out.println(data.getUsername());
		System.out.println(data.getTeamname());
		System.out.println(data.getLobname());
		System.out.println(data.getPassword());
		System.out.println(data.getConfirmpassword());

		if (data.getPassword().equals(data.getConfirmpassword())) {
			Connection con = dbObj.connectToDB();
			int i = dbObj.registerUserInDB(con, username, password, teamname, lob);
			if (i == 1) {
				return "login";
			} else {
				return "register";
			}

		}

		else {
			return "register";
		}

	}

	@RequestMapping(value = "/postDynamicData", method = RequestMethod.POST)
	public String postDynamicData(@Validated FormBean data, Model model) throws Exception {
		try {
			String key = data.getClass().getName();
			System.out.println("Username in post dynamic data" + username);
			Map<String, String> description = new HashMap<String, String>();
			Map<String, String> finalVal = new HashMap<String, String>();
			HashMap<String, String> map3 = new HashMap<String, String>();
			PropertyDescriptor[] props = Introspector.getBeanInfo(data.getClass()).getPropertyDescriptors();
			for (int i = 0; i < props.length; i++) {
				String name = props[i].getName();
				if (name.equals("class")) {
					continue;
				}
				Method reader = props[i].getReadMethod();
				// System.out.println(reader);
				if (reader != null) {
					Object value = reader.invoke(data, null);
					if (value == null || value.equals("com.example.bean.FormBean")) {
						continue;
					}
					description.put(name, String.valueOf(value));

				}
			}
			System.out.println("printing the bean values");
			for (Entry val : description.entrySet()) {
				System.out.println("Key" + val.getKey() + "Value" + val.getValue());
			}
			System.out.println("printing the xml values");
			for (Entry<String, LinkedList<String>> string : allValues.entrySet()) {
				System.out.print(string.getKey() + "---");
				for (Iterator iterator = string.getValue().iterator(); iterator.hasNext();) {
					String string2 = (String) iterator.next();
					String nameVal = string2.split(":")[0];
					if (nameVal.equalsIgnoreCase("name")) {
						String idVal = string2.split(":")[1].replace(",", " ");
						System.out.print(idVal);
						finalVal.put(string.getKey().toUpperCase(), idVal);
					}
					// System.out.print(string2);
				}
			}
			map3.putAll(finalVal);
			map3.putAll(description);
			String finalData = "";
			for (Entry<String, String> str1 : finalVal.entrySet()) {
				for (Entry<String, String> str2 : description.entrySet()) {
					if (str1.getKey().equalsIgnoreCase(str2.getKey())) {
						// Object value = map.get(key);
						finalData += str1.getValue().trim() + ":" + str2.getValue() + ",";
						// System.out.println(str1.getKey()+"+"+str1.getValue() + ":" +
						// str2.getValue());
					}
				}
			}
			System.out.println(finalData.substring(0, finalData.length() - 1));
			Connection con = dbObj.connectToDB();
			int i = dbObj.postDataForReq(con, finalData.substring(0, finalData.length() - 1), username);
			System.out.println(i);
			if (i > 0) {
				System.out.println("Inserted successfully");
				model.addAttribute("msg", "Requirement added successfully");
			} else {
				System.out.println("Inserted unsuccessfully");
				model.addAttribute("msg", "Requirement already present");
			}
			Connection con1 = dbObj.connectToDB();

			Map<Integer, LinkedList<String>> allTDRData = queryObj.fetchTDRbasedOnusername(con1, username);
			// Map<Integer, LinkedList<String>> allTDRData = queryObj.fetchALLTDR(con1);
			for (Entry tdr : allTDRData.entrySet()) {
				System.out.println(tdr.getKey() + "--" + tdr.getValue());
			}
			con1.close();
			model.addAttribute("allTDRData", allTDRData);
			model.addAttribute("userName", username);
			return "index";
		} catch (Exception e) {
			model.addAttribute("msg", "Requirement Already Exists");
			Connection con1 = dbObj.connectToDB();

			Map<Integer, LinkedList<String>> allTDRData = queryObj.fetchTDRbasedOnusername(con1, username);
			// Map<Integer, LinkedList<String>> allTDRData = queryObj.fetchALLTDR(con1);
			for (Entry tdr : allTDRData.entrySet()) {
				System.out.println(tdr.getKey() + "--" + tdr.getValue());
			}
			con1.close();
			model.addAttribute("allTDRData", allTDRData);
			model.addAttribute("userName", username);
			// return "table";
			return "index";
		}
	}

	@RequestMapping(value = "/pattern/{PID}", method = RequestMethod.GET)
	public String pattern(@PathVariable("PID") String id, Locale locale, Model model) throws Exception {
		System.out.println("Table Requested, locale = " + locale);
		System.out.println("TB values, locale = " + locale);
		RedirectView redirectView = new RedirectView("/index", true);
		Connection con = dbObj.connectToDB();
		Map<Integer, LinkedList<String>> allTDRData = queryObj.fetchPatternTDR(con, id);
		int i = 1;
		for (Entry tdr : allTDRData.entrySet()) {
			System.out.println(i + "--" + tdr.getValue());
			i++;
		}
		deleteString = "true";
		model.addAttribute("allTDRData", allTDRData);
		return "index";
	}

	@RequestMapping("/delete/{trID}")
	public RedirectView delete(@PathVariable("trID") String id, Model model, RedirectAttributes redir)
			throws NumberFormatException, SQLException {
		System.out.println(id);
		RedirectView redirectView = new RedirectView("/indexv1", true);
		Connection con = dbObj.connectToDB();
		int i = dbObj.deleteFromDB(con, Integer.valueOf(id));

		if (i == 1) {
			model.addAttribute("msg", "Deleted Successfully");
			deleteString = "true";
		} else {
			model.addAttribute("msg", "Please try after some time...........");
			deleteString = "true";
		}
		return redirectView;
		// return "index";
	}

	@RequestMapping(value = "/postData", method = RequestMethod.POST)
	public String postData(@Validated DataBeanPojo data, Model model) throws Exception {
		String tdrReq = "External:" + data.getExtID() + ",Internal:" + data.getIntID() + ",CardType:"
				+ data.getCardTypeID() + ",RewardBalance:" + data.getMinID() + "-" + data.getMaxID();
		System.out.println("External:" + data.getExtID() + ",Internal:" + data.getIntID() + ",CardType:"
				+ data.getCardTypeID() + ",RewardBalance:" + data.getMinID() + "-" + data.getMaxID());
		Connection con = dbObj.connectToDB();
		int i = dbObj.postDataForReq(con, tdrReq, username);
		System.out.println(i);
		if (i > 0) {
			System.out.println("Inserted successfully");
			model.addAttribute("msg", "Requirement added successfully");
		} else {
			System.out.println("Inserted unsuccessfully");
			model.addAttribute("msg", "Requirement already present");
		}
		Connection con1 = dbObj.connectToDB();
		Map<Integer, LinkedList<String>> allTDRData = queryObj.fetchALLTDR(con1);
		for (Entry tdr : allTDRData.entrySet()) {
			System.out.println(tdr.getKey() + "--" + tdr.getValue());
		}
		con1.close();
		model.addAttribute("allTDRData", allTDRData);
		return "table";
	}

}
