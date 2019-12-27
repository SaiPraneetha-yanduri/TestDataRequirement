
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><html>
<html>
<head>
<style type="text/css">
.form-style-5{
	max-width: 500px;
	padding: 10px 20px;
	background: #f4f7f8;
	margin: 10px auto;
	padding: 20px;
	background: #f4f7f8;
	border-radius: 8px;
	font-family: Georgia, "Times New Roman", Times, serif;
}
.form-style-5 fieldset{
	border: none;
}
.form-style-5 legend {
	font-size: 1.4em;
	margin-bottom: 10px;
}
.form-style-5 label {
	display: block;
	margin-bottom: 8px;
}
.form-style-5 input[type="text"],
.form-style-5 input[type="date"],
.form-style-5 input[type="datetime"],
.form-style-5 input[type="email"],
.form-style-5 input[type="number"],
.form-style-5 input[type="search"],
.form-style-5 input[type="time"],
.form-style-5 input[type="url"],
.form-style-5 input[type="numeric"],
.form-style-5 input[type="range"],
.form-style-5 textarea,
.form-style-5 select {
	font-family: Georgia, "Times New Roman", Times, serif;
	background: rgba(255,255,255,.1);
	border: none;
	border-radius: 4px;
	font-size: 15px;
	margin: 0;
	outline: 0;
	padding: 10px;
	width: 1000%;
	box-sizing: border-box; 
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box; 
	background-color: #e8eeef;
	color:#8a97a0;
	-webkit-box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
	box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
	margin-bottom: 30px;
}


 input,textarea {
	font-family: Georgia, "Times New Roman", Times, serif;
	background: rgba(255,255,255,.1);
	border: none;
	border-radius: 4px;
	font-size: 15px;
	margin: 0;
	outline: 0;
	padding: 10px;
	width: 700%;
	box-sizing: border-box; 
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box; 
	background-color: #e8eeef;
	color:#8a97a0;
	-webkit-box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
	box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
	margin-bottom: 30px;
}
.form-style-5 input[type="text"]:focus,
.form-style-5 input[type="date"]:focus,
.form-style-5 input[type="datetime"]:focus,
.form-style-5 input[type="email"]:focus,
.form-style-5 input[type="number"]:focus,
.form-style-5 input[type="search"]:focus,
.form-style-5 input[type="time"]:focus,
.form-style-5 input[type="url"]:focus,
.form-style-5 input[type="numeric"]:focus,
.form-style-5 input[type="range"]:focus,
.form-style-5 textarea:focus,
.form-style-5 select:focus{
	background: #d2d9dd;
}
.form-style-5 select{
	-webkit-appearance: menulist-button;
	height:35px;
	    width: 500%;
}
.form-style-5 .number {
	background: #1abc9c;
	color: #000000;
	height: 30px;
	width: 30px;
	display: inline-block;
	font-size: 0.8em;
	margin-right: 4px;
	line-height: 30px;
	text-align: center;
	text-shadow: 0 1px 0 rgba(255,255,255,0.2);
	border-radius: 15px 15px 15px 0px;
}

.form-style-5 input[type="submit"],
.form-style-5 input[type="button"]
{
	position: relative;
	display: block;
	padding: 19px 39px 18px 39px;
	color: #FFF;
	margin: 0 auto;
	background: #1abc9c;
	font-size: 18px;
	text-align: center;
	font-style: normal;
	width: 100%;
	border: 1px solid #16a085;
	border-width: 1px 1px 3px;
	margin-bottom: 10px;
}
.form-style-5 input[type="submit"]:hover,
.form-style-5 input[type="button"]:hover
{
	background: #109177;
}
</style>

</style>
<script type='text/javascript'>
	function addFields() {
		
		// Container <div> where dynamic content will be placed
		var container = document.getElementById("container");
		// Clear previous contents of the container
		while (container.hasChildNodes()) {
			container.removeChild(container.lastChild);
		}
		<c:forEach items="${allXmlData}" var="festival">
		
		var inputdrop2 = document.createElement("fieldset");
		var inputdrop1 = document.createElement("legend");
		
		var inputdrop = document.createElement("span");
		inputdrop.setAttribute("class","number");
		
				var typeVal,drpValues,groupValue;
							<c:forEach items="${festival.value}" var="values">
															var val = "${values}".split(":")[0];
															var val1 = "${values}".split(":")[1];
															console.log("Values0----" + val + "----Values1----" + val1);
															if (val === 'name') {
																	// Append a node with a random text
																	inputdrop.appendChild(document.createTextNode(val1.replace(",",":")));
																	document.body.appendChild(inputdrop);

															}
															if(val == "type"){
																typeVal = val1;
															}
															if(val == "Values"){
																drpValues = val1;
															}
															if(val == "groupname"){
																groupValue = val1;
															}
							</c:forEach>
							console.log("Group value:"+groupValue.replace(","," "))
			if(typeVal === 'text,' ||  typeVal === 'numeric,' || typeVal === 'range,'){				
				// Create an <input> element, set its type and name attributes
				var input = document.createElement("input");
				//input.name = val1;
				/////
				input.type = typeVal;
				input.name = "${festival.key}";
				input.id = "${festival.key}";
				inputdrop.appendChild(input);
				inputdrop1.appendChild(inputdrop);
				inputdrop2.appendChild(inputdrop1);
				document.body.appendChild(inputdrop2);
				//container.appendChild(input);
				//container.appendChild(document.createElement("br"));
				
		
			}
			else if(typeVal === 'dropdown,'){
				var temp = new Array();
				temp = drpValues.split("+");
				console.log("dropVal is:"+temp);
				console.log("dropVal is:"+temp[2]);
				temp.shift();
				var array = temp;
				var input = document.createElement("select");
				input.name = "${festival.key}";
				input.id = "${festival.key}";
				for (var i = 0; i < array.length; i++) {
					var option = document.createElement("option");
					option.value = array[i];
					option.text = array[i];
					input.appendChild(option)
					// Append a line break 
					
				}
				inputdrop.appendChild(input);
				inputdrop1.appendChild(inputdrop);
				inputdrop2.appendChild(inputdrop1);
				document.body.appendChild(inputdrop2);
				//container.appendChild(input);
			}
			else if(typeVal === 'textarea,'){
				// Create an <input> element, set its type and name attributes
				var input = document.createElement("textarea");
				input.rows = 4;
				input.cols = 50;
				input.type = typeVal;
				input.name = "${festival.key}";
				input.id = "${festival.key}";
				inputdrop.appendChild(input);
				inputdrop1.appendChild(inputdrop);
				inputdrop2.appendChild(inputdrop1);
				document.body.appendChild(inputdrop2);
			}
			container.appendChild(inputdrop2);
			
			container.appendChild(document.createElement("br"));
		</c:forEach>

		var inputSubmit= document.createElement("input");
		inputSubmit.type = "submit";
		inputSubmit.value = "submit";
		container.appendChild(inputSubmit);
		container.appendChild(document.createElement("br"));
		
	}
</script>
</head>
<body onload="addFields();" style="background-color: #0100ff42;">

	<div class="form-style-5">
		<form id="myForm" method="post" action="postDynamicData" style="margin:10%;opacity = 0.5;">
 			 <fieldset id="myFieldset">
 			 <legend>
											<b style="margin-left:45%;">Card Area</b>
										</legend>
 			 
 			 <div class="form-style-5" id="container" />
 			 <input type="submit" value="Submit" />
 			 </fieldset>
  
       </form>
    </div>
</body>
</html>
