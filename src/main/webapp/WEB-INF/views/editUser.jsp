<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.user.demo.pojo.UserBoot" %>
  
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript">



function register(){
	var name=$("#name").val();
	var mail=$("#mail").val();	
	
     var type = $("#type").val();
     var lname = $("#lname").val();
     var mobile = $("#mobile").val();
     var passw1 = $("#passw1").val();
     var passw2 = $("#passw2").val();
    
	if(type=="0"){
		alert("Please Select Type");
		$( "#type" ).focus();
        return false;
	}
	
	
	if(name=="") {
		alert("Please Enter First  Name");
		$( "#name" ).focus();
        return false;				
	}
	
	if(lname=="") {
		alert("Please Enter last name  Name");
		$( "#lname" ).focus();
        return false;				
	}
	
	if(mail=="") {
		alert("Please Enter Mail");
		$( "#mail" ).focus();
        return false;				
	}
	
	
	if(mobile=="") {
		alert("Please mobile  Name");
		$( "#mobile" ).focus();
        return false;				
	}
	
	if(passw1=="") {
		alert("Please password  Name");
		$( "#passw1" ).focus();
        return false;				
	}
	
	if(passw1!=passw2) {
		alert("Please Enter Same Password");
		$( "#passw2" ).focus();
        return false;				
	}
	
}


</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add User</title>
</head>
<body>


<c:set var="userID" value="${userId}" />
<%-- <c:out value="${userId}"></c:out> --%>


<%-- ${param.id}  above  same--%> 

<c:if test="${not empty param.id}">
			<div class="id">-</div>
		</c:if>

<c:catch> 
<jsp:useBean id="editUserInforamtion"  class ="com.user.demo.pojo.UserBoot" scope = "request"></jsp:useBean>
 <c:set var="typeE" value="${editUserInforamtion.userType}" /> 
<div style="margin-left: 77%;" >
 
</div>

<div class="col-md-3">
      </div>

 <div class="col-md-6">
 
  
 <form:form   method="POST" action="UpdateUserControler" modelAttribute="user" onsubmit="return register()" >

				<form:input type="hidden" value="${userID}" path="userId"/>
				<div class="row">
                              <h2 class="text-center" style="color: #f0ad4e;"> <Strong> Edit User  </Strong></h2> <hr />
                              
                                 <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                       <div class="form-group">
                                          <div class="input-group">
                                             <div class="input-group-addon iga1">
                                                <span class="glyphicon glyphicon-education"></span>
                                             </div>
                                            <form:select cssClass="form-control" path= "userType" id="type" >
                                        <c:if test="${typeE =='E'}">  
                                              <form:option value="E">
                                             Employee </form:option>
                                              </c:if>  
                                             
                                              <c:if test="${typeE =='A'}">  
                                             <form:option value="A">
                                             Admin </form:option>
                                              </c:if>  
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
                                             
                     <form:input path="userName" type="text"   cssClass="form-control" value = "${editUserInforamtion.userName}" placeholder='Enter Your FirstName'  id= "name" />
                                         
                                         
                                         
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
                                              <form:input type="text"  cssClass="form-control" placeholder='Enter Your LastName' value = "${editUserInforamtion.lastName}"  id= "lname" path="lastName"/>
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
                                              <form:input type="text"   cssClass="form-control" placeholder="Enter Your Mail" value = "${editUserInforamtion.mail}"  id= "mail" path="mail"/>
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
                                             <form:input type="text"   cssClass="form-control" placeholder="Enter Mobile Number" maxlength="10" value = "${editUserInforamtion.mobile}"  id= "mobile" path="mobile"/>
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
                                             <form:input type="password" path="password" cssClass="form-control" placeholder='Enter Your Password' id= "passw1" value = "${editUserInforamtion.password}" />
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
                                       <input type="password"  class="form-control"   placeholder='ReEnter Your  Password' id="passw2" value = "${editUserInforamtion.password}"    /> <!-- bind to user.name-->
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 

                                
                                 <hr>
                                 <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                  <center>    <button type="submit" class="btn btn-info">Update User</button></center>
                                    </div>
                                    
                                     <div class="col-xs-6 col-sm-6 col-md-6">
                                  <center>  <a href="cancelBtn">  <button type="button" class="btn btn-info">Cancel</button></a></center>
                                    </div>
                                 </div>
                                 
                        </div>
                      </form:form>
              </div>         
</c:catch> 

<c:if test = "${catchtheException != null}">  
   <p>The type of exception is : ${catchtheException} <br />  
   There is an exception: ${catchtheException.message}</p>  
</c:if>

</body>
</html>