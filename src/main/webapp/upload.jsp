<%String title="Data Outsourcing";%>

				 
<%@ include file="oheader.jsp"%>
     <%
                                                      String m=request.getParameter("id");
                                                       if(m!=null && m.equalsIgnoreCase("succ"))
                                                       {
                                                               out.println("<font  color='red'><blink><h3>&nbsp;&nbsp;&nbsp;File Uploaded Successfully  !! </blink></font></h3>");
                                                       }

													   

													   
                                               %>

<div class="page-header">
            <div class="overlay">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1><center>Upload Data</center></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<br><br>
<%
 String m2=request.getParameter("msg");
if(m2!=null)
 {

 out.println("<script>alert('Encrypted data shared successfully to user')</script>");
   
   }%>    <center>                                                  
   <div class="form-group">
<h2>Select File for uploading</h2>
	<form action="UpdateAnyFiles" enctype="multipart/form-data"class="form-group" method="post">
	<table width="50%">
<tr> <td><br><input type="file"  name="file"class="form-control" required>

<tr>                <td>    <br> 

 <div class="form-group">
                                     <button type="submit" class="btn btn-primary">Load  </button>

                                </div>
               
              </tr>
			  	</table>
	</form>
<br><br>
</div>
<br><br><br><br>


<%@ include file="footer.jsp"%>