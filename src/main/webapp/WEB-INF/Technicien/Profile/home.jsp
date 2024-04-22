<%@ page import="java.util.List" %>
<%@ page import="com.loginservice.login.models.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mes Projets</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/ae360af17e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style2.css">
</head><body>
    <div class="wrapper">
        <%String erreur = (String)request.getAttribute("erreur");%>
        <%Technicien technicien = (Technicien) session.getAttribute("technicien");%>
		<%@ include file="../../sidebar.jsp"%>
		<%@ include file="homecontent.jsp"%>
	</div>	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>