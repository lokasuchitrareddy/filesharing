
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.swing.JOptionPane"%>


		<%@ include file="uheader.jsp"%>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 80%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>

<div class="page-header">
            <div class="overlay">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1><center>File Downloading</center></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<br>

          <table align="center" border=2>
    
            <tr> 
              <th >File ID</th>
			   <th>File Name</th>
              <th>DataOwner</th>
			  <th>File Data</th>
            </tr>
            <%
		
			


ResultSet rs=null;

try
{
	Connection con = databasecon.getconnection();
	Statement st = con.createStatement();	
String uid=(String)session.getAttribute("unm");
System.out.println(uid);
    String qry="select *from cloud where uid='"+uid+"'";
		rs =st.executeQuery(qry);
		
	while(rs.next())
	{	
%>
            <tr> 
              <td > <%=rs.getString(1)%></td>
			   <td > <%=rs.getString(2)%> </td>
			    <td > <%=rs.getString("owner")%> </td>
          
              <td align="center"><a href="viewdata.jsp?fid=<%=rs.getString(1)%>">View</a></td>
            </tr>
            <%
	   }
	   }
	   catch(Exception e1)
	   {
	     out.println(e1);

	   }
 %>
          </table>
        </form>
		<br><br><br><br><br><br><br>
<%@ include file="footer.jsp"%>