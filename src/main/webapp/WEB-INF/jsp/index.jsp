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
<style>
#tableValuesStyle {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#tableValuesStyle td, #tableValuesStyle th {
  border: 1px solid #ddd;
  padding: 8px;
}

#tableValuesStyle tr:nth-child(even){background-color: #f2f2f2;}

#tableValuesStyle tr:hover {background-color: #ddd;}

#tableValuesStyle th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #6a6b6d;
  color: white;
}
</style>
</head>

<body onload="/">
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
									<li class="active"><a href="pattern/card">Card Team</a></li>
									<li><a href="pattern/card">Bank team</a></li>
									<li><a href="indexv1">ALL Teams</a></li>
								</ul></li>
 -->


							<li><a href="javascript:void(0)" aria-expanded="true"><i
									class="fa fa-table"></i> <span>Requirements</span></a>
								<ul class="collapse">

									<li><a href="inputv1">Create Requirement</a></li>

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



							<div class="user-profile pull-right" style="background: -webkit-linear-gradient(left, #414042 0%, #39383a 100%);background: linear-gradient(to right, #5a585d 0%, #5a595d 100%); ">
								<img class="avatar user-thumb"
									src="assets/images/author/avatar.png" alt="avatar">
								<h4 class="user-name dropdown-toggle" data-toggle="dropdown">
									${userName} <i class="fa fa-angle-down"></i>
								</h4>
								<div class="dropdown-menu" style="position: absolute;width:101%;margin-right:-10%; transform: translate3d(85px, 45px, 0px); top: 0px; left: 0px; will-change: transform;background: -webkit-linear-gradient(left, #414042 0%, #39383a 100%);background: linear-gradient(to right, #5a585d 0%, #5a595d 100%); ">
									<!-- <a class="dropdown-item" href="#">Message</a> <a
										class="dropdown-item" href="#">Settings</a> -->
									<a class="dropdown-item" style="color:white;" href="login">Log Out</a>
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
				<p style="color: red; margin: 2%;">${msg}</p>

				<div class="col-12 mt-5">
					<div class="card">
						<div class="card-body">

							<div class="single-table">
								<div class="table-responsive">
									<table id="tableValuesStyle" class="table table-hover progress-table text-center">
										<thead class="text-uppercase">

											<tr>
												<th scope="col">TDR_ID</th>
												<th scope="col">TEST CONDITION</th>
												<th scope="col">Data Used</th>
												<th scope="col">Total Data</th>
												<th scope="col">Data Remaining</th>
												<th scope="col">Sample API</th>

												<th scope="col">LOB Name</th>
												<th scope="col">Team Name</th>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${allTDRData}" var="festival">

												<tr id="${festival.key}">
													<td class="cell100 column0">${festival.key}</td>
													<c:forEach items="${festival.value}" var="values">

														<td style="max-width: 50ch;" class="cell100 column0">${values}</td>

													</c:forEach>
													<td>
														<ul class="d-flex justify-content-center">

															<li><a href="delete/${festival.key}"
																class="text-danger"><i class="ti-trash"></i></a></li>
														</ul>
													</td>

												</tr>
											</c:forEach>




										</tbody>
									</table>
								</div>
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
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
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
