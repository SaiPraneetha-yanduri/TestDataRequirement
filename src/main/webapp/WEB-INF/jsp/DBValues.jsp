<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><html>


<body>

	<h1>db values</h1>
	<table>
	<c:forEach items="${allTDRData}" var="festival">
	<tr>
	<c:forEach items="${festival.value}" var="values">
	<td>${values}</td>
	</c:forEach>
	</tr>
	</c:forEach>
	</table>
	
	
	<p> Divisions</p>
	<c:forEach items="${allTDRData}" var="festival">
		<div>${festival.key}</div>

		<c:forEach items="${festival.value}" var="values">
			<div>${values}</div>
		</c:forEach>


	</c:forEach>
</body>
</html>
