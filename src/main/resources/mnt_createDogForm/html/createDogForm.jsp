<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui"uri="http://www.jahia.org/tags/uiComponentsLib" %>

<%--Forum post creation form through rest--%>
<template:tokenizedForm>
<form action="${url.base}/sites/dogsSite/home/pagecontent/*" method="post" id="createDogForm">
	<input type="hidden" name="jcrNodeType" value="mnt:dog"/>
	<input type="hidden" name="jcrRedirectTo" value="${url.base}${renderContext.mainResource.node.path}"/>
	<%-- Define the output format for the new node by default html or by redirectTo--%>
	<input type="hidden" name="jcrNewNodeOutputFormat" value="html"/>
	<fieldset>
		<p class="field">
			Nom : <input type="text" size="35" id="name" name="name" tabindex="1"/>
			Bio : <input type="text" size="35" id="bio" name="bio" tabindex="2"/>
		</p>
		<p class="field">
			<label class="left" for="captcha"><template:captcha/></label>
			<input type="text" id="captcha" name="jcrCaptcha" tabindex="3"/>
		</p>
		<p class="forum_button">
			<input type="reset" value="Reset" class="button" tabindex="4"/>
			<input type="submit" value="Submit" class="button" tabindex="5"/>
		</p>
	</fieldset>
</form>
</template:tokenizedForm>

<template:addResources type="javascript" resources="jquery.js,jquery.validate.js"/>
<template:addResources type="inlinejavascript">
<script type="text/javascript">
	$(document).ready(function() {
		$("#createDogForm").validate({
			rules: {
				name: "required",
				bio: "required",
				jcrCaptcha: "required"
			}
		});
	});
</script>
</template:addResources>