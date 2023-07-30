<%String title="Data Owner Page";%>
<%@ include file="header.jsp"%>
   <%
                                                       String id=request.getParameter("id");
                                                       if(id!=null )
                                                       {
                                                               out.println("<script>alert('Registered done. Login Here..!')</script>");

                                                       }

													    String id2=request.getParameter("id2");
                                                       if(id2!=null )
                                                       {
                                                               out.println("<script>alert('Incorrect Credentials')</script>");

                                                       }
%>
<div class="page-header">
            <div class="overlay">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1><center>Data User</center></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>


											    <section id="contact" class="contact">
        <div class="container">
            <br>
			 <h2>DataUser Login</h2>
			 <br>
            <div class="row">
                <div class="col-lg-12">
                    <form method="post" action="userloginchk.jsp" id="contactForm" >
                        <div class="row">
                            <div class="col-md-6 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">
                                <div class="form-group">
                                    <input type="text" class="form-control"  placeholder="User ID *" required name="uid">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="pwd" placeholder="Password *" required >
                                    <p class="help-block text-danger"></p>
                                </div>
                              
								<div class="form-group">
                                     <button type="submit" class="btn btn-primary">SignIn  </button>

                                </div>
								<div class="form-group">
                                  New User? <a href="userreg.jsp"><u> SignUp here.</u></a>

                                </div>
                            </div>
                            
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
    </section>



<%@ include file="footer.jsp"%>