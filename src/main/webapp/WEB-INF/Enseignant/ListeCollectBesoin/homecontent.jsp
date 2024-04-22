<%@ page import="com.loginservice.login.models.CollecteBesoin" %>
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
                <h5 class="card-title">Titre</h5>
                <h6 class="card-subtitle text-muted">sous titre</h6>
            </div>
            <div class="card-body">
                <p>contenu</p>
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Date de la demande</th>
                        <th>Date de l'expiration</th>
                        <th>Operation</th>

                        <!-- Ajoutez d'autres colonnes au besoin -->
                    </tr>
                    </thead>
                    <tbody>

                    <%
                        List<CollecteBesoin> listB = (List<CollecteBesoin>) request.getAttribute("listB");
                        for (CollecteBesoin besoin : listB) {
                    %>
                    <tr>
                        <td><%= besoin.getId() %></td>
                        <td><%= besoin.getDateDemande() %></td>
                        <td><%= besoin.getDateExpiration() %></td>
                        <td>
                            <% if (besoin.getDateExpiration().before(new java.util.Date())) { %>
                            <!-- Si la date d'expiration est passée -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#expiredModal_<%= besoin.getId() %>"><i class="fa fa-edit" style="font-size:20px"></i> </button>
                            <!-- Modal -->
                            <div class="modal fade" id="expiredModal_<%= besoin.getId() %>" tabindex="-1" role="dialog" aria-labelledby="expiredModalLabel_<%= besoin.getId() %>" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="expiredModalLabel_<%= besoin.getId() %>">Information!!</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Cette demande de collecte de besoin n'est plus disponible.
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% } else { %>
                            <!-- Si la date d'expiration n'est pas encore passée -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#availableModal_<%= besoin.getId() %>"><i class="fa fa-edit" style="font-size:20px"></i></button>
                            <!-- Modal -->
                            <div class="modal fade" id="availableModal_<%= besoin.getId() %>" tabindex="-1" role="dialog" aria-labelledby="availableModalLabel_<%= besoin.getId() %>" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="availableModalLabel_<%= besoin.getId() %>">Information</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="modal-body">
                                                <form id="resourceForm" method="POST" action="EffectuerDemande">
                                                    <div class="form-group">
                                                        <label for="resourceType">Choisir le type de ressource :</label>
                                                        <select class="form-control" id="resourceType" name="type" onchange="showFields()">
                                                            <option value="ordinateur">Ordinateur</option>
                                                            <option value="imprimante">Imprimante</option>
                                                        </select>
                                                    </div>

                                                        <!-- Champs pour l'ordinateur -->
                                                        <div class="form-group">
                                                            <label for="marque">Marque :</label>
                                                            <input type="text" class="form-control" id="marque" name="marque">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="num_inventaire">Numero d'inventaire :</label>
                                                            <input type="text" class="form-control" id="num_inventaire" name="num_inventaire">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="prix">Prix :</label>
                                                            <input type="number" class="form-control" id="prix" name="prix">
                                                        </div>
                                                    <div id="ordinateurFields" style="display:none;">
                                                        <div class="form-group">
                                                            <label for="cpu_ordi">CPU :</label>
                                                            <input type="text" class="form-control" id="cpu_ordi" name="cpu_ordi">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="disque_dure_ordi">Disque Dur :</label>
                                                            <input type="text" class="form-control" id="disque_dure_ordi" name="disque_dure_ordi">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="ecran_ordi">Ecran :</label>
                                                            <input type="text" class="form-control" id="ecran_ordi" name="ecran_ordi">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="ram_ordi">RAM :</label>
                                                            <input type="text" class="form-control" id="ram_ordi" name="ram_ordi">!-- Champ caché pour le type -->

                                                        </div>
                                                        <input type="hidden" id="type_ord" name="type1" value="ordinateur">
                                                    </div>
                                                    <div id="imprimanteFields" style="display:none;">
                                                        <div class="form-group">
                                                            <label for="resolution_imp">Resolution :</label>
                                                            <input type="text" class="form-control" id="resolution_imp" name="resolution_imp">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="vitesse_impression_imp">Vitesse d'impression :</label>
                                                            <input type="text" class="form-control" id="vitesse_impression_imp" name="vitesse_impression_imp">
                                                        </div>
                                                        <input type="hidden" id="type_imp" name="type2" value="imprimante">
                                                        <input type="hidden" name="besoinId" value="<%= besoin.getId()%>">
                                                    </div>


                                                    <button type="submit" class="btn btn-primary">Valider</button>
                                                </form>
                                            </div>


                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </td>
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
    <%@ include file="/WEB-INF/footer.jsp"%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <script>
        function showFields() {
            var resourceType = document.querySelectorAll("#resourceType").value;
            var ordinateurFields = document.querySelectorAll("#ordinateurFields");
            var imprimanteFields = document.querySelectorAll("#imprimanteFields");

            // Afficher les champs pour l'ordinateur si "ordinateur" est sélectionné
            if (resourceType === "ordinateur") {
                ordinateurFields.style.display = "block";
                imprimanteFields.style.display = "none"; // Masquer les champs pour l'imprimante
            }
            // Afficher les champs pour l'imprimante si "imprimante" est sélectionné
            else if (resourceType === "imprimante") {
                ordinateurFields.style.display = "none"; // Masquer les champs pour l'ordinateur
                imprimanteFields.style.display = "block";
            }
            // Si aucun type n'est sélectionné, masquer tous les champs
            else {
                ordinateurFields.style.display = "none";
                imprimanteFields.style.display = "none";
            }
        }


    </script>

</div>