<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style>

/*//////////////////////////////////////////////////////////////////
[ FONT ]*/
@font-face {
	font-family: Lato-Regular;
	src: url('../fonts/Lato/Lato-Regular.ttf');
}

@font-face {
	font-family: Lato-Bold;
	src: url('../fonts/Lato/Lato-Bold.ttf');
}

/*//////////////////////////////////////////////////////////////////
[ RESTYLE TAG ]*/
* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

body, html {
	height: 100%;
	font-family: sans-serif;
}

/* ------------------------------------ */
a {
	margin: 0px;
	transition: all 0.4s;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
}

a:focus {
	outline: none !important;
}

a:hover {
	text-decoration: none;
}

/* ------------------------------------ */
h1, h2, h3, h4, h5, h6 {
	margin: 0px;
}

p {
	margin: 0px;
}

ul, li {
	margin: 0px;
	list-style-type: none;
}

/* ------------------------------------ */
input {
	display: block;
	outline: none;
	border: none !important;
}

textarea {
	display: block;
	outline: none;
}

textarea:focus, input:focus {
	border-color: transparent !important;
}

/* ------------------------------------ */
button {
	outline: none !important;
	border: none;
	background: transparent;
}

button:hover {
	cursor: pointer;
}

iframe {
	border: none !important;
}

/*//////////////////////////////////////////////////////////////////
[ Scroll bar ]*/
.js-pscroll {
	position: relative;
	overflow: hidden;
}

.table100 .ps__rail-y {
	width: 9px;
	background-color: transparent;
	opacity: 1 !important;
	right: 5px;
}

.table100 .ps__rail-y::before {
	content: "";
	display: block;
	position: absolute;
	background-color: #ebebeb;
	border-radius: 5px;
	width: 100%;
	height: calc(100% - 30px);
	left: 0;
	top: 15px;
}

.table100 .ps__rail-y .ps__thumb-y {
	width: 100%;
	right: 0;
	background-color: transparent;
	opacity: 1 !important;
}

.table100 .ps__rail-y .ps__thumb-y::before {
	content: "";
	display: block;
	position: absolute;
	background-color: #cccccc;
	border-radius: 5px;
	width: 100%;
	height: calc(100% - 30px);
	left: 0;
	top: 15px;
}

/*//////////////////////////////////////////////////////////////////
[ Table ]*/
.limiter {
	width: 1366px;
	margin: 0 auto;
}

.container-table100 {
	width: 100%;
	min-height: 100vh;
	background: #fff;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-wrap: wrap;
	margin-top: -10%;
	padding: 33px 30px;
}

.wrap-table100 {
	width: 1170px;
}

/*//////////////////////////////////////////////////////////////////
[ Table ]*/
.table100 {
	background-color: #fff;
}

table {
	width: 100%;
}

th, td {
	font-weight: unset;
	padding-right: 10px;
}

.column1 {
	width: 33%;
	padding-left: 40px;
}

.column2 {
	width: 13%;
}

.column3 {
	width: 22%;
}

.column4 {
	width: 19%;
}

.column5 {
	width: 13%;
}

.table100-head th {
	padding-top: 18px;
	padding-bottom: 18px;
}

.table100-body td {
	padding-top: 16px;
	padding-bottom: 16px;
}

/*==================================================================
[ Fix header ]*/
.table100 {
	position: relative;
	padding-top: 60px;
}

.table100-head {
	position: absolute;
	width: 100%;
	top: 0;
	left: 0;
}

.table100-body {
	max-height: 585px;
	overflow: auto;
}

/*==================================================================
[ Ver1 ]*/
.table100.ver1 th {
	font-family: Lato-Bold;
	font-size: 18px;
	color: #fff;
	line-height: 1.4;
	background-color: #6c7ae0;
}

.table100.ver1 td {
	font-family: Lato-Regular;
	font-size: 15px;
	color: #808080;
	line-height: 1.4;
}

.table100.ver1 .table100-body tr:nth-child(even) {
	background-color: #f8f6ff;
}

/*---------------------------------------------*/
.table100.ver1 {
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-webkit-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-o-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-ms-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
}

.table100.ver1 .ps__rail-y {
	right: 5px;
}

.table100.ver1 .ps__rail-y::before {
	background-color: #ebebeb;
}

.table100.ver1 .ps__rail-y .ps__thumb-y::before {
	background-color: #cccccc;
}

/*==================================================================
[ Ver2 ]*/
.table100.ver2 .table100-head {
	box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.1);
	-webkit-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.1);
	-o-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.1);
	-ms-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.1);
}

.table100.ver2 th {
	font-family: Lato-Bold;
	font-size: 18px;
	color: #fa4251;
	line-height: 1.4;
	background-color: transparent;
}

.table100.ver2 td {
	font-family: Lato-Regular;
	font-size: 15px;
	color: #808080;
	line-height: 1.4;
}

.table100.ver2 .table100-body tr {
	border-bottom: 1px solid #f2f2f2;
}

/*---------------------------------------------*/
.table100.ver2 {
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-webkit-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-o-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-ms-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
}

.table100.ver2 .ps__rail-y {
	right: 5px;
}

.table100.ver2 .ps__rail-y::before {
	background-color: #ebebeb;
}

.table100.ver2 .ps__rail-y .ps__thumb-y::before {
	background-color: #cccccc;
}

