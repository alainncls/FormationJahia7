<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui"uri="http://www.jahia.org/tags/uiComponentsLib" %>


<h3>Niche #1 :</h3>

<c:set var ="dogsIn" value="${currentNode.properties.dogs}" />

<p>
	<c:forEach items = "${dogsIn}" var = "dog">
	<c:if test="${not empty dog.node}">
	<a href="<c:url value="${dog.node.url}" />"><template:module node="${dog.node}" view="hidden.name" /></a>
</c:if>
</c:forEach>
</p>

