<%@ taglib prefix="jlc" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>Course Information:</h2>
<ul>
	<jlc:forEach var="cou" items="${AL}">
		<li><h1>${cou}</h1></li>
	</jlc:forEach>
</ul>



