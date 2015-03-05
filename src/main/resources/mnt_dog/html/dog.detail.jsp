<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui"uri="http://www.jahia.org/tags/uiComponentsLib" %>

<h2>Nom du chien : ${currentNode.properties.name.string}</h2>
<ul>
	<li><h3>Bio :</h3> ${currentNode.properties.bio.string}</li>
	<li><h3><img src="${currentNode.properties.image.node.url}"/></li>
	<li><h3>Breed :</h3> <jcr:nodePropertyRenderer node="${currentNode}" name="breed" renderer="resourceBundle"/></li>
	<li><h3>Origin :</h3> <jcr:nodePropertyRenderer node="${currentNode}" name="origin" renderer="flagcountry"/></li>

	 <c:if test="${not empty currentNode.properties.birthdate}">
		<li><h3>BirthDate :</h3> <fmt:formatDate type="date" dateStyle="medium" value="${currentNode.properties.birthdate.time}"/></li>
	</c:if>
	<c:set var="daddy" value="${currentNode.properties.father.node}"/>
	<c:if test="${not empty daddy}">
		<li><h3>Father :</h3> <a href="${daddy.url}">${daddy.properties.name.string}</a></li>
	</c:if>
	<li><h3>Couleur :</h3> <jcr:nodePropertyRenderer node="${currentNode}" name="technicalReference" renderer="choiceList"/></li>

	<br/><c:url value="${currentNode.url}" var="myUrl" />
	<a href="${myUrl}">LIEN VERS LA FICHE</a>

</ul>