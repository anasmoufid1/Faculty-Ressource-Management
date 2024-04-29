<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.loginservice.login.models.Ressource" %>
<%@ page import="com.loginservice.login.models.Affectation" %>
<%@ page import="java.util.List" %>
<%@ page import="com.loginservice.login.models.Enseignant" %>
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
                <h5 class="card-title">Titre</h5>
                <h6 class="card-subtitle text-muted">sous titre</h6>
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Ressource</th>
                        <th colspan="2">Opérations</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% int i = 1; %>
                    <% List<Ressource> listRessourceDispo = (List<Ressource>) request.getAttribute("listRessourceDispo"); %>
                    <% for (Ressource ressource : listRessourceDispo) { %>
                    <tr>
                        <td><%= i %></td>
                        <td>
                            <a href="#" class="resource-link" data-toggle="modal" data-target="#resourceModal_<%= i %>"><%= ressource.getType() %></a>
                        </td>
                        <% if ("ordinateur".equals(ressource.getType())) { %>
                        <!-- Ordinateur Modal -->
                        <div class="modal fade" id="resourceModal_<%= i %>" tabindex="-1" role="dialog" aria-labelledby="resourceModalLabel_<%= i %>" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="resourceModalLabel_<%= i %>">Détails de l'ordinateur</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="cpu_<%= i %>">CPU :</label>
                                            <input type="text" class="form-control" id="cpu_<%= i %>" name="cpu_<%= i %>" value="<%=ressource.getOrdinateur().getCpu()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="disqueDur_<%= i %>">Disque Dur :</label>
                                            <input type="text" class="form-control" id="disqueDur_<%= i %>" name="disqueDur_<%= i %>" value="<%=ressource.getOrdinateur().getDisqueDure()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="ecran_<%= i %>">Ecran :</label>
                                            <input type="text" class="form-control" id="ecran_<%= i %>" name="ecran_<%= i %>" value="<%=ressource.getOrdinateur().getEcran()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="ram_<%= i %>">RAM :</label>
                                            <input type="text" class="form-control" id="ram_<%= i %>" name="ram_<%= i %>" value="<%=ressource.getOrdinateur().getRam()%>">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% } else { %>
                        <!-- Imprimante Modal -->
                        <div class="modal fade" id="resourceModal_<%= i %>" tabindex="-1" role="dialog" aria-labelledby="resourceModalLabel_<%= i %>" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="resourceModalLabel_<%= i %>">Détails de l'imprimante</h5>
                                        <button type="button" classe="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="resolution_<%= i %>">Resolution :</label>
                                            <input type="text" class="form-control" id="resolution_<%= i %>" name="resolution_<%= i %>" value="<%=ressource.getImprimante().getResolution()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="vitesseImpression_<%= i %>">Vitesse d'impression :</label>
                                            <input type="text" class="form-control" id="vitesseImpression_<%= i %>" name="vitesseImpression_<%= i %>" value="<%=ressource.getImprimante().getVitesseImpression()%>">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <td>
                            <!-- Actions pour les ressources -->
                            <a href="#" class="resource-action edit" style="color: blue" data-toggle="modal" data-target="#ResourceModal_<%= i %>"><i class="fa fa-edit"></i></a>


                            <% if ("ordinateur".equals(ressource.getType())) { %>
                            <!-- Ordinateur Modal -->
                            <div class="modal fade" id="ResourceModal_<%= i %>" tabindex="-1" role="dialog" aria-labelledby="resourceModalLabel_<%= i %>" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="resourceModalLabel_<%= i %>">Détails de l'ordinateur</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <!-- Formulaire pour la mise à jour de l'ordinateur -->
                                        <form action="/update-ordinateur" method="post">
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="cpu_<%= i %>">CPU :</label>
                                                    <input type="text" class="form-control" id="cpu_<%= i %>" name="cpu" value="<%=ressource.getOrdinateur().getCpu()%>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="disqueDur_<%= i %>">Disque Dur :</label>
                                                    <input type="text" class="form-control" id="disqueDur_<%= i %>" name="disqueDur" value="<%=ressource.getOrdinateur().getDisqueDure()%>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="ecran_<%= i %>">Ecran :</label>
                                                    <input type="text" class="form-control" id="ecran_<%= i %>" name="ecran" value="<%=ressource.getOrdinateur().getEcran()%>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="ram_<%= i %>">RAM :</label>
                                                    <input type="text" class="form-control" id="ram_<%= i %>" name="ram" value="<%=ressource.getOrdinateur().getRam()%>">
                                                    <input type="hidden" name="id" value="<%= ressource.getId() %>">
                                                </div>
                                            </div>
                                            <!-- Modal Footer avec le bouton Enregistrer -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                                                <button type="submit" class="btn btn-primary">Enregistrer</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <% } else { %>
                            <!-- Imprimante Modal -->
                            <div class="modal fade" id="ResourceModal_<%= i %>" tabindex="-1" role="dialog" aria-labelledby="resourceModalLabel_<%= i %>" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="resourceModalLabel_<%= i %>">Détails de l'imprimante</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <!-- Formulaire pour la mise à jour de l'imprimante -->
                                        <form action="/update-imprimante" method="post">
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="resolution_<%= i %>">Resolution :</label>
                                                    <input type="text" class="form-control" id="resolution_<%= i %>" name="resolution" value="<%=ressource.getImprimante().getResolution()%>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="vitesseImpression_<%= i %>">Vitesse d'impression :</label>
                                                    <input type="text" class="form-control" id="vitesseImpression_<%= i %>" name="vitesseImpression" value="<%=ressource.getImprimante().getVitesseImpression()%>">
                                                    <input type="hidden" name="id" value="<%= ressource.getId() %>">
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                                                <button type="submit" class="btn btn-primary">Enregistrer</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <% } %>

                            <a href="#" class="resource-action delete" style="color: red" data-toggle="modal" data-target="#deleteConfirmationModal"><i class="fa fa-trash"></i></a>
                            <!-- Ajout d'une modal de confirmation -->
                            <div class="modal fade" id="deleteConfirmationModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="deleteConfirmationModalLabel">Confirmation de la suppression</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form id="DeleteRessource" action="DeleteRessource" method="post">
                                            <div class="modal-body">
                                                Êtes-vous sûr de vouloir supprimer cette ressource ?
                                                <input type="hidden" name="id" id="deleteResourceId" value="<%= ressource.getId() %>">
                                                <input type="hidden" name="type" id="deleteResourceType" value="<%= ressource.getType() %>">
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                                                <button type="submit" class="btn btn-danger">Supprimer</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <a href="#" class="affectation-action edit" style="color: green"><i class="fa fa-edit"></i></a>
                            <a href="#" class="affectation-action delete" style="color: orange"><i class="fa fa-trash"></i></a>

                        </td>

                    </tr>
                    <% i++; %>
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
    <%@ include file="/WEB-INF/footer.jsp"%>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>