<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>TDR-Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/png"
	href="assets/images/icon/favicon.ico">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/metisMenu.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/slicknav.min.css">
<!-- amchart css -->
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<!-- others css -->
<link rel="stylesheet" href="assets/css/typography.css">
<link rel="stylesheet" href="assets/css/default-css.css">
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<!-- modernizr css -->
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
<style type="text/css">
.form-style-5 {
	max-width: 100%;
	padding: 10px 20px;
	padding: 20px;
	
	background: rgba(0,0,0,.075);
	border-radius: 8px;
	font-family: Georgia, "Times New Roman", Times, serif;
}

.form-style-5 fieldset {
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

.form-style-5 input[type="text"], .form-style-5 input[type="date"],
	.form-style-5 input[type="datetime"], .form-style-5 input[type="email"],
	.form-style-5 input[type="number"], .form-style-5 input[type="search"],
	.form-style-5 input[type="time"], .form-style-5 input[type="url"],
	.form-style-5 input[type="numeric"], .form-style-5 input[type="range"],
	.form-style-5 textarea, .form-style-5 select {
	font-family: Georgia, "Times New Roman", Times, serif;
	background: rgba(255, 255, 255, .1);
	border: none;
	border-radius: 4px;
	font-size: 15px;
	margin: 0;
	outline: 0;
	padding: 10px;
	width: 313%;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	background-color: #e8eeef;
	color: #8a97a0;
	-webkit-box-shadow: 0 1px 0 rgba(0, 0, 0, 0.03) inset;
	box-shadow: 0 1px 0 rgba(0, 0, 0, 0.03) inset;
	margin-bottom: 30px;
}

input, textarea {
	font-family: Georgia, "Times New Roman", Times, serif;
	background: rgba(255, 255, 255, .1);
	border: none;
	border-radius: 4px;
	font-size: 15px;
	margin: 0;
	outline: 0;
	padding: 10px;
	width: 313%;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	background-color: #e8eeef;
	color: #8a97a0;
	-webkit-box-shadow: 0 1px 0 rgba(0, 0, 0, 0.03) inset;
	box-shadow: 0 1px 0 rgba(0, 0, 0, 0.03) inset;
	margin-bottom: 30px;
}

.form-style-5 input[type="text"]:focus, .form-style-5 input[type="date"]:focus,
	.form-style-5 input[type="datetime"]:focus, .form-style-5 input[type="email"]:focus,
	.form-style-5 input[type="number"]:focus, .form-style-5 input[type="search"]:focus,
	.form-style-5 input[type="time"]:focus, .form-style-5 input[type="url"]:focus,
	.form-style-5 input[type="numeric"]:focus, .form-style-5 input[type="range"]:focus,
	.form-style-5 textarea:focus, .form-style-5 select:focus {
	background: #d2d9dd;
}

.form-style-5 select {
	-webkit-appearance: menulist-button;
	height: 50px;
	width: 313%;
}

.form-style-5 .number {
	background: #6a6b6d;
	color: white;
	height: 30px;
	width: 160px;
	display: inline-block;
	font-size: 0.8em;
	margin-right: 4px;
	line-height: 30px;
	text-align: center;
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.2);
	border-radius: 15px 15px 15px 0px;
}

.form-style-5 input[type="submit"], .form-style-5 input[type="button"] {
	position: relative;
	display: block;
	padding: 19px 39px 18px 39px;
	color: #FFF;
	margin: 0 auto;
	background: #6a6b6d;
	font-size: 18px;
	text-align: center;
	font-style: normal;
	width: 160px;
	border: 1px solid #2c2d2d;
	border-width: 1px 1px 3px;
	margin-bottom: 10px;
}

.form-style-5 input[type="submit"]:hover, .form-style-5 input[type="button"]:hover
	{
	background: #6a6b6d;
}

