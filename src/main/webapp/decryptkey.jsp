<%@ include file="uheader.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.io.*,java.math.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%! int rno=0;
String s=null;StringBuffer filedata=null;%>

<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null,sk=null,nn;
int i=0;
byte aeskey[]=null;
%>
<% unm=(String)session.getAttribute("unm");
	 String fid=request.getParameter("fid");

	
Connection con=databasecon.getconnection();
Statement st11=con.createStatement();
Statement st1=con.createStatement();

ResultSet r1=st11.executeQuery("select aeskey from cloud where fid="+fid+" ");
if(r1.next())
	{
aeskey=r1.getBytes(1);
	}

ResultSet r2=st1.executeQuery("select sk,n from users where uid='"+unm+"' ");
if(r2.next())
	{
sk=r2.getString(1);
nn=r2.getString(2);
	}
System.out.println(sk);
	System.out.println(nn);
BigInteger d=new BigInteger(sk);
BigInteger N=new BigInteger(nn);

RSA rr=new RSA();
byte[] deckey=rr.decrypt(aeskey,d,N);
System.out.println(new String(deckey));

ResultSet r11=st11.executeQuery("select *from cloud where fid="+fid+" ");
if(r11.next())
	{



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
        </div>
	<section id="contact" class="contact">
        <div class="container">
            <br>
			
		
            <div class="row">
                <div class="col-lg-12">
                    <form method="post" action="decryption.jsp" id="contactForm" >
                        <div class="row">
                            <div class="col-md-6 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">

							 <div class="form-group">
							 <label>File Id</label>
                                    <input type="text" class="form-control"   required name="fid"  value=<%=r11.getString(1)%> >
									         
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
								<label>File Name</label>
                                    <input type="text" class="form-control"  required name="fname" value=<%=r11.getString(2)%> >
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
									<label>EncryptedData</label>
								<textarea  placeholder=" " class="form-control"name="file"  required		type="text" cols="60"
										rows="5" required=""><%=r11.getBytes(3)%></textarea>
                                    
                                    <p class="help-block text-danger"></p>
                                </div>
									
								<div class="form-group">
									<label>Symmetrickey</label>
								
                                    <input type="text" class="form-control"  required name="key" value=<%=new String(deckey)%> >
                                    <p class="help-block text-danger"></p>
                                </div>
							
								<div class="form-group">
                                     <button type="submit" class="btn btn-primary">Decryption  </button>

                                </div>
								
                            </div>
                            
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
        	<%}%>
    </section>
	
		<br>
	<%@ include file="footer.jsp"%>	