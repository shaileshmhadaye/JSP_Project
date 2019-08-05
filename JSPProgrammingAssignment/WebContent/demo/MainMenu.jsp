<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<style type="text/css">
	
			* {box-sizing: border-box}

			/* Style the tab */
			.tab {
			  
			  float: left;
			  border: 1px solid #ccc;
			  background-color: #f1f1f1;
			  width: 30%;
			  height: 500px;
			}
			
			/* Style the buttons that are used to open the tab content */
			.tab button {
			  font-size: 20px;
			  display: block;
			  background-color: inherit;
			  color: black;
			  padding: 22px 16px;
			  width: 100%;
			  border: none;
			  outline: none;
			  text-align: left;
			  cursor: pointer;
			  transition: 0.3s;
			}
			
			/* Change background color of buttons on hover */
			.tab button:hover {
			  background-color: #ddd;
			}
			
			/* Create an active/current "tab button" class */
			.tab button.active {
			  background-color: #ccc;
			}
			
			/* Style the tab content */
			.tabcontent {
			  float: left;
			  padding: 0px 12px;
			  border: 1px solid #ccc;
			  width: 70%;
			  border-left: none;
			  height: 500px;
			}
			
			table {
			  border-collapse: collapse;
			  border-spacing: 0;
			  width: 80%;
			  border: 1px solid #ddd;
			}
			
			th, td {
			  text-align: left;
			  padding: 10px;
			}
			
			tr:nth-child(even) {
			  background-color: #f2f2f2
			}
			
			.active {
			  background-color: green;
			  color: white;
			}
			
			/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
			.dropdown-content {
			  display: none;
			  background-color: inherit;
			  padding-left: 8px;
			}
			
			/* Optional: Style the caret down icon */
			.fa-caret-down {
			  float: right;
			  padding-right: 8px;
			}
	
	</style>

<meta charset="UTF-8">
<title>MainMenu</title>
</head>
<body>

		<h1 align="center">Operations on database</h1>

		<div class="tab">
		  <button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">Create a record</button>
		  <button class="tablinks" onclick="openCity(event, 'Paris')">Read all records</button>
		  
				<button class="dropbtn" >update name<i class="fa fa-caret-down"></i></button>
		  <div class="dropdown-content">
			    <button class="tablinks" onclick="openCity(event, 'update-rollno')">update roll number</button>
			  	<button class="tablinks" onclick="openCity(event, 'update-name')">update name</button>

		  </div>
		  
		  <button class="tablinks" onclick="openCity(event, 'delete')">delete a record</button>
		</div>
		
		<div id="London" class="tabcontent">
		  <h3>Create a record</h3>
		  	<form action="createS.jsp" method="post">
	
				Enter roll number: <input type="number" name="rollno"><br>
				Enter name: <input type="text" name="name"><br>
				<input type="submit" value="submit">
				
			</form>
		</div>
		
		<div id="Paris" class="tabcontent">
		  <h3>Read all records</h3>
		  		<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/db" user="root" password="test"/>
	
				<sql:query var="rs" dataSource="${db}">select * from student</sql:query>
				
				<table>
				<tr>
					<th>Roll no</th>
					<th>Name</th>
				</tr>
				<c:forEach items="${rs.rows}" var="student">
					<tr>
						<td><c:out value="${student.rollno}"></c:out></td>
						<td><c:out value="${student.name}"></c:out></td>
					</tr>
				</c:forEach>
				</table>
		</div>
		
		<div id="update-name" class="tabcontent">
		  <h3>update name</h3>
		  	<form action="updateS.jsp" method="post">
	
				Enter roll number: <input type="number" name="rollno"><br>
				Enter correct name: <input type="text" name="name"><br>
				<input type="submit" value="submit">
			
			</form>
		</div>
		
		<div id="update-rollno" class="tabcontent">
		  <h3>update roll no</h3>
		  	<form action="updateS.jsp" method="post">
	
				Enter roll number: <input type="number" name="rollno"><br>
				Enter correct name: <input type="text" name="name"><br>
				<input type="submit" value="submit">
			
			</form>
		</div>
		
		<div id="delete" class="tabcontent">
		  <h3>delete a record</h3>
		  <form action="deleteS.jsp" method="post">
	
		Enter roll number: <input type="number" name="rollno"><br>
		<input type="submit" value="submit">
	
	</form>
		</div>

<script>
		function openCity(evt, cityName) {
		  var i, tabcontent, tablinks;
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }
		  document.getElementById(cityName).style.display = "block";
		  evt.currentTarget.className += " active";
		}
		
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
		
		
		var dropdown = document.getElementsByClassName("dropbtn");
		var i;

		for (i = 0; i < dropdown.length; i++) {
		  dropdown[i].addEventListener("click", function() {
		    this.classList.toggle("active");
		    var dropdownContent = this.nextElementSibling;
		    if (dropdownContent.style.display === "block") {
		      dropdownContent.style.display = "none";
		    } else {
		      dropdownContent.style.display = "block";
		    }
		  });
		}
		
</script>

<!--  
		<h1 align="center">Operations on database</h1>
		
		<div align="center" class="btn-group">
			  <a href="create.jsp" ><button >Create a record in a table</button></a>
			  <a href="read.jsp"><button>Read all records in table</button></a>
			  <a href="update.jsp"><button>update name of a student in table</button></a>
			  <a href="delete.jsp"><button>delete a record in table</button></a>
		</div>
		
		
-->
		
</body>
</html>