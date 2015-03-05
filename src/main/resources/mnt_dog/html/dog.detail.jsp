<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<h2>Nom du chien : ${currentNode.properties.name.string}</h2>
<ul>
	<li>Bio : ${currentNode.properties.bio.string}</li>
	<li><img src="${currentNode.properties.image.node.url}"/></li>
	<li>Breed : <jcr:nodePropertyRenderer node="${currentNode}" name="breed" renderer="resourceBundle"/></li>
	<li>Origin : <jcr:nodePropertyRenderer node="${currentNode}" name="origin" renderer="flagcountry"/></li>

	 <c:if test="${not empty currentNode.properties.birthdate}">
		<li>BirthDate : <fmt:formatDate type="date" dateStyle="medium" value="${currentNode.properties.birthdate.time}"/></li>
	</c:if>
	<c:set var="daddy" value="${currentNode.properties.father.node}"/>
	 <c:if test="${not empty daddy}">
		<li>Papa : ${daddy.properties.name.string} </li>
	</c:if>
</ul>