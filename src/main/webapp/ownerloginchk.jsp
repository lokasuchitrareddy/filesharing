<%@ page  import="java.sql.*" import="databaseconnection.*" %>
<%
String a = request.getParameter("uid");
String b= request.getParameter("pwd");
String name=null,u=null,test2=null;

try{
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();
	
String sss1 = "select * from owner where uid='"+a+"' && pwd='"+b+"'  ";

	ResultSet rs1=st1.executeQuery(sss1);
	if(rs1.next())
	{

		
		name=rs1.getString("name");
		session.setAttribute("name",name);
		session.setAttribute("unm",a);
		response.sendRedirect("owner_home.jsp");
		}
		else{
		response.sendRedirect("owner.jsp?id2=fail");

		}
}


catch(Exception e1)
{
e1.printStackTrace();
}

%>