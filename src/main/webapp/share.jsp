<%@ include file="oheader.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.math.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%! int rno=0;
String s=null;StringBuffer filedata=null;%>

<%!String  aeskey = null,nn;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null,pk=null;
int i=0;
byte data[]=null;
%>
<% 
try{
	 unm=(String)session.getAttribute("unm");
	 String fid=request.getParameter("fid");
	 String fnm=request.getParameter("fname");
	 	 String user=request.getParameter("user");
	 String symkey= (String)session.getAttribute("symkey");;
	
Connection con=databasecon.getconnection();
Statement st11=con.createStatement();
Statement st1=con.createStatement();

ResultSet r1=st11.executeQuery("select aeskey from cloud where fid="+fid+" ");
if(r1.next())
	{
aeskey=r1.getString(1);
	}

ResultSet r2=st1.executeQuery("select pk,n from users where uid='"+user+"' ");
if(r2.next())
	{
pk=r2.getString(1);
nn=r2.getString(2);
	}

BigInteger e=new BigInteger(pk);
BigInteger N=new BigInteger(nn);
System.out.println(e);
System.out.println(N);

RSA r=new RSA();
byte[] ecnkey=r.encrypt(aeskey.getBytes(),e,N);
//System.out.println(aeskey);
//System.out.println(new String(ecnkey));
PreparedStatement p=con.prepareStatement("update cloud set aeskey=?,uid=? where fid='"+fid+"'");
 
p.setBytes(1,ecnkey);
p.setString(2,user);
int res=p.executeUpdate();

if(res>0){

response.sendRedirect("upload.jsp?msg=shared");
}

}catch(Exception e){

e.printStackTrace();}
%>


		<br>
	<%@ include file="footer.jsp"%>	