/*==================================================================
[ Ver3 ]*/
.table100.ver3 {
	background-color: #393939;
}

.table100.ver3 th {
	font-family: Lato-Bold;
	font-size: 15px;
	color: #00ad5f;
	line-height: 1.4;
	text-transform: uppercase;
	background-color: #393939;
}

.table100.ver3 td {
	font-family: Lato-Regular;
	font-size: 15px;
	color: #808080;
	line-height: 1.4;
	background-color: #222222;
}

/*---------------------------------------------*/
.table100.ver3 {
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-webkit-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-o-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-ms-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
}

.table100.ver3 .ps__rail-y {
	right: 5px;
}

.table100.ver3 .ps__rail-y::before {
	background-color: #4e4e4e;
}

.table100.ver3 .ps__rail-y .ps__thumb-y::before {
	background-color: #00ad5f;
}

/*==================================================================
[ Ver4 ]*/
.table100.ver4 {
	margin-right: -20px;
}

.table100.ver4 .table100-head {
	padding-right: 20px;
}

.table100.ver4 th {
	font-family: Lato-Bold;
	font-size: 18px;
	color: #4272d7;
	line-height: 1.4;
	background-color: transparent;
	border-bottom: 2px solid #f2f2f2;
}

.table100.ver4 .column1 {
	padding-left: 7px;
}

.table100.ver4 td {
	font-family: Lato-Regular;
	font-size: 15px;
	color: #808080;
	line-height: 1.4;
}

.table100.ver4 .table100-body tr {
	border-bottom: 1px solid #f2f2f2;
}

/*---------------------------------------------*/
.table100.ver4 {
	overflow: hidden;
}

.table100.ver4 .table100-body {
	padding-right: 20px;
}

.table100.ver4 .ps__rail-y {
	right: 0px;
}

.table100.ver4 .ps__rail-y::before {
	background-color: #ebebeb;
}

.table100.ver4 .ps__rail-y .ps__thumb-y::before {
	background-color: #cccccc;
}

/*==================================================================
[ Ver5 ]*/
.table100.ver5 {
	margin-right: -30px;
}

.table100.ver5 .table100-head {
	padding-right: 30px;
}

.table100.ver5 th {
	font-family: Lato-Bold;
	font-size: 14px;
	color: #555555;
	line-height: 1.4;
	text-transform: uppercase;
	background-color: transparent;
}

.table100.ver5 td {
	font-family: Lato-Regular;
	font-size: 15px;
	color: #808080;
	line-height: 1.4;
	background-color: #f7f7f7;
}

.table100.ver5 .table100-body tr {
	overflow: hidden;
	border-bottom: 10px solid #fff;
	border-radius: 10px;
}

.table100.ver5 .table100-body table {
	border-collapse: separate;
	border-spacing: 0 10px;
}

.table100.ver5 .table100-body td {
	border: solid 1px transparent;
	border-style: solid none;
	padding-top: 10px;
	padding-bottom: 10px;
}

.table100.ver5 .table100-body td:first-child {
	border-left-style: solid;
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
}

.table100.ver5 .table100-body td:last-child {
	border-right-style: solid;
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
}

.table100.ver5 tr:hover td {
	background-color: #ebebeb;
	cursor: pointer;
}

.table100.ver5 .table100-head th {
	padding-top: 25px;
	padding-bottom: 25px;
}

/*---------------------------------------------*/
.table100.ver5 {
	overflow: hidden;
}

.table100.ver5 .table100-body {
	padding-right: 30px;
}

.table100.ver5 .ps__rail-y {
	right: 0px;
}

.table100.ver5 .ps__rail-y::before {
	background-color: #ebebeb;
}

.table100.ver5 .ps__rail-y .ps__thumb-y::before {
	background-color: #cccccc;
}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
	background-color: #555;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	opacity: 0.8;
	position: fixed;
	bottom: 23px;
	right: 28px;
	width: 280px;
}
</style>
</head>
<body background="img1.jpeg" onload="/">

	<div class="container-table100">
		<div class="wrap-table100">



			<div>
				<h1 style="margin-left: 35%; margin-top: -2%; margin-bottom: 3%">TEST
					DATA REQUIREMENT</h1>
			</div>

			<div>

				<a href="input">
					<button class="open-button">Create new Requirement</button>
				</a>

			</div>

			<div>
				<p style="color:red;margin:2%;">${msg}</p>
			</div>
			<div class="table100 ver3 m-b-110">
				<div class="table100-head">
					<table>
						<thead>
							<tr class="row100 head">
								<th class="cell100 column0">TDR_ID</th>
								<th class="cell100 column1">Test Condition</th>
								<th class="cell100 column2">Data Used</th>
								<th class="cell100 column3">Total Data</th>
								<th class="cell100 column4">Data Remaining</th>
								<th class="cell100 column5">Sample API</th>
							</tr>
						</thead>
					</table>
				</div>

				<div class="table100-body js-pscroll">

					<table>
						<tbody>
							<table>


								<c:forEach items="${allTDRData}" var="festival">

									<tr>
										<td class="cell100 column0">${festival.key}</td>
										<c:forEach items="${festival.value}" var="values">

											<td class="cell100 column0">${values}</td>
										</c:forEach>

									</tr>
								</c:forEach>
								</tbody>
							</table>

							</div>
				</div>

			</div>

		</div>
</body>
</html>