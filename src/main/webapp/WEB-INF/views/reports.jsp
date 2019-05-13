<%@page import="javax.servlet.jsp.jstl.core.Config"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.user.demo.pojo.UserBoot" %>
  
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
    <%@page session="true"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script type="text/javascript">

$(document).ready(function() { 
    $('#example').DataTable();
});


function deleteUser(id){
	//alert(id);
	if (confirm("Are you Sure Want to delete!")) {
     //"You pressed OK!";
     
		var url="DeleteUserControler"
		var dataString  = "userId="+id;
			
			 $.ajax({
				 type:"POST",
				 url: url, 
				 data : dataString,
				 success: function(result){
					 location.reload(); 
					 
			    }});
     
     
    } else {
    /// "You pressed Cancel!";
    
    
    }
	
}

</script>
<%@ page import="java.security.Principal" %> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
</head>
<body>

 <%-- <c:if test="${pageContext.request.userPrincipal.name != null}">
            <h2>Hi User : ${pageContext.request.userPrincipal.name}></h2> 
            <br>
        </c:if> 
<c:set var="context" value="${pageContext.request.contextPath}" />

<c:out value="${context}"></c:out> --%>


		
<c:catch var ="catchtheException">
  

<center>  <h1>Welcome To DashBoard  </h1> </center>


<div style="margin-left: 77%;" >
 <a href="addUserPage"> <button type="button" class="btn btn-primary">Add User</button></a>

 <%-- <c:out value="${name}"/> --%>
 
 
 
 
</div>


<div>

<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
              <th>S.No</th>
                <th>First Name</th>
                
                <th>Last Name</th>
                <th>Mobile Number</th>
                  <th>Email</th>
                <th>UserType</th> 
                <th>Entry Date</th>
                <th>Update Date</th>
                
              
                <th>Edit</th> 
                 <th>Delete</th>              
            </tr>
        </thead>
        <tbody>
        
      
   
    <c:set var="count" value="0" scope="page" />
    
<c:forEach  items="${userInformation}" var="student">
 <tr>  
   <%-- <td>${student.loginID} </td> --%>
   
   <td>
   <c:set var="count" value="${count + 1}" scope="page"/>
   <c:out value="${count}" />
   
   </td>
     <td>${student.userName} </td> 
     <td>${student.lastName}</td>
     <td>${student.mobile}</td>
     <td>${student.mail}</td>
    <td>${student.userType}</td>
     
     <td>
     
     <fmt:formatDate type = "date"
         value = "${student.entryDate}" />
         
        <%--  <fmt:formatDate pattern = "dd-MM-yyyy"
         value = "${student.entryDate}" /> --%>
         
         
         
     </td>
     <td>
     <fmt:formatDate type = "date"
         value = "${student.updateDate}" />
     </td>
       <td>
       <a   href="EditUserControler?userId=<c:out value="${student.userId}"/>" class="btn btn-primary a-btn-slide-text">
        <span class="glyphicon glyphicon-edit" ></span>
        <span><strong>Edit</strong></span>            
    </a>
    
    
    
    </td>
     <%-- <td><a href="DeleteUser?userId=<c:out value="${student.loginID}"/>" onclick="delete()" class="btn btn-primary a-btn-slide-text">
       <span class="glyphicon glyphicon-remove" ></span>
        <span><strong>Delete</strong></span>            
    </a></td> --%>
     
  <td><a href="#" onclick="deleteUser('<c:out value="${student.userId}"/>')" class="btn btn-primary a-btn-slide-text">
       <span class="glyphicon glyphicon-remove" ></span>
        <span  ><strong>Delete</strong></span>            
    </a></td>
    
    
    
    
    
    
           <%--   <td><a href="EditServlet?userFlag=<c:out value="${student.loginID}"/>"> View </a></td> --%>
    
    
       </tr>   </c:forEach>  
       
          </tbody>
          
          
       
    </table>
    </div>
</c:catch>  

<c:if test = "${catchtheException != null}">  
   <p>The type of exception is : ${catchtheException} <br />  
   There is an exception: ${catchtheException.message}</p>  
</c:if>


</body>
</html>