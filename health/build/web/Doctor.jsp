<%-- 
    Document   : Doctor
    Created on : Feb 4, 2018, 12:03:03 AM
    Author     : M. Hammad Shahid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    
    <script>
        function Validate()
        {
            var usr = document.forms["myForm"]["doctor_id"];
	var pass = document.forms["myForm"]["doctor_password"];
            var name = document.forms["myForm"]["firstname"];
	var contact = document.forms["myForm"]["contact"];
	var city = document.forms["myForm"]["city"];
        var loc = document.forms["myForm"]["location"];
	var alphaExp = /^[a-zA-Z ]+$/;
	var numExp = /^[0-9-]+$/;
	var alphanumExp = /^[0-9a-zA-Z-, ]+$/;
        var alphanumExp1 = /^[0-9a-zA-Z]+$/;
        
        if(!(usr.value.match(alphanumExp1)))  //to check only for alphabets match
	{
	alert("Invalid characters in Username");
		usr.style.backgroundColor = "red";
		usr.focus();
        return false;
	}
        if(!(pass.value.match(alphanumExp1)))  //to check only for alphabets match
	{
	alert("Invalid characters in Password");
		pass.style.backgroundColor = "red";
		pass.focus();
        return false;
	}
        if(!(name.value.match(alphaExp)))  //to check only for alphabets match
	{
	alert("Name should only have alphabets");
	name.style.backgroundColor = "red";
	name.focus();
        return false;
	}
        if(!(contact.value.match(numExp)))  //to check only for alphabets match
	{
	alert("Invalid Contact");
		contact.style.backgroundColor = "red";
		contact.focus();
        return false;
	}
        if(!(city.value.match(alphaExp)))  //to check only for alphabets match
	{
	alert("Invalid characters in City");
		city.style.backgroundColor = "red";
		city.focus();
        return false;
	}
        if(!(loc.value.match(alphanumExp)))  //to check only for alphabets match
	{
	alert("Invalid characters in Location");
		loc.style.backgroundColor = "red";
		loc.focus();
        return false;
	}
            
        }
        </script>
<style>
#body_div{
    background: url(images/s2.jpg) no-repeat;
	background-size: cover;
    min-height: 100vh;
    color: white;
	background-position:center;
	padding-top: 30px;	
}

#form_div {
	width: 720px;
    margin: auto;
    padding: 30px 30px 20px;
    box-sizing: border-box;
    background-color: rgba(0, 0, 0, 0.31);
	text-align:center;
}
#problem
{
    width: 45%;
    padding: 12px 20px;
	padding-left:80px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 3px solid #ccc;
    -webkit-transition: 0.5s;
    transition: 0.5s;
    outline: none;
    background-position: 10px 10px; 
	background-color: rgba(255, 255, 255, 0.63);
}
input[type=text]{
    width: 45%;
    padding: 12px 20px;
	padding-left:80px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 3px solid #ccc;
    -webkit-transition: 0.5s;
    transition: 0.5s;
    outline: none;
    background-position: 10px 10px; 
	background-color: rgba(255, 255, 255, 0.63);
}
select:focus
{
    background-color: 		#808080;
	    border: 3px solid #555;

}
input[type=text]:focus {
    border: 3px solid #555;
}
input:focus {
    background-color: 		#808080;
}
#Sdisease:focus {
    background-color: 		#808080;
	    border: 3px solid #555;
}
#Sdisease{
width: 45%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 3px solid #ccc;
    -webkit-transition: 0.5s;
    transition: 0.5s;
    outline: none;
    background-position: 10px 10px; 
	background-color: rgba(255, 255, 255, 0.63);
}
#timing:focus {
    background-color: 		#808080;
	    border: 3px solid #555;
}
#timing{
width: 25%;
   
    margin: 8px 0;
    box-sizing: border-box;
    border: 3px solid #ccc;
    -webkit-transition: 0.5s;
    transition: 0.5s;
    outline: none;
    background-position: 10px 10px; 
	background-color: rgba(255, 255, 255, 0.63);
	text-align:justify;
}

#Confirm_Appoint
{
 width: 35%;
    padding: 10px;
    background: #2196F3;
    color: white;
    font-size: 17px;
    border: none;
    cursor: pointer;
	float:left;
}
#Confirm_Appoint:hover {
    background: 	#008B8B;
}
.heading {
    text-align: center;
	    margin-bottom: 20px;
		letter-spacing: 1px;
}
</style>
</head>
<body>
<div id="body_div">
<div id="form_div"> 
<form name="myForm" action="InsertDoctor.jsp">
 <fieldset>
 <div class="heading">
				<h2>Fill Your Personal Info And Timings</h2>
				
</div>
<br>
<input type="text" name="doctor_id" placeholder="Username as Doctor"  required><br>
<input  type="text" name="doctor_password" placeholder="Password"  required> <br>
  <input type="text" name="firstname" placeholder="Doctor's Name" required ><br>
  Specialist:<select id="problem" name="relatedTo" required>  <!--rgba use multiple in select tag to select multiple values-->
  <option value="Heart">Heart</option>
  <option value="Eyes">Eyes</option>
  <option value="Brain">Brain</option>
  <option value="Kidney">Kidney</option>
  <option value="Back Bone">Back Bone</option>
  <option value="Stomach">Stomach</option>
  <option value="Lungs">Lungs</option></select><br>
  <input type="text" name="contact" placeholder="Contact Number" required><br>
  <input id="problem" type="number" name="charge" placeholder="Charges" required><br>
   <input type="text" name="city" placeholder="Visiting City" required><br>
   <input type="text" name="location" placeholder="Visiting Location in city" required><br>
   
   <fieldset>
   <h2>Weekly Timings</h2>
   Saturday: <input id="timing" type="time" name="sat">  Sunday:<input id="timing" type="time" value="-" name="sun"><br>
   Monday:<input id="timing" type="time" name="mon">     Tuesday:<input id="timing" type="time" name="tue"><br>
   Wednesday:<input id="timing" type="time" name="wed">     Thursday:<input id="timing" type="time" name="thurs"><br>
   Friday:<input id="timing" type="time" name="fri"> 
   </fieldset><br>
   <br><br><br><br>
  <button type="submit" id="Confirm_Appoint" onclick=" return Validate()">Create Login</i></button>
   </fieldset>
  
</form></div></div>
</body>
</html>
