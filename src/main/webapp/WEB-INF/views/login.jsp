<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
      

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<!------ Include the above in your HEAD tag ---------->

    <%@page session="true"%>


<style>
.btn-success
   {
      transition: 0.5s;
   }

   .btn-success:hover, .btn-success:focus
   {
      background: white;
      border-color: #5cb85c;
      color: black;
      transition: all 0.4s;
   }

   .btn-warning
   {
      transition: 0.5s;
   }

   .btn-warning:hover, .btn-warning:focus
   {
      background: white;
      color: black;
      border-color: #f0ad4e;
   }

   .panel.with-nav-tabs .nav-tabs
   {
      border-bottom: none; 
   }
   .panel.with-nav-tabs .nav-justified
   {
      margin-bottom: -4px;
   }

   .panel
   {
      margin: 7%;
   }

   .modal-header
   {
      background: #FF3838;
      color: white;
      text-align: center;
   }

   .input-group-addon
   {
      background-color: #5cb85c;
      color: white;
   }

   .iga1
   {
      background-color: #f0ad4e;
      color: white;
   }

   .iga2
   {
      background-color: #FF3838;
      color: white;
   }

</style>


<script type="text/javascript">

function register(){
	var name=$("#name").val();
	var mail=$("#mail").val();
	var pass=$("#pass").val();
	
	
     var type = $("#type").val();
	
	if(type=="0"){
		alert("Please Select Type");
		$( "#type" ).focus();
        return false;
	}
	
	
	if(name=="") {
		alert("Please Enter  Name");
		$( "#name" ).focus();
        return false;				
	}
	
	if(mail=="") {
		alert("Please Enter Mail");
		$( "#mail" ).focus();
        return false;				
	}
	
	if(pass=="") {
		alert("Please Enter PassWord");
		$( "#pass" ).focus();
        return false;				
	}
	
	
	/* var url="loginInsert.jsp"
		var dataString  = "name="+name + "&mail="+mail+"&pass="+pass;
		
		 $.ajax({
			 type:"POST",
			 url: url, 
			 data : dataString,
			 success: function(result){
				 alert("Please Log in");
				 location.reload(); 
				 
		       // $("#result").html("Inserted Sucessfully...");
		    }}); */
	
	
}

function login(){
	
	var uname=$("#uname").val();
	var upass=$("#upass").val();
	
	
	if(uname=="") {
		alert("Please Enter  Name");
		$( "#uname" ).focus();
        return false;				
	}
	
	if(upass=="") {
		$( "#upass" ).focus();
		alert("Please Enter Password");
        return false;				
	}
	
	
	
	/* var url="checkLogin.jsp"
		var dataString  = "uname="+uname + "&upass="+upass;
		
		 $.ajax({
			 type:"POST",
			 url: url, 
			 data : dataString,
			 success: function(result){
				var data = result.trim();
				//alert(data);
				if(data==1){
					window.location.href = "home.jsp";
				}else {
					 $("#check").html("Wrong Password ...");
				}
				
				 
		       
		    }}); */
	
	
}


</script>

<c:catch var ="catchtheException">
<div class="container">
      <div class="row">
      
      <div class="col-md-3">
      </div>
      
      
         <div class="col-md-6">
         <div class="panel with-nav-tabs panel-info">
            <div class="panel-heading">
               <ul class="nav nav-tabs">
                  <li class="active"><a href="#login" data-toggle="tab"> Login </a></li>
                  <li><a href="#signup" data-toggle="tab"> Signup </a></li>
               </ul>
            </div>

            <div class="panel-body">
               <div class="tab-content">
                  <div id="login" class="tab-pane fade in active register">
                     <div class="container-fluid">
                        <!-- Login Starts Ends Here  --> 
                           
                      <c:url var="addAction" value="/loginProcess"></c:url> 
                     <%--  <c:set var="context" value="LoginServlet" /> // *SAME --%>
             
                    
                      <form:form method="POST" action="${addAction}" modelAttribute="loginPojo" onsubmit="return login()" >
                     
                        <div class="row">
                              <h2 class="text-center" style="color: #5cb85c;"> <strong> Login  </strong></h2><hr />

                              <div class="row">
                                 <div class="col-xs-12 col-sm-12 col-md-12">
                                    <div class="form-group">
                                       <div class="input-group">
                                          <div class="input-group-addon">
                                             <span class="glyphicon glyphicon-user"></span>
                                          </div>
        <form:input path="userName" type="text"  cssClass="form-control" placeholder='Enter User Name'  id= "uname" />
                                      
                                      
                                       </div>
                                    </div>
                                 </div>
                              </div>

                              <div class="row">
                                 <div class="col-xs-12 col-sm-12 col-md-12">
                                    <div class="form-group">
                                       <div class="input-group">
                                          <div class="input-group-addon">
                                             <span class="glyphicon glyphicon-lock"></span>
                                          </div>

          <form:input path="password" type="password"  cssClass="form-control" id="upass"  placeholder='Enter Your Password' /> <!-- bind to user.name-->
                                     
                                     
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              
                              
                              
 <div class="col-xs-12 col-sm-12 col-md-12" id="check" style="color: red">
        <c:set var="flag" value="${flagSet}" />        
