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
                <h5 class="card-title" style="text-align: center; margin-bottom: 30px;">Département : <%= departement %></h5>
                <h6 class="card-subtitle text-muted">Chef de département : <%= nommm1 %> <%= prenommm1 %></h6>
            </div>

            <div class="card-body">
                <p style="text-decoration: underline;">Liste des enseignants :</p>
                <table class="table">
                    <thead>
                    <tr>

                        <th>Nom et prenom</th>
                        <th>specialite</th>
                        <th>Email</th>

                        <!-- Ajoutez d'autres colonnes au besoin -->
                    </tr>
                    </thead>
                    <tbody>

                    <%
                        List<Enseignant> listPersonne = (List<Enseignant>) request.getAttribute("EnseiList");
                        for (Enseignant personne : listPersonne) {
                    %>
                    <tr>
                        <td><%= personne.getPersonne().getNom() + " " + personne.getPersonne().getPrenom() %></td>
                        <td><%= personne.getSpecialte() %></td>
                        <td><%= personne.getPersonne().getEmail() %></td>
                                                <!-- Ajoutez d'autres colonnes au besoin -->
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>

            </div>
        </div>
    </main>
    <a href="#" class="theme-toggle">
        <i class="fa-regular fa-moon"></i>
        <i class="fa-regular fa-sun"></i>
    </a>
    <%@ include file="../footer.jsp"%>
</div>