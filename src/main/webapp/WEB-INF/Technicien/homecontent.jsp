<%@ page import="com.loginservice.login.models.Panne" %>
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
                <h5 class="card-title">Service de Maintenence</h5>
            </div>
            <div class="card-body">
                <p>Liste des Pannes a Reparer </p>
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Enseignant</th>
                        <th>Ressource</th>
                        <th>Actions</th>
                        <!-- Ajoutez d'autres colonnes au besoin -->
                    </tr>
                    </thead>
                    <tbody>

                    <%
                        List<Panne> listPanne = (List<Panne>) request.getAttribute("listPanne");
                        for (Panne panne : listPanne) {
                    %>
                    <tr>
                        <td><%= panne.getId() %></td>
                        <td><%= panne.getAffectation().getEnseignant().getPersonne().getPrenom() + " " +panne.getAffectation().getEnseignant().getPersonne().getNom() %></td>
                        <td><%= panne.getAffectation().getRessource().getType()+ " " + panne.getAffectation().getRessource().getMarque()%></td>
                        <td>
                            <div class="d-flex">
                                <!-- Bouton pour supprimer la panne -->
                                <button type="button" class="btn btn-primary" style="margin-inline: 10px" data-toggle="modal" data-target="#expiredModal_<%= panne.getId() %>">
                                    <i class="fa fa-check" style="font-size:20px"></i>
                                </button>

                                <!-- Bouton pour rediger le constat -->
                                <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#availableModal_<%= panne.getId() %>">
                                    <i class="fa-solid fa-pen-to-square" style="font-size:20px"></i>
                                </button>
                            </div>

                            <div class="modal fade" id="expiredModal_<%= panne.getId() %>" tabindex="-1" role="dialog" aria-labelledby="expiredModalLabel_<%= panne.getId() %>" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="expiredModalLabel_<%= panne.getId() %>">Information!!</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <i class="fa-solid fa-question fa-2xl" style="color: #67baf9;"></i>
                                            Est ce que vous avez reparer la ressource?
                                        </div>
                                        <div class="modal-footer">
                                            <form id="supprimerPanne" method="POST" action="supprimerPanne" style="margin-inline: 10px">
                                                <input type="hidden" name="idPanne" value="<%= panne.getId()%>">
                                                <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#expiredModal_<%= panne.getId() %>">
                                                    Confirmer
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="availableModal_<%= panne.getId() %>" tabindex="-1" role="dialog" aria-labelledby="availableModal_<%= panne.getId() %>" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="availableModal_<%= panne.getId() %>">Rediger Constat</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="modal-body">
                                                <form id="redigerConstat" method="POST" action="redigerConstat">
                                                    <input type="hidden" name="idRessource" value="<%= panne.getAffectation().getRessource().getId()%>">
                                                    <input type="hidden" name="idPanne" value="<%= panne.getId()%>">
                                                    <div class="form-group">
                                                        <label for="dateApar">Date Apparition :</label>
                                                        <input type="date" class="form-control" id="dateApar" name="dateApart" >
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="frequence">Frequence :</label>
                                                        <select class="form-control" id="frequence" name="frequence" onchange="showFields()">
                                                            <option value="rare">Rare</option>
                                                            <option value="frequente">Frequente</option>
                                                            <option value="permanente">Permanente</option>
                                                        </select>
                                                    </div>
                                                    <% if (panne.getAffectation().getRessource().getType().equals("ordinateur")) { %>
                                                    <div class="form-group">
                                                        <label for="orderLog">Ordre :</label>
                                                        <select class="form-control" id="orderLog" name="orderLog">
                                                            <option value="materiel">Materiel</option>
                                                            <option value="Logiciel">Logiciel</option>
                                                        </select>
                                                    </div>
                                                    <% } else { %>
                                                    <div class="form-group">
                                                        <label for="orderLog">Ordre :</label>
                                                        <select class="form-control" id="orderLog" name="orderLog">
                                                            <option value="materiel">Materiel</option>
                                                        </select>
                                                    </div>
                                                    <% } %>
                                                    <div class="form-group">
                                                        <label for="descPanne">Description de la Panne :</label>
                                                        <textarea class="form-control" id="descPanne" name="descPanne"></textarea>
                                                    </div>

                                                    <button type="submit" class="btn btn-primary">Envoyer Constat</button>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-dismiss="modal">Fermer</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</div>