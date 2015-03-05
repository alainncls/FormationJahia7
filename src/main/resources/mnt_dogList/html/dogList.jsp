<script src="/modules/assets/javascript/jquery.min.js" type="text/javascript"></script>

<h1>Example of a JCR query using jQuery & JSON</h1>
<form name="jcrQueryForm" action="">
	<table>
		<tr>
			<td><label for="username">User name :</label></td>
			<td><input id="username" type="text" name="username" value="root" size="30" /></td>
		</tr>
		<tr>
			<td><label for="password">Password :</label></td>
			<td><input id="password" type="password" name="password" value="rootroot" size="30" /></td>
		</tr>
		<tr>
			<td><label for="query">Query : </label></td>
			<td><input id="query" type="text" name="query" value="SELECT * FROM [mnt:dog]" size="80" /></td>
		</tr>
		<tr>
			<td><label for="queryLanguage">Query language :</label></td>
			<td><select id="queryLanguage" name="language">
				<option value="JCR-SQL2" selected="true">JCR-SQL2</option>
			</select></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><input id="submitButton" type="submit" name="submitButton" /></td>
		</tr>
	</table>
</form>
<table id="languageCounts" border="1" cellpadding="5" cellspacing="0">
	<thead>
		<tr>
			<th>Row</th>
			<th>Name</th>
			<th>Value</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<script type="text/javascript">
	doQuery();
	function login() {
		// $.ajax({
		// 	url : "/cms/login",
		// 	type : "POST",
		// 	data : { username : $("input#username").val(), password : $("input#password").val(), redirectActive : "false", doLogin: "1" },
		// 	success : function(data) {
		// 		doQuery();
		// 	}
		// });
doQuery();
}
function doQuery() {
	$.ajax({
		url : "/cms/find/default/en",
		type : "POST",
		dataType : "json",
		data : { query : $("input#query").val() },
		success : function(data) {
			$("#languageCounts tbody").html("");
			$.each(data, function(i, row) {
				var tblRow = "<tr>";
				tblRow += "<td>"+i+"</td>";
				tblRow += "<td><a href=\"/cms/render/default/fr"+row["node"]["path"]+".html\">"+row["mnt:dog.name"]+"</a></td>";
				tblRow += "<td><img src=\""+row["node"]["image"]+"\" style=\"max-height:80px; width:auto;\" /></td>"

				tblRow += "</tr>";
				$(tblRow).appendTo("#languageCounts tbody");
			});
			logout();
		}});
}
function logout() {
		// $.ajax({
		// 	url : "/cms/logout",
		// 	type : "POST",
		// 	data : { redirectActive : "false" }
		// });
}
$(document).ready(function() {
});
$("#submitButton").click(function () {
	login();
	return false;
})
</script>