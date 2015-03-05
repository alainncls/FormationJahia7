<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui"uri="http://www.jahia.org/tags/uiComponentsLib" %>

<c:set var="boundDog" value="${ui:getBindedComponent(currentNode, renderContext,'j:bindedComponent')}"/>
<c:if test="${jcr:isNodeType(boundDog, 'mnt:dog')}">
	<h3>Arbre de <template:module node="${boundDog}" view="hidden.name" /> :</h3>

	<c:set var ="fatherProp" value="${boundDog.properties.father.node}" />
	<c:if test="${not empty fatherProp}">
		<p>
			<c:forEach var="i" begin="1" end="5">
				<c:if test="${not empty fatherProp}">
					<a href="<c:url value="${fatherProp.url}" />"><template:module node="${fatherProp}" view="hidden.name" /></a>
				</c:if>
				<c:set var ="fatherProp" value="${fatherProp.properties.father.node}" />
			</c:forEach>
		</p>
	</c:if>
</c:if>