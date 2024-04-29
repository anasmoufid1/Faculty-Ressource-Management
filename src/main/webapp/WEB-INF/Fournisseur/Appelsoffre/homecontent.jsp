<%@ page import="java.util.Objects" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.loginservice.login.models.*" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<div class="main">
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>

    <nav class="navbar navbar-expand px-3 border-bottom">
        <button class="btn" id="sidebar-toggle" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>
        <% int newnotif=0;
            int cnt=0;
            for(Notification notification: fournisseurr.getNotificationList()){
                cnt++;
                if (!notification.isStatus()){
                    newnotif++;
                }
            }%>
        <div class="navbar-collapse navbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <div class="dropdown position-relative">
                        <!-- Bouton de notification -->
                        <button type="button" class="btn btn-primary notification-btn" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-bell"></i>
                            <%if(newnotif>0){%>
                            <span class="badge bg-danger"><%=newnotif%></span>
                            <%}%>
                        </button>

                        <!-- Carte de notifications -->
                        <div class="dropdown-menu dropdown-menu-end notification-card">
                            <!-- Contenu des notifications -->
                            <ul class="list-unstyled">
                                <%if(cnt>0){%>
                                <%
                                    for(Notification notification: fournisseurr.getNotificationList()){
                                        Date notificationDate = notification.getDate();
                                        long diffInMillis = new Date().getTime() - notificationDate.getTime();
                                        long diffMinutes = TimeUnit.MILLISECONDS.toMinutes(diffInMillis);
                                        long diffHours = TimeUnit.MILLISECONDS.toHours(diffInMillis);
                                        long diffDays = TimeUnit.MILLISECONDS.toDays(diffInMillis);
                                        String tempsEcoule = "";
                                        if (diffMinutes < 60) {
                                            tempsEcoule = "il y a " + diffMinutes + " min";
                                        } else if (diffHours < 24) {
                                            tempsEcoule = "il y a " + diffHours + " h";
                                        } else {
                                            tempsEcoule = "il y a " + diffDays + " j";
                                        }
                                %>
                                <li>
                                    <form action="/notification" method="post" id="notificationForm_<%=notification.getId()%>">
                                        <input type="hidden" name="notification" value="<%=notification.getId()%>">
                                        <a href="#" class="dropdown-item" onclick="document.getElementById('notificationForm_<%=notification.getId()%>').submit();">
                                            <%=notification.getMessage()%>
                                            <span class="notification-time"><%=tempsEcoule%></span>
                                        </a>
                                    </form>
                                </li>
                                <%}%>
                                <%}else{%>
                                <li>
                                    <a href="#" class="dropdown-item new-notification">
                                        <span class="notification-time">Aucunne Notification</span>
                                    </a>
                                </li>
                                <%}%>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <main class="content px-3 py-2">

        <!-- Table Element -->
        <div class="card border-0">
            <div class="card-header">
                <h5 class="card-title">Appels d'Offre</h5>
                <h6 class="card-subtitle text-muted">Veuillez trouver les appels d'offre efféctues récemment</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <% if (request.getParameter("success") != null && request.getParameter("success").equals("true")) { %>
                    <div class="alert alert-success alert-dismissible" role="alert">
                        Vous avez soumis votre proposition avec succès!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <% } %>
                    <% if (request.getParameter("success") != null && request.getParameter("success").equals("false")) { %>
                    <div class="alert alert-danger alert-dismissible" role="alert">
                        Veuillez vérifier les champs du prix!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <% } %>

                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Date Début</th>
                            <th>Date Fin</th>
                            <th>Ordinateurs</th>
                            <th>Imprimantes</th>
                            <th>Soumettre</th>
                            <!-- Ajoutez d'autres en-têtes de colonnes si nécessaire -->
                        </tr>
                        </thead>
                        <tbody>
                        <!-- Utilisez les balises scriptlet pour itérer sur la liste des appels d'offre -->
                        <% int i = 0;
                            int j=0;
                            for (AppelOffre appel : appelsoffre) { i++;
                                Date now = new Date();
                        if(appel.getDateFin().after(now) && appel.getDateDebut().before(now)){
                            j++;
                        %>
                        <tr>
                            <td><%= i %></td>
                            <td><%= appel.getDateDebut() %></td>
                            <td><%= appel.getDateFin() %></td>
                            <td>
                                <%
                                int ordinateurs = 0;
                                int imprimantes = 0;
                                for (Besoin besoin : appel.getBesoins()) {
                                    if (besoin.getRessource().getType().equals("ordinateur")) {
                                        ordinateurs++;
                                    } else if (besoin.getRessource().getType().equals("imprimante")) {
                                        imprimantes++;
                                    }
                                }
                                if (ordinateurs != 0) {
                            %>

                                <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#Ordinateur<%=appel.getId()%>">
                                            Details
                                </button>

                                <div class="modal fade" id="Ordinateur<%=appel.getId()%>" tabindex="-1" aria-labelledby="OrdinateurLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="OrdinateurLabel">Ordinateur(s) demande(s)</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <%for(Besoin besoin : appel.getBesoins()){
                                                if(besoin.getRessource().getType().equals("ordinateur")){
                                                    Ordinateur ordinateur=besoin.getRessource().getOrdinateur();
                                                %>
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5 class="card-title">Marque: <%=besoin.getRessource().getMarque()%></h5>
                                                    </div>
                                                    <div class="card-body">
                                                        <!-- Icone pour chaque composant -->
                                                        <ul class="list-group list-group-flush">
                                                            <li class="list-group-item"><i class="fas fa-microchip"></i> CPU: <%=ordinateur.getCpu()%></li>
                                                            <li class="list-group-item"><i class="fas fa-memory"></i> RAM: <%=ordinateur.getRam()%></li>
                                                            <li class="list-group-item"><i class="fas fa-hdd"></i> Disque dur: <%=ordinateur.getDisqueDure()%></li>
                                                            <li class="list-group-item"><i class="fas fa-desktop"></i> Écran: <%=ordinateur.getEcran()%></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <%}}%>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}else {%>
                                <span class="badge text-bg-secondary">Aucun</span>
                                <%}%>
                            </td>
                            <td>
                               <% if (imprimantes != 0) {
                                %>
                                <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#imrimentes<%=appel.getId()%>">
                                    Details
                                </button>

                                <div class="modal fade" id="imrimentes<%=appel.getId()%>" tabindex="-1" aria-labelledby="imrimentesLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="imrimentes">Imprimente(s) demandee(s)</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <%for(Besoin besoin : appel.getBesoins()){
                                                    if(besoin.getRessource().getType().equals("imprimante")){
                                                        Imprimante imprimante=besoin.getRessource().getImprimante();
                                                %>
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5 class="card-title">Marque: <%=besoin.getRessource().getMarque()%></h5>
                                                    </div>
                                                    <div class="card-body">
                                                        <!-- Icone pour chaque composant -->
                                                        <ul class="list-group list-group-flush">
                                                            <li class="list-group-item"><i class="fa-solid fa-print"></i> Resolution: <%=imprimante.getResolution()%></li>
                                                            <li class="list-group-item"><i class="fa-solid fa-gauge-high"></i>Vitesse d'Impression : <%=imprimante.getVitesseImpression()%></li>
                                                        </ul>
                                                    </div>
                                                    <%}}%>

                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}else{%>
                                <span class="badge rounded-pill text-bg-secondary">Aucunne</span>
                                <%}%>
                            </td>
                            <td>
                                <%

                                    boolean aPropose = false; // Défaut à false, le fournisseur n'a pas encore proposé
                                    List<Proposition> propositionList =appel.getPropositionList();
                                    for (Proposition proposition : propositionList) {
                                        if (Objects.equals(proposition.getAppelOffre().getId(), appel.getId()) && Objects.equals(proposition.getFournisseur().getId(), fournisseurr.getId())) {
                                            aPropose = true;
                                            break;
                                        }
                                    }
                                    if(aPropose){%>
                                <span class="badge text-bg-success">deja propose</span>
                                <%}else {%>

                                <button type="button" class="btn btn-outline-secondary" title="Soumettre Votre Proposition" data-bs-toggle="modal" data-bs-target="#Soumettre<%=appel.getId()%>"><i class="fas fa-file-alt"></i></button>


                                <div class="modal fade" id="Soumettre<%=appel.getId()%>" tabindex="-1" aria-labelledby="SoumettreLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="SoumettreLabel">Effectuer Votre Soumission</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <form id="myForm" action="Soummettre" method="post">
                                            <div class="modal-body">
                                                <%if(ordinateurs!=0 && imprimantes!=0){%> <div class="row"><%}%>
                            <%if(imprimantes!=0){%><div class="col-md-6 border-end" ><%}%>
                                                    <%if(ordinateurs!=0){%><h2 class="fs-5">Ordinateurs</h2>
                                                    <%for(Besoin besoin : appel.getBesoins()){
                                                        if(besoin.getRessource().getType().equals("ordinateur")){
                                                            Ordinateur ordinateur=besoin.getRessource().getOrdinateur();
                                                    %>
                                                        <div class="card">
                                                            <div class="card-header">
                                                                <h5 class="card-title">Marque: <%=besoin.getRessource().getMarque()%></h5>
                                                            </div>
                                                            <div class="card-body">
                                                                <!-- Icone pour chaque composant -->
                                                                <ul class="list-group list-group-flush">
                                                                    <li class="list-group-item"><i class="fas fa-microchip"></i> CPU: <%=ordinateur.getCpu()%></li>
                                                                    <li class="list-group-item"><i class="fas fa-memory"></i> RAM: <%=ordinateur.getRam()%></li>
                                                                    <li class="list-group-item"><i class="fas fa-hdd"></i> Disque dur: <%=ordinateur.getDisqueDure()%></li>
                                                                    <li class="list-group-item"><i class="fas fa-desktop"></i> Écran: <%=ordinateur.getEcran()%></li>
                                                                </ul>
                                                            </div>
                                                            <div class="card-footer">
                                                                <div class="input-group">
                                                                    <input type="number" class="form-control" id="itemPrice1" name="prixBesoin<%=besoin.getId()%>" aria-label="amount" required>
                                                                    <input type="hidden" name="idBesoin<%=besoin.getId()%>" value="<%=besoin.getId()%>">
                                                                    <span class="input-group-text">Dhs</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    <%}}}%>
                                                    <%if(imprimantes!=0){%></div><%}%>
                                                    <%if(ordinateurs!=0){%><div class="col-md-6"><%}%>
                                                    <%if(imprimantes!=0){%><h2 class="fs-5">Imprimantes</h2>
                                                    <%for(Besoin besoin : appel.getBesoins()){
                                                        if(besoin.getRessource().getType().equals("imprimante")){
                                                            Imprimante imprimante=besoin.getRessource().getImprimante();
                                                    %>
                                                        <div class="card">
                                                            <div class="card-header">
                                                                <h5 class="card-title">Marque: <%=besoin.getRessource().getMarque()%></h5>
                                                            </div>
                                                            <div class="card-body">
                                                                <!-- Icone pour chaque composant -->
                                                                <ul class="list-group list-group-flush">
                                                                    <li class="list-group-item"><i class="fa-solid fa-print"></i> Resolution: <%=imprimante.getResolution()%></li>
                                                                    <li class="list-group-item"><i class="fa-solid fa-gauge-high"></i>Vitesse d'Impression : <%=imprimante.getVitesseImpression()%></li>
                                                                </ul>
                                                            </div>
                                                            <div class="card-footer">
                                                                <div class="input-group">
                                                                    <input type="number" class="form-control" id="itemPrice" name="prixBesoin<%=besoin.getId()%>" aria-label="amount" required>
                                                                    <input type="hidden" name="idBesoin<%=besoin.getId()%>" value="<%=besoin.getId()%>">
                                                                    <span class="input-group-text">Dhs</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    <%}}}%>
                                                    <%if(ordinateurs!=0){%></div><%}%>
                                                </div>
                                                <%if(ordinateurs!=0 && imprimantes!=0){%></div><%}%>
                                                <div class="modal-footer">
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text">Date de livraison</span>
                                                        <input type="date" class="form-control" name="dateLivraison" aria-label="dateLivraison">
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text">Durée de garantie</span>
                                                        <input type="number" class="form-control" name="dureeGarantie" aria-label="dureeGarantie" min="1" step="1">
                                                        <span class="input-group-text">mois</span>
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text">Totale</span>
                                                        <input type="hidden" name="appelOffre" value="<%=appel.getId()%>">
                                                        <input type="hidden" name="fournisseur" value="<%=fournisseurr.getId()%>">
                                                        <input type="text" class="form-control" id="totalInput" name="totalPrice" aria-label="totalAmount" readonly>
                                                        <span class="input-group-text">Dhs</span>
                                                        <button class="btn btn-outline-success" type="submit" id="button-addon1" data-bs-dismiss="modal">Soumettre</button>
                                                    </div>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                                <%}%>
                            </td>


                        </tr>
                        <% }
                        }
                        if(j==0){%>
                        <tr>
                            <td colspan="6" class="text-center">Aucun appel d'offre à l'instant.</td>
                        </tr>

                        <%}%>
                        </tbody>
                    </table>


                </div>
            </div>
        </div>
        <script>
            // Cette fonction sera appelée lorsqu'un changement se produit dans les champs de prix
            function calculateTotal() {
                let totalPrice = 0;
                const priceInputs = document.querySelectorAll("[id^='itemPrice']");
                for (const input of priceInputs) {
                    totalPrice += parseFloat(input.value || 0); // Assurez-vous que les prix sont analysés en tant que nombres
                }
                document.getElementById("totalInput").value = totalPrice;
            }

            // Attachez le déclencheur à chaque champ de prix
            document.addEventListener("DOMContentLoaded", function() {
                const priceInputs = document.querySelectorAll("[id^='itemPrice']");
                for (const input of priceInputs) {
                    input.addEventListener("input", calculateTotal);
                }
            });
        </script>


    </main>
    <a href="#" class="theme-toggle">
        <i class="fa-regular fa-moon"></i>
        <i class="fa-regular fa-sun"></i>
    </a>
    <%@ include file="../../footer.jsp"%>
</div>