.textVal {
	margin-left: 10%;
}
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
		inputdrop2.setAttribute("class", "textVal");
		var inputdrop1 = document.createElement("legend");

		var inputdrop = document.createElement("span");
		inputdrop.setAttribute("class", "number");

		var typeVal, drpValues, groupValue;
		<c:forEach items="${festival.value}" var="values">
		var val = "${values}".split(":")[0];
		var val1 = "${values}".split(":")[1];
		console.log("Values0----" + val + "----Values1----" + val1);
		if (val === 'name') {
			// Append a node with a random text
			inputdrop.appendChild(document.createTextNode(val1
					.replace(",", ":")));
			document.body.appendChild(inputdrop);

		}
		if (val == "type") {
			typeVal = val1;
		}
		if (val == "Values") {
			drpValues = val1;
		}
		if (val == "groupname") {
			groupValue = val1;
		}
		</c:forEach>
		console.log("Group value:" + groupValue.replace(",", " "))
		if (typeVal === 'text,' || typeVal === 'numeric,'
				|| typeVal === 'range,') {
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

		} else if (typeVal === 'dropdown,') {
			var temp = new Array();
			temp = drpValues.split("+");
			console.log("dropVal is:" + temp);
			console.log("dropVal is:" + temp[2]);
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
		} else if (typeVal === 'textarea,') {
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

		var inputSubmit = document.createElement("input");
		inputSubmit.type = "submit";
		inputSubmit.value = "submit";
		container.appendChild(inputSubmit);
		container.appendChild(document.createElement("br"));

	}
</script>
</head>

