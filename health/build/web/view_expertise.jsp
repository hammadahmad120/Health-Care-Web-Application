<%-- 
    Document   : view_expertise
    Created on : Feb 4, 2018, 10:19:10 AM
    Author     : M. Hammad Shahid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<title>Expertise</title>
<!--link for special icons in footer-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
@import url(https://fonts.googleapis.com/css?family=Shrikhand);
#top_back{
width:100%;
height:330px;
background:						#6495ED;
border:0px;
padding:0px;
}
#nameStyle{
color: 	#000080;
font-family: 'Shrikhand';
font-style: italic;
font-size: 80px;
margin-top:5px;
padding-top:5px;
text-align:center;

}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color:				#191970;
	height:80px;
	 text-align: center;
}

li {
    float: left;
	margin-right:40px;
	 text-align: center;
	 font-family: 'Shrikhand';
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
	height:80px;
	font-family: 'Shrikhand';
	
}

li a:hover:not(.active) {
    background-color: 	#6A5ACD;
}

.active {
    background-color: 			#6A5ACD;
}
.dropbtn{
float:right;
margin-right:30px;
margin-top:20px;
background-color: #191970;
    color: white;
    
    font-size: 16px;
	padding-top:16px;
	padding-bottom:30px;
    border: none;
    cursor: pointer;
	width:200px;
	height:40px;
	text-align:center;
	font-family: 'Shrikhand';
}
.dropbtn:hover {
    background-color: 	#6A5ACD;
}
#feeling
{
 text-align:center;
 color:#191970;
 font-size:60px;
 font-family: 'Shrikhand';
}
#SearchBtn
{
 width: 17%;
    padding: 10px;
    background: #2196F3;
    color: white;
    font-size: 17px;
    border: none;
    cursor: pointer;
}
.SearchBtn:hover {
    background: #0b7dda;
}
#problem{
width: 30%;
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
#problem:focus {
    border: 3px solid #555;
}
#problem:focus {
    background-color: #4169E1;
}
#show_expertise{
width:85%;
height:315px;
background:#B0C4DE;
border:2px solid #555;
padding-top:20px;
padding-bottom:20px;
padding-right:20px;
margin-left: 40px;
}
#bio_data{
color:	#808080;
padding-left:30px;

}
#footer1
{
 height:100px;
    color: #483D8B;
    background-color: 			#4169E1;
}

</style>
</head>

<body style="background-color:#F0F8FF">
<div id="top_back">
<span>
<img src="images\logoHealth.jpg" style="height:80px;width:80px; padding-top:10px;padding-left:20px;"></span>
<span id="nameStyle">Health Care</span>

<ul>
  <li><a  href="mainPage.html">Home</a></li>
  <li><a class="active" href="#Expertise">Expertise</a></li>
  <li><a href="ContactUs.html">Contact</a></li>
  <li><a href="AboutUs.html">About</a></li>
</ul>
<h1 id="feeling"> Search For Expert Advices...<h1>
</div>
<form  action="view_expertise.jsp">
 <select id="problem" name="relatedTo" >  <!--rgba use multiple in select tag to select multiple values-->
 <option value="Fatness">Fatness</option>
  <option value="Eyes Weakness">Eyes Weakness</option>
  <option value="Hair Fall">Hair Fall</option>
  <option value="Skin Allergy">Skin Allergy</option>
  <option value="Back Pain">Back Pain</option>
  <option value="Stomach Problem">Stomach Problem</option>
  <option value="Throat Pain">Throat Pain</option></select>
    <button type="submit" id="SearchBtn" onclick="this.form.submit()"><i class="fa fa-search"></i></button>
</form>
    
    <%
        String rel=request.getParameter("relatedTo");
        pkg3.ExpertiseDAO Eobj=new pkg3.ExpertiseDAO();
        pkg3.Expertise exp=new pkg3.Expertise();
        ArrayList lst=new ArrayList();
        lst=Eobj.Get_Expertise(rel);
        pkg3.DoctorDAO Dobj=new pkg3.DoctorDAO();
        pkg3.Doctor doc=new pkg3.Doctor();
        for(int i=0;i<lst.size();i++)
{

	exp=(pkg3.Expertise)lst.get(i);
        int id=exp.getD_id();
    doc=Dobj.get_complete_Doctor(id);
%>
    
<br><br>
<div id="show_expertise">
<span>
<textarea name="message" rows="20" cols="100" style="overflow:auto;float:right;background:	#6495ED;color:white;font-weight: bold;">
    <%=exp.getComments() %>
</textarea>
 <h2 id="bio_data" name="D_name" style="color:#483D8B;"><%=doc.getD_name() %></h2>
    <h3 id="bio_data" name="D_spec"><i class="fa fa-briefcase" style="font-size:20px;"></i><%=doc.getD_spec() %> </h3>
	<h3 id="bio_data" name="D_city"><i class="fa fa-map-marker" style="font-size:20px;"></i> <%=doc.getD_city() %> </h3>
	<h3 id="bio_data" name="D_location"><i  class="fa fa-address-card" style="font-size:20px;"></i> <%=doc.getD_location() %></h3>
	<h3 id="bio_data" name="D_contact"><i  class="fa fa-phone" style="font-size:20px;"></i> <%=doc.getD_contact() %> </h3>
</span>
</div>
<br><br>
<hr>
<% } %>


</body>
</head>

</html>
