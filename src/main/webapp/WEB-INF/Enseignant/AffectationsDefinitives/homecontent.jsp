<%@ page import="com.loginservice.login.models.CollecteBesoin" %>
<%@ page import="java.util.List" %>
<%@ page import="com.loginservice.login.models.Affectation" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

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
                <h5 class="card-title">Liste des Affectations</h5>
            </div>
            <div class="card-body">
                <p>Affectations Definitives</p>
                <table class="table">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Ressource</th>
                        <th>Enseignant</th>
                        <th>Departement</th>
                        <!-- Ajoutez d'autres colonnes au besoin -->
                    </tr>
                    </thead>
                    <tbody>
                    <% List<Affectation> listeAffectation = (List<Affectation>) request.getAttribute("listeAffectation");
                        for (Affectation affectation : listeAffectation) { %>
                    <tr>
                        <td><%= affectation.getId() %></td>
                        <td><%= affectation.getRessource().getType() +" "+ affectation.getRessource().getMarque()%></td>
                        <td><%= affectation.getEnseignant().getPersonne().getNom() +" "+ affectation.getEnseignant().getPersonne().getPrenom() %></td>
                        <td><%= affectation.getEnseignant().getDep().getNom() %></td>

                    </tr>
                    <% } %>
                    </tbody>
                </table>

            </div>
        </div>
    </main>
    <a href="#" class="theme-toggle">
        <i class="fa-regular fa-moon"></i>
        <i class="fa-regular fa-sun"></i>
    </a>
    <%@ include file="../../footer.jsp"%>
</div>