<body onload="addFields();">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- preloader area start -->
	<div id="preloader">
		<div class="loader"></div>
	</div>
	<!-- preloader area end -->
	<!-- page container area start -->
	<div class="page-container">
		<!-- sidebar menu area start -->
		<div class="sidebar-menu">
			<div class="sidebar-header">
				<div class="logo">
					<ul>
						<li class="active"><a href="javascript:void(0)"
							aria-expanded="true"><h1>TDR</h1></a>
					</ul>
				</div>
			</div>
			<div class="main-menu">
				<div class="menu-inner">
					<nav>
						<ul class="metismenu" id="menu">
							<!-- <li class="active"><a href="javascript:void(0)"
								aria-expanded="true"><i class="ti-dashboard"></i><span>dashboard</span></a>
								<ul class="collapse">
									<li class="active"><a href="index.html">Card Team</a></li>
									<li><a href="index2.html">Bank team</a></li>
									<li><a href="index3.html">ALL Teams</a></li>
								</ul></li>
 -->


							<li><a href="javascript:void(0)" aria-expanded="true"><i
									class="fa fa-table"></i> <span>Requirements</span></a>
								<ul class="collapse">

									<li><a href="input">Create Requirement</a></li>

								</ul></li>




						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- sidebar menu area end -->
		<!-- main content area start -->
		<div class="main-content">
			<!-- header area start -->
			<div class="header-area">
				<div class="row align-items-center">
					<!-- nav and search button -->
					<div class="col-md-6 col-sm-8 clearfix">
						<div class="nav-btn pull-left">
							<span></span> <span></span> <span></span>
						</div>
						<div class="col-sm-24">
							<div class="breadcrumbs-area clearfix">
								<h2 class="page-title pull-left">
									<B>Test Data Requirement Dashboard </B>
								</h2>

							</div>
						</div>
					</div>
					<!-- profile info & task notification -->
					<div class="col-md-6 col-sm-4 clearfix">
						<ul class="notification-area pull-right">



							<div class="user-profile pull-right"
								style="background: -webkit-linear-gradient(left, #414042 0%, #39383a 100%); background: linear-gradient(to right, #5a585d 0%, #5a595d 100%);">
								<img class="avatar user-thumb"
									src="assets/images/author/avatar.png" alt="avatar">
								<h4 class="user-name dropdown-toggle" data-toggle="dropdown">
									${userName}<i class="fa fa-angle-down"></i>
								</h4>
								<div class="dropdown-menu"
									style="position: absolute; width: 101%; margin-right: -10%; transform: translate3d(85px, 45px, 0px); top: 0px; left: 0px; will-change: transform; background: -webkit-linear-gradient(left, #414042 0%, #39383a 100%); background: linear-gradient(to right, #5a585d 0%, #5a595d 100%);">
									<!-- <a class="dropdown-item" href="#">Message</a> <a
										class="dropdown-item" href="#">Settings</a> -->
									<a class="dropdown-item" style="color: white;" href="login">Log
										Out</a>
								</div>
								<a href="view"><li><i class="fa fa-home"></i></li></a>
								<li id="full-view"><i class="ti-fullscreen"></i></li>
								<li id="full-view-exit"><i class="ti-zoom-out"></i></li>
							</div>


						</ul>
					</div>
				</div>
			</div>
			<!-- header area end -->
			<!-- page title area start -->

			<div>


				<div class="col-12 mt-5">
					<div class="card">
						<div class="card-body">

							<div class="form-style-5">
								<form id="myForm" method="post" action="postDynamicData"
									style="margin: 20%; margin-top: 2%;opacity = 0.5;">
									<fieldset id="myFieldset">
										<span style="margin-left: 0%;width:725px;height:57%;margin-top:-2%;font-size: 1.8em;border-radius:10%;" class="number"><b>Card
												Area</b></span>

										<div class="form-style-5" id="container" />
										<input type="submit" value="Submit" />
									</fieldset>

								</form>
							</div>
						</div>
					</div>
				</div>

			</div>

			<!-- footer area start-->
			<footer>
				<div class="footer-area">
					<p>
						© Copyright 2019. All right reserved. <a
							href="#">Test Data Requirement</a>.
					</p>
				</div>
			</footer>
			<!-- footer area end-->
		</div>
		<!-- page container area end -->
		<!-- offset area start -->
		<div class="offset-area">
			<div class="offset-close">
				<i class="ti-close"></i>
			</div>
			<ul class="nav offset-menu-tab">
				<li><a class="active" data-toggle="tab" href="#activity">Activity</a></li>
				<li><a data-toggle="tab" href="#settings">Settings</a></li>
			</ul>
			<div class="offset-content tab-content">
				<div id="activity" class="tab-pane fade in show active">
					<div class="recent-activity">
						<div class="timeline-task">
							<div class="icon bg1">
								<i class="fa fa-envelope"></i>
							</div>
							<div class="tm-title">
								<h4>Rashed sent you an email</h4>
								<span class="time"><i class="ti-time"></i>09:35</span>
							</div>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
								Esse distinctio itaque at.</p>
						</div>
						<div class="timeline-task">
							<div class="icon bg2">
								<i class="fa fa-check"></i>
							</div>
							<div class="tm-title">
								<h4>Added</h4>
								<span class="time"><i class="ti-time"></i>7 Minutes Ago</span>
							</div>
							<p>Lorem ipsum dolor sit amet consectetur.</p>
						</div>
						<div class="timeline-task">
							<div class="icon bg2">
								<i class="fa fa-exclamation-triangle"></i>
							</div>
							<div class="tm-title">
								<h4>You missed you Password!</h4>
								<span class="time"><i class="ti-time"></i>09:20 Am</span>
							</div>
						</div>
						<div class="timeline-task">
							<div class="icon bg3">
								<i class="fa fa-bomb"></i>
							</div>
							<div class="tm-title">
								<h4>Member waiting for you Attention</h4>
								<span class="time"><i class="ti-time"></i>09:35</span>
							</div>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
								Esse distinctio itaque at.</p>
						</div>
						<div class="timeline-task">
							<div class="icon bg3">
								<i class="ti-signal"></i>
							</div>
							<div class="tm-title">
								<h4>You Added Kaji Patha few minutes ago</h4>
								<span class="time"><i class="ti-time"></i>01 minutes ago</span>
							</div>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
								Esse distinctio itaque at.</p>
						</div>
						<div class="timeline-task">
							<div class="icon bg1">
								<i class="fa fa-envelope"></i>
							</div>
							<div class="tm-title">
								<h4>Ratul Hamba sent you an email</h4>
								<span class="time"><i class="ti-time"></i>09:35</span>
							</div>
							<p>Hello sir , where are you, i am egerly waiting for you.</p>
						</div>
						<div class="timeline-task">
							<div class="icon bg2">
								<i class="fa fa-exclamation-triangle"></i>
							</div>
							<div class="tm-title">
								<h4>Rashed sent you an email</h4>
								<span class="time"><i class="ti-time"></i>09:35</span>
							</div>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
								Esse distinctio itaque at.</p>
						</div>
						<div class="timeline-task">
							<div class="icon bg2">
								<i class="fa fa-exclamation-triangle"></i>
							</div>
							<div class="tm-title">
								<h4>Rashed sent you an email</h4>
								<span class="time"><i class="ti-time"></i>09:35</span>
							</div>
						</div>
						<div class="timeline-task">
							<div class="icon bg3">
								<i class="fa fa-bomb"></i>
							</div>
							<div class="tm-title">
								<h4>Rashed sent you an email</h4>
								<span class="time"><i class="ti-time"></i>09:35</span>
							</div>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
								Esse distinctio itaque at.</p>
						</div>
						<div class="timeline-task">
							<div class="icon bg3">
								<i class="ti-signal"></i>
							</div>
							<div class="tm-title">
								<h4>Rashed sent you an email</h4>
								<span class="time"><i class="ti-time"></i>09:35</span>
							</div>
							<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
								Esse distinctio itaque at.</p>
						</div>
					</div>
				</div>
				<div id="settings" class="tab-pane fade">
					<div class="offset-settings">
						<h4>General Settings</h4>
						<div class="settings-list">
							<div class="s-settings">
								<div class="s-sw-title">
									<h5>Notifications</h5>
									<div class="s-swtich">
										<input type="checkbox" id="switch1" /> <label for="switch1">Toggle</label>
									</div>
								</div>
								<p>Keep it 'On' When you want to get all the notification.</p>
							</div>
							<div class="s-settings">
								<div class="s-sw-title">
									<h5>Show recent activity</h5>
									<div class="s-swtich">
										<input type="checkbox" id="switch2" /> <label for="switch2">Toggle</label>
									</div>
								</div>
								<p>The for attribute is necessary to bind our custom
									checkbox with the input.</p>
							</div>
							<div class="s-settings">
								<div class="s-sw-title">
									<h5>Show your emails</h5>
									<div class="s-swtich">
										<input type="checkbox" id="switch3" /> <label for="switch3">Toggle</label>
									</div>
								</div>
								<p>Show email so that easily find you.</p>
							</div>
							<div class="s-settings">
								<div class="s-sw-title">
									<h5>Show Task statistics</h5>
									<div class="s-swtich">
										<input type="checkbox" id="switch4" /> <label for="switch4">Toggle</label>
									</div>
								</div>
								<p>The for attribute is necessary to bind our custom
									checkbox with the input.</p>
							</div>
							<div class="s-settings">
								<div class="s-sw-title">
									<h5>Notifications</h5>
									<div class="s-swtich">
										<input type="checkbox" id="switch5" /> <label for="switch5">Toggle</label>
									</div>
								</div>
								<p>Use checkboxes when looking for yes or no answers.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- offset area end -->
		<!-- jquery latest version -->
		<script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
		<!-- bootstrap 4 js -->
		<script src="assets/js/popper.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/owl.carousel.min.js"></script>
		<script src="assets/js/metisMenu.min.js"></script>
		<script src="assets/js/jquery.slimscroll.min.js"></script>
		<script src="assets/js/jquery.slicknav.min.js"></script>

		<!-- start chart js -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
		<!-- start highcharts js -->
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<!-- start zingchart js -->
		<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
		<script>
			zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
			ZC.LICENSE = [ "569d52cefae586f634c54f86dc99e6a9",
					"ee6b7db5b51705a13dc2339db3edaf6d" ];
		</script>
		<!-- all line chart activation -->
		<script src="assets/js/line-chart.js"></script>
		<!-- all pie chart -->
		<script src="assets/js/pie-chart.js"></script>
		<!-- others plugins -->
		<script src="assets/js/plugins.js"></script>
		<script src="assets/js/scripts.js"></script>
</body>

</html>
