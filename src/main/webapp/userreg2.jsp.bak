<%@ page  import="java.sql.*" import="databaseconnection.*,crypt.RSA" %>
<%@ page import="java.sql.*"%>



<%! String name, gen,addr, city, street, zip, tele, email, uid, pwd,ph,un;
	int i=0;
%>
<%

name=request.getParameter("name");
uid=request.getParameter("uid");
pwd=request.getParameter("pwd");
email=request.getParameter("email");
ph=request.getParameter("mno");


%>



<%
try{
Connection con = databasecon.getconnection();
Statement st=con.createStatement();

int q= st.executeUpdate("insert into users(name,uid,pwd,email,mno) values('"+name+"','"+uid+"','"+pwd+"','"+email+"','"+ph+"')");

if(q>0)
{
RSA obj=new RSA();
obj.keyGen(uid);
response.sendRedirect("user.jsp?id=succ" );
//response.sendRedirect("register.jsp?message=succ");
}

}
catch(Exception e)
{
e.printStackTrace();
	}
%>

