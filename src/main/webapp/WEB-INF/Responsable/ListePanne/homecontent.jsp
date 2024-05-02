<%@ page import="java.util.List" %>
<%@ page import="com.loginservice.login.models.Panne" %>
<%@ page import="com.loginservice.login.models.Technicien" %>
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
                <h5 class="card-title">Gestion des Pannes</h5>
            </div>
            <div class="card-body">
                <p>Liste des pannes</p>
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Ressource en Panne</th>
                        <th>Enseignant</th>
                        <th>Affecter Technicien</th>
                        <!-- Ajoutez d'autres colonnes au besoin -->
                    </tr>
                    </thead>
                    <tbody>

                    <%
                        List<Panne> listePannes = (List<Panne>) request.getAttribute("listePannes");
                        for (Panne panne : listePannes) {
                    %>
                    <tr>
                        <td><%= panne.getId() %></td>
                        <td><%= panne.getAffectation().getRessource().getType() +" "+ panne.getAffectation().getRessource().getMarque() %></td>
                        <td><%= panne.getAffectation().getEnseignant().getPersonne().getNom() +" "+ panne.getAffectation().getEnseignant().getPersonne().getPrenom()%></td>
                        <td>
                            <button type="button" style="margin-left: 30px;width: 20%" class="btn btn-secondary" data-toggle="modal" data-target="#detailsModal_<%= panne.getId() %>">
                                <i class="fa-solid fa-person-circle-plus"></i>
                            </button>

                            <div class="modal fade" id="detailsModal_<%= panne.getId() %>" tabindex="-1" role="dialog" aria-labelledby="detailsModalLabel_<%= panne.getId() %>" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="detailsModalLabel_<%= panne.getId() %>">Gestiion des Pannes</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>

                                        <div class="modal-body">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5 class="card-title">Affecter Technicien</h5>
                                                </div>
                                                <div class="card-body">
                                                    <form id="affecterTechnicien" method="POST" action="affecterTechnicien">
                                                        <input type="hidden" name="idPanne" value="<%= panne.getId()%>">

                                                        <div class="form-group">
                                                            <label for="technicienId">Selectioner technicien :</label>
                                                            <select class="form-control" id="technicienId" name="technicienId" onchange="">
                                                                <%
                                                                    List<Technicien> listeTechnicien = (List<Technicien>) request.getAttribute("listeTechniciens");
                                                                    for (Technicien technicien : listeTechnicien) {
                                                                %>
                                                                    <option value="<%= technicien.getId() %>"><%= technicien.getPersonne().getNom() %></option>
                                                                <%
                                                                    }
                                                                %>
                                                            </select>
                                                        </div>

                                                        <button type="submit" class="btn btn-primary">Confirmer</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </td>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</div>
