<%String title="Uset Home";%>

	<%@ include file="uheader.jsp"%>
<h3>Wellcome <%=(String)session.getAttribute("name")%>
<center>
<br>

<form method="post" action="search.jsp">
	

	   <div class="form-group">

	<input type="text" id="search" name="search"  		class="form-control" placeholder="search here"/ size="30">
	<br>
<table align="right">
<tr>
	<td><input class="submit" type="submit"  value="Search" 		class="form-control" /></td>
</tr>
</table>
                                    </form>


</body>
</html>
<br><br><br><br><br><br><br><br><br><br>