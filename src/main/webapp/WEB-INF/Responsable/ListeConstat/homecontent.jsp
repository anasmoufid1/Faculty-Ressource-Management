<%@ page import="com.loginservice.login.models.Constat" %>
<%@ page import="java.util.List" %>
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
                <h5 class="card-title">Gestion des constats</h5>
            </div>
            <div class="card-body">
                <p>Liste des Constats</p>
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Date Apparition de la constat</th>
                        <th>Technicien Affecte</th>
                        <th>Ressource en constat</th>
                        <th>Details</th>
                        <th>Reparer / Changer</th>
                        <!-- Ajoutez d'autres colonnes au besoin -->
                    </tr>
                    </thead>
                    <tbody>

                    <%
                        List<Constat> listeConstats = (List<Constat>) request.getAttribute("listeConstats");
                        for (Constat constat : listeConstats) {
                    %>
                    <tr>
                        <td><%= constat.getId() %></td>
                        <td><%= constat.getDateApparition() %></td>
                        <td><%= constat.getTechnicien().getPersonne().getNom() +" "+ constat.getTechnicien().getPersonne().getPrenom()%></td>
                        <td><%= constat.getPanne().getAffectation().getRessource().getType() +" "+ constat.getPanne().getAffectation().getRessource().getMarque()%></td>
                        <td>
                            <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#detailsModal_<%= constat.getId() %>">
                                <i class="fa-solid fa-circle-info"></i>
                            </button>

                            <div class="modal fade" id="detailsModal_<%= constat.getId() %>" tabindex="-1" role="dialog" aria-labelledby="detailsModalLabel_<%= constat.getId() %>" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="detailsModalLabel_<%= constat.getId() %>">Information Constat!!</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>

                                        <div class="modal-body">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5 class="card-title"><%=constat.getPanne().getAffectation().getRessource().getType() +" :"+ constat.getPanne().getAffectation().getRessource().getMarque()%></h5>
                                                </div>
                                                <div class="card-body">
                                                    <!-- Icone pour chaque composant -->
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item"><i class="fa-solid fa-clock"></i> Date: <%=constat.getDateApparition()%></li>
                                                        <li class="list-group-item"><i class="fa-solid fa-wave-square"></i>Frequence: <%=constat.getFrequence()%></li>
                                                        <li class="list-group-item"><i class="fas fa-desktop"></i> Ordre de la constat: <%=constat.getOrdre()%></li>
                                                        <li class="list-group-item"><i class="fa-solid fa-bars"></i>Description de la constat: <%=constat.getDescription()%></li>
                                                    </ul>
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

                        <td>
                            <button type="button" style="margin-left: 10px" class="btn btn-secondary" data-toggle="modal" data-target="#reparerRessource_<%= constat.getId() %>">
                                <i class="fa-solid fa-paper-plane"></i>
                            </button>

                            <div class="modal fade" id="reparerRessource_<%= constat.getId() %>" tabindex="-1" role="dialog" aria-labelledby="reparerRessourceLabel_<%= constat.getId() %>" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="reparerRessource_<%= constat.getId() %>">Information!!</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <i class="fa-solid fa-question fa-2xl" style="color: #67baf9;"></i>
                                            Vouller vous envoyer le constat et la demande de reparation au fournisseur ?
                                        </div>
                                        <div class="modal-footer">
                                            <form id="supprimerconstat" method="POST" action="supprimerconstat" style="margin-inline: 10px">
                                                <input type="hidden" name="idconstat" value="<%= constat.getId()%>">
                                                <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#reparerRessource_<%= constat.getId() %>">
                                                    Confirmer
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button type="button" style="margin-left: 10px" class="btn btn-secondary" data-toggle="modal" data-target="#changerRessource_<%= constat.getId() %>">
                                <i class="fa-solid fa-arrow-right-arrow-left"></i>
                            </button>

                            <div class="modal fade" id="changerRessource_<%= constat.getId() %>" tabindex="-1" role="dialog" aria-labelledby="changerRessourceLabel_<%= constat.getId() %>" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="changerRessource_<%= constat.getId() %>">Information!!</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <i class="fa-solid fa-question fa-2xl" style="color: #67baf9;"></i>
                                            Vouller vous envoyer le constat et la demande de changement au fournisseur ?
                                        </div>
                                        <div class="modal-footer">
                                            <form id="supprimerconstat" method="POST" action="supprimerconstat" style="margin-inline: 10px">
                                                <input type="hidden" name="idconstat" value="<%= constat.getId()%>">
                                                <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#reparerRessource_<%= constat.getId() %>">
                                                    Confirmer
                                                </button>
                                            </form>
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
