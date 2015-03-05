<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<h2>Liste des derniers chiens regardés</h2>
<c:forEach items="${latestViewedDogs}" var="dogPath" begin="0" end="${currentNode.properties.maxDogs.long-1}">
	<template:module path="${dogPath}" view="${currentNode.properties.dogsView.string}" editable="false"/><br/>
</c:forEach>