<c:out value="${flag}"></c:out>
 </div>


                              <div class="col-xs-12 col-sm-12 col-md-12">
                                 <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                    </div>
                                 </div>

                                  <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                       <a href="#forgot" data-toggle="modal"> Forgot Password? </a>
                                    </div>
                                 </div>
                              </div>
                              <hr />
                              <div class="row">
                                 <div class="col-xs-12 col-sm-12 col-md-12">
                                    <button type="submit" class="btn btn-success btn-block btn-lg"> Login </button>
                                 </div>
                              </div>
                              
                              
                              
                              
                              
                              

                        </div>
                        
                       </form:form>
                        
                       <!-- Login  Ends Here  --> 
                        
                        
                     </div> 
                  </div>

                  <div id="signup" class="tab-pane fade">
                     <div class="container-fluid">
                     
 <form:form method="POST" action="AddUserControler" modelAttribute="user" onsubmit="return register()" >
                        <div class="row">
                              <h2 class="text-center" style="color: #f0ad4e;"> <Strong> Register </Strong></h2> <hr />
                              
                               
                               
                                 <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                       <div class="form-group">
                                          <div class="input-group">
                                             <div class="input-group-addon iga1">
                                                <span class="glyphicon glyphicon-education"></span>
                                             </div>
                                           <form:select cssClass="form-control" path= "userType" id="type" >
                                             <form:option value="0">  Select</form:option>
                                            <form:option value="A">  Admin</form:option>
                                              <form:option value="E">  User</form:option>   
                                             </form:select>
                                             
                                             
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                               
                               
                              
                                 <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                       <div class="form-group">
                                          <div class="input-group">
                                             <div class="input-group-addon iga1">
                                                <span class="glyphicon glyphicon-user"></span>
                                             </div>
                                             <form:input type="text"  cssClass="form-control" placeholder='Enter Your FirstName'  id= "name" path="userName"/>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 
                                 
                                  <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                       <div class="form-group">
                                          <div class="input-group">
                                             <div class="input-group-addon iga1">
                                                <span class="glyphicon glyphicon-user"></span>
                                             </div>
                                             <form:input type="text"  cssClass="form-control"   placeholder='Enter Your LastName'  id= "lname" path="lastName"/>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 

                                 <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                       <div class="form-group">
                                          <div class="input-group">
                                             <div class="input-group-addon iga1">
                                                <span class="glyphicon glyphicon-envelope"></span>
                                             </div>
                                             <form:input type="text"    cssClass="form-control"  placeholder='Enter Your Mail'  id= "mail" path="mail"/>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 
                                
                                 <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                       <div class="form-group">
                                          <div class="input-group">
                                             <div class="input-group-addon iga1">
                                                <span class=" glyphicon glyphicon-earphone"></span>
                                             </div>
                                             <form:input type="text"   cssClass="form-control"  maxlength="10"  placeholder='Enter Mobile Number'   id= "mobile" path="mobile"/>
                                         <div style="color: red;">
                                           <c:if test="${flag==1}">
                                           Mobile Number Already Exists
                                           </c:if>
                                         </div>
                                         
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 
                                   <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                       <div class="form-group">
                                          <div class="input-group">
                                             <div class="input-group-addon iga1">
                                                <span class="glyphicon glyphicon-lock"></span>
                                             </div>
                                            <%--  <form:input  path ="" type="password" class="form-control" placeholder="Enter Your Password" id= "passw1" name="password"/> --%>
                                       <form:input path="password" type="password"  cssClass="form-control" id="passw1"  placeholder='Enter Your Password' /> <!-- bind to user.name-->
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 
                                 
                                  <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                       <div class="form-group">
                                          <div class="input-group">
                                             <div class="input-group-addon iga1">
                                                <span class="glyphicon glyphicon-lock"></span>
                                             </div>
                                       <input type="password"  class="form-control"   placeholder='ReEnter Your  Password' id="passw2"/> <!-- bind to user.name-->
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 
                                 <hr>
                                 <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                       <div class="form-group">
                                          <button type="submit" class="btn btn-lg btn-block btn-warning" > Register</button>
                                       </div>
                                    </div>
                                 </div>
                        </div>
                        
                    </form:form>
                     </div>
                  </div>
                  
                  
                  
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

</c:catch>

<c:if test = "${catchtheException != null}">  
   <p>The type of exception is : ${catchtheException} <br />  
   There is an exception: ${catchtheException.message}</p>  
</c:if>
   <div class="modal fade" id="forgot">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss='modal' aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></button>
               <h4 class="modal-title" style="font-size: 32px; padding: 12px;"> Recover Your Password </h4>
            </div>

            <div class="modal-body">
               <div class="container-fluid">
                  <div class="row">
                     <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                           <div class="input-group">
                              <div class="input-group-addon iga2">
                                 <span class="glyphicon glyphicon-envelope"></span>
                              </div>
                              <input type="email" class="form-control" placeholder="Enter Your E-Mail ID" name="email">
                           </div>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                           <div class="input-group">
                              <div class="input-group-addon iga2">
                                 <span class="glyphicon glyphicon-lock"></span>
                              </div>
                              <input type="password" class="form-control" placeholder="Enter Your New Password" name="newpwd">
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

            <div class="modal-footer">
               <div class="form-group">
                  <button type="submit" class="btn btn-lg btn-info"> Save <span class="glyphicon glyphicon-saved"></span></button>

                  <button type="button" data-dismiss="modal" class="btn btn-lg btn-default"> Cancel <span class="glyphicon glyphicon-remove"></span></button>
               </div>
            </div>
         </div>
      </div>
   </div>