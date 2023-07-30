<%@ include file="uheader.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%! int rno=0;
String s=null;StringBuffer filedata=null;%>
<%

 unm=(String)session.getAttribute("unm");
	 String fid=request.getParameter("fid");
	 String symkey=request.getParameter("key");
 %>
<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null,pkey=null;
int i=0;
byte data[]=null;
%>
<% 
	
Connection con=databasecon.getconnection();
Statement st11=con.createStatement();
Statement st1=con.createStatement();

ResultSet r1=st11.executeQuery("select AES_DECRYPT(filedata,'"+symkey+"'),filenm from cloud where fid="+fid+" ");
if(r1.next())
	{
data=r1.getBytes(1);
fnm=r1.getString(2);
	}
%>
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
        </div
<br>
	<section id="contact" class="contact">
        <div class="container">
            <br>
			
			 <br>
            <div class="row">
                <div class="col-lg-12">
                    <form method="post" action="finaldownload.jsp" id="contactForm" >
                        <div class="row">
                            <div class="col-md-6 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">

							 <div class="form-group">
							 <label>File Id</label>
                                    <input type="text" class="form-control"   required name="fid"  value=<%=fid%> ><input type="hidden" name="symkey" value="<%=symkey%>">
									         
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
								<label>File Name</label>
                                    <input type="text" class="form-control"  required name="fname" value=<%=fnm%> >
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
									<label>FileData</label>
								<textarea  placeholder=" " class="form-control"name="file"  required		type="text" cols="60"
										rows="5" required=""><%=data%></textarea>
                                    
                                    <p class="help-block text-danger"></p>
                                </div>
									
								
								<div class="form-group">
                                     <button type="submit" class="btn btn-primary">Download</button>

                                </div>
								
                            </div>
                            
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
    </section>
		
		<br>
	<%@ include file="footer.jsp"%>	