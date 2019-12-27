package com.examples.xml;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.*;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;

import java.io.File;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Map.Entry;

public class XmlReading {
	static LinkedHashMap<String, LinkedList<String>> allValues = new LinkedHashMap<String, LinkedList<String>>();
public static LinkedHashMap<String, LinkedList<String>> getALLXMLData()  throws XPathExpressionException {
	//public static void main(String argv[]) throws XPathExpressionException {

		XPathFactory xpf = XPathFactory.newInstance();
		XPath xPath = xpf.newXPath();
		XPathExpression valueStreamExpression = xPath.compile("ValueStream");
		/// it will count the property numbers
		XPathExpression propertyExpression = xPath.compile("properties/property");
		// reads state expression
		XPathExpression stateExpression = xPath.compile("states/state");
		// reads items for dropdown
		XPathExpression drpdownLst = xPath.compile("properties/property/list/item");
		InputSource inputSource = new InputSource("src/main/java/com/examples/xml/FormFields.xml");
		NodeList schoolNodes = (NodeList) xPath.evaluate("/data", inputSource, XPathConstants.NODESET);

		for (int x = 0; x < schoolNodes.getLength(); x++) {
			Node schoolElement = schoolNodes.item(x);

			// LOB Name....................
			System.out.print("LOB: ");
			System.out.println(valueStreamExpression.evaluate(schoolElement, XPathConstants.STRING));

			/// iterate for property values................
			NodeList allProperties = (NodeList) propertyExpression.evaluate(schoolElement, XPathConstants.NODESET);
			System.out.println("Properties count:---------" + allProperties.getLength());
			for (int i = 0; i < allProperties.getLength(); i++) {
				LinkedList<String> allAttr = new LinkedList<String>();
				try {

					NamedNodeMap innerElmnt = allProperties.item(i).getAttributes();
					String name = null;
					for (int j = 0; j < innerElmnt.getLength(); ++j) {
						Node attr = innerElmnt.item(j);
						if (attr.getNodeName().equalsIgnoreCase("name")) {
							name = attr.getNodeValue();
						}
						allAttr.add(attr.getNodeName() + ":" + attr.getNodeValue() + ",");
						if (attr.getNodeValue().equalsIgnoreCase("dropdown")) {
							// System.out.println("dropdown values:------");
							XPathExpression drpdownLst1 = xPath
									.compile("properties/property[contains(@name,'" + name + "')]/list/item");
							NodeList alldrpVal = (NodeList) drpdownLst1.evaluate(schoolElement, XPathConstants.NODESET);
							String allDrop = "";
							for (int k = 0; k < alldrpVal.getLength(); k++) {
								// System.out.println(alldrpVal.item(k).getTextContent());
								allDrop += "+" + alldrpVal.item(k).getTextContent();
							}
							allAttr.add("Values:" + allDrop);
							// System.out.println(allDrop);
						} else if (attr.getNodeValue().equalsIgnoreCase("range")) {
							// System.out.println("range values:------");
							XPathExpression min = xPath
									.compile("properties/property[contains(@name,'" + name + "')]/range/min");
							XPathExpression max = xPath
									.compile("properties/property[contains(@name,'" + name + "')]/range/max");
							String minVal = (String) min.evaluate(schoolElement, XPathConstants.STRING);
							String maxVal = (String) max.evaluate(schoolElement, XPathConstants.STRING);
							allAttr.add("Values:" + "Min+" + minVal + ",Max+" + maxVal);
						}

					}

				} catch (Exception e) {
					continue;
				}
				allValues.put("Property" + (i + 1) , allAttr);
			}

			// iterates for states values................
			NodeList allStateValues = (NodeList) stateExpression.evaluate(schoolElement, XPathConstants.NODESET);
			System.out.println("All States count:---------------" + allStateValues.getLength());
			for (int i = 0; i < allStateValues.getLength(); i++) {

				// System.out.println("Attributes list:" + i);
				LinkedList<String> allAttr = new LinkedList<String>();
				NamedNodeMap innerElmnt = allStateValues.item(i).getAttributes();
				String name = null;
				for (int j = 0; j < innerElmnt.getLength(); ++j) {
					Node attr = innerElmnt.item(j);
					allAttr.add(attr.getNodeName() + ":" + attr.getNodeValue() + ",");
					if (attr.getNodeName().equalsIgnoreCase("name")) {
						name = attr.getNodeValue();
					}
					if (attr.getNodeValue().equalsIgnoreCase("range")) {
						// System.out.println("range values:------");
						XPathExpression min = xPath.compile("states/state[contains(@name,'" + name + "')]/range/min");
						XPathExpression max = xPath.compile("states/state[contains(@name,'" + name + "')]/range/max");
						String minVal = (String) min.evaluate(schoolElement, XPathConstants.STRING);
						String maxVal = (String) max.evaluate(schoolElement, XPathConstants.STRING);
						allAttr.add("Values:" + "Min+" + minVal + ",Max+" + maxVal);
					} else if (attr.getNodeValue().equalsIgnoreCase("dropdown")) {
						// System.out.println("dropdown values:------");
						XPathExpression drpdownLst1 = xPath
								.compile("states/state[contains(@name,'" + name + "')]/list/item");
						NodeList alldrpVal = (NodeList) drpdownLst1.evaluate(schoolElement, XPathConstants.NODESET);
						String allDrop = "";
						for (int k = 0; k < alldrpVal.getLength(); k++) {
							// System.out.println(alldrpVal.item(k).getTextContent());
							allDrop += "+" + alldrpVal.item(k).getTextContent();
						}
						allAttr.add("Values:" + allDrop);
						// System.out.println(allDrop);
					}
				}
				allValues.put("states" + (i + 1) , allAttr);
			}
		}
//		for (Entry<String, LinkedList<String>> string : allValues.entrySet()) {
//			System.out.print(string.getKey() + "---");
//			for (Iterator iterator = string.getValue().iterator(); iterator.hasNext();) {
//				String string2 = (String) iterator.next();
//				System.out.print(string2);
//
//			}
//			System.out.println();
//
//		}
return allValues;
	}
}