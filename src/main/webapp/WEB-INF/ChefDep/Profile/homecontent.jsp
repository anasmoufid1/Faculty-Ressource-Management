<%@ page import="java.util.List" %>
<%@ page import="com.loginservice.login.models.Enseignant" %>

<%@ page import="com.loginservice.login.models.Personne" %>
<%@ page import="com.loginservice.login.models.ChefDepartement" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    session = request.getSession();
    String role1=(String)session.getAttribute("role");
    Personne prs1 = (Personne)session.getAttribute("personne");

    String nommm1 = prs1.getNom();;
    String prenommm1= prs1.getPrenom();

    ChefDepartement chef = (ChefDepartement) session.getAttribute("chefdepartement");
    String departement = chef.getEnseignant().getDep().getNom();



%>
<style>
    body {
        background: rgb(99, 39, 120)
    }

    .form-control:focus {
        box-shadow: none;
        border-color: #BA68C8
    }

    .profile-button {
        background: rgb(99, 39, 120);
        box-shadow: none;
        border: none
    }

    .profile-button:hover {
        background: #682773
    }

    .profile-button:focus {
        background: #682773;
        box-shadow: none
    }

    .profile-button:active {
        background: #682773;
        box-shadow: none
    }

    .back:hover {
        color: #682773;
        cursor: pointer
    }

    .labels {
        font-size: 11px
    }

    .add-experience:hover {
        background: #BA68C8;
        color: #fff;
        cursor: pointer;
        border: solid 1px #BA68C8
    }

</style>
<div class="main">

    <nav class="navbar navbar-expand px-3 border-bottom">
        <button class="btn" id="sidebar-toggle" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>
    <main class="content px-3 py-2">

        <!-- Table Element -->
        <div class="card border-0">
            <div class="card-header">

            </div>

            <div class="card-body">
                <div class="container rounded bg-white mt-5 mb-5">
                    <div class="row justify-content-center"><!-- Ajoutez la classe justify-content-center pour centrer horizontalement -->
                        <div class="col-md-3 border-right">
                            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                                <span class="font-weight-bold"><%= prs1.getNom()%><<%= prs1.getPrenom()%>/span>
                                <span class="text-black-50"><%= prs1.getEmail()%></span>
                                <span> </span>
                            </div>
                        </div>
                        <div class="col-md-5 border-right">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h4 class="text-right">Profile Settings</h4>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-6"><label class="labels">Name</label><input type="text" class="form-control" placeholder="first name" value="<%= prs1.getNom()%>>"></div>
                                    <div class="col-md-6"><label class="labels">Surname</label><input type="text" class="form-control" value="<%= prs1.getPrenom()%>" placeholder="surname"></div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12"><label class="labels">Address</label><input type="text" class="form-control" placeholder="enter address line 2" value="<%= prs1.getAdresse()%>"></div>
                                    <div class="col-md-12"><label class="labels">Email </label><input type="text" class="form-control" placeholder="enter email id" value="<%= prs1.getEmail()%>"></div>
                                </div>

                                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="button">OK</button></div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </main>
    <a href="#" class="theme-toggle">
        <i class="fa-regular fa-moon"></i>
        <i class="fa-regular fa-sun"></i>
    </a>
    <%@ include file="/WEB-INF/footer.jsp"%>
</div>