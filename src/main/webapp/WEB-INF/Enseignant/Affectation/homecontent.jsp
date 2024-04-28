<%@ page import="com.loginservice.login.models.Affectation" %>
<%@ page import="java.util.List" %>
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
                <h5 class="card-title" style="text-align: center; margin-bottom: 30px;"></h5>
                <h6 class="card-subtitle text-muted"></h6>
            </div>

            <div class="card-body">

                <table class="table">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Ressource affectee</th>
                        <th>plus d'informations</th>
                        <!-- Ajoutez d'autres colonnes au besoin -->
                    </tr>
                    </thead>
                    <tbody>
                    <% int i = 1; %>
                    <% List<Affectation> listAffectation = (List<Affectation>) request.getAttribute("listAffectation"); %>
                    <% for (Affectation affectation : listAffectation) { %>
                    <tr>
                        <td><%= i %></td>
                        <td><%= affectation.getRessource().getMarque() %></td>
                        <!-- Ajoutez d'autres colonnes au besoin -->
                        <% if ("ordinateur".equals(affectation.getRessource().getType())) { %>
                        <td>
                            <!-- Ordinateur -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#expiredModal_<%= i %>"><i class="fa fa-edit" style="font-size:20px"></i></button>
                            <!-- Modal -->
                            <div class="modal fade" id="expiredModal_<%= i %>" tabindex="-1" role="dialog" aria-labelledby="expiredModalLabel_<%= i %>" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="expiredModalLabel_<%= i %>">Information!!</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="cpu_<%= i %>">CPU :</label>
                                                <input type="text" class="form-control" id="cpu_<%= i %>" name="cpu_<%= i %>" value="<%=affectation.getRessource().getOrdinateur().getCpu()%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="disqueDur_<%= i %>">Disque Dur :</label>
                                                <input type="text" class="form-control" id="disqueDur_<%= i %>" name="disqueDur_<%= i %>" value="<%=affectation.getRessource().getOrdinateur().getDisqueDure()%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="ecran_<%= i %>">Ecran :</label>
                                                <input type="text" class="form-control" id="ecran_<%= i %>" name="ecran_<%= i %>" value="<%=affectation.getRessource().getOrdinateur().getEcran()%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="ram_<%= i %>">RAM :</label>
                                                <input type="text" class="form-control" id="ram_<%= i %>" name="ram_<%= i %>" value="<%=affectation.getRessource().getOrdinateur().getRam()%>">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <% } else { %>
                        <!-- imprimante -->
                        <td>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#availableModal_<%= i %>"><i class="fa fa-edit" style="font-size:20px"></i></button>
                            <!-- Modal -->
                            <div class="modal fade" id="availableModal_<%= i %>" tabindex="-1" role="dialog" aria-labelledby="availableModalLabel_<%= i %>" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="availableModalLabel_<%= i %>">Information</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="resolution_<%= i %>">Resolution :</label>
                                                <input type="text" class="form-control" id="resolution_<%= i %>" name="resolution_<%= i %>" value="<%=affectation.getRessource().getImprimante().getResolution()%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="vitesseImpression_<%= i %>">Vitesse d'impression :</label>
                                                <input type="text" class="form-control" id="vitesseImpression_<%= i %>" name="vitesseImpression_<%= i %>" value="<%=affectation.getRessource().getImprimante().getVitesseImpression()%>">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <% } %>
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

