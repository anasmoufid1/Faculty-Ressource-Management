<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.loginservice.login.models.*" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<div class="main">

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
                <h5 class="card-title">Vos Propositions</h5>
                <h6 class="card-subtitle text-muted">Vous trouverez dans cette page toutes les propositions que vous avez effectuees ainsi que les reponses</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Effectuee Le</th>
                            <th scope="col">Appel d'offre</th>
                            <th scope="col">Votre Proposition</th>
                            <th scope="col">Reponse</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% int i=1;
                            for(Proposition proposition : propositionList){%>
                        <tr>
                            <th scope="row"><%=i%></th>
                            <td><%=proposition.getFaiteLe()%></td>
                            <td>
                                <ul>
                                    <li>date debut : <%=proposition.getAppelOffre().getDateDebut()%></li>
                                    <li>date fin : <%=proposition.getAppelOffre().getDateFin()%></li>
                                </ul>
                            </td>
                            <td>
                                <%
                                    int ordinateurs = 0;
                                    int imprimantes = 0;
                                    for (Besoin besoin : proposition.getAppelOffre().getBesoins()) {
                                        if (besoin.getRessource().getType().equals("ordinateur")) {
                                            ordinateurs++;
                                        } else if (besoin.getRessource().getType().equals("imprimante")) {
                                            imprimantes++;
                                        }
                                    }%>

                                <button type="button" class="btn btn-outline-secondary" title="Voire details" data-bs-toggle="modal" data-bs-target="#details<%=proposition.getAppelOffre().getId()%>"><i class="fa-solid fa-circle-info"></i></button>


                                <div class="modal fade" id="details<%=proposition.getAppelOffre().getId()%>" tabindex="-1" aria-labelledby="detailsLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="detailsLabel">Votre Soumission</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                                <div class="modal-body">
                                                    <%if(ordinateurs!=0 && imprimantes!=0){%> <div class="row"><%}%>
                                                    <%if(imprimantes!=0){%><div class="col-md-6 border-end" ><%}%>
                                                        <%if(ordinateurs!=0){%><h2 class="fs-5">Ordinateurs</h2>
                                                        <%for(Besoin besoin : proposition.getAppelOffre().getBesoins()){
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
                                                            <% double prix = 0;
                                                                for(PrixBesoinProposition prixprop : proposition.getPrixDesBesoins()){
                                                                if(prixprop.getBesoin().getId()==besoin.getId()){
                                                                    prix=prixprop.getPrix();
                                                                }
                                                            }%>
                                                            <div class="card-footer">
                                                                <div class="input-group">
                                                                    <input type="number" class="form-control" id="itemPrice1"  value="<%=prix%>" aria-label="amount" readonly>
                                                                    <span class="input-group-text">Dhs</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%}}}%>
                                                        <%if(imprimantes!=0){%></div><%}%>
                                                    <%if(ordinateurs!=0){%><div class="col-md-6"><%}%>
                                                        <%if(imprimantes!=0){%><h2 class="fs-5">Imprimantes</h2>
                                                        <%for(Besoin besoin : proposition.getAppelOffre().getBesoins()){
                                                            if(besoin.getRessource().getType().equals("imprimante")){
                                                                Imprimante imprimante=besoin.getRessource().getImprimante();
                                                        %>
                                                        <div class="card">
                                                            <div class="card-header">
                                                                <h5 class="card-title">Marque: <%=besoin.getRessource().getMarque()%></h5>
                                                            </div>
                                                            <% double prix = 0;
                                                                for(PrixBesoinProposition prixprop : proposition.getPrixDesBesoins()){
                                                                    if(prixprop.getBesoin().getId()==besoin.getId()){
                                                                        prix=prixprop.getPrix();
                                                                    }
                                                                }%>
                                                            <div class="card-body">
                                                                <!-- Icone pour chaque composant -->
                                                                <ul class="list-group list-group-flush">
                                                                    <li class="list-group-item"><i class="fa-solid fa-print"></i> Resolution: <%=imprimante.getResolution()%></li>
                                                                    <li class="list-group-item"><i class="fa-solid fa-gauge-high"></i>Vitesse d'Impression : <%=imprimante.getVitesseImpression()%></li>
                                                                </ul>
                                                            </div>
                                                            <div class="card-footer">
                                                                <div class="input-group">
                                                                    <input type="number" class="form-control" id="itemPrice" value="<%=prix%>" aria-label="amount" readonly>
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
                                                        <input type="date" class="form-control" name="dateLivraison" aria-label="dateLivraison" value="<%=proposition.getDateLivraison()%>" readonly>
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text">Durée de garantie</span>
                                                        <input type="number" class="form-control" name="dureeGarantie" aria-label="dureeGarantie" min="1" step="1" value="<%=proposition.getDureeGarantille()%>" readonly>
                                                        <span class="input-group-text">mois</span>
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text">Totale</span>
                                                        <input type="text" class="form-control" id="totalInput" value="<%=proposition.getPrix()%>" aria-label="totalAmount" readonly>
                                                        <span class="input-group-text">Dhs</span>
                                                    </div>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <%if(proposition.getStatus()==1){%>
                                <span class="badge text-bg-success">acceptée</span>
                                <%}else if(proposition.getStatus()==2){ %>
                                <span class="badge text-bg-secondary">en cours</span>
                                <%}else{%>
                                <span class="badge text-bg-danger">refusée</span>
                                <%}%>
                            </td>
                        </tr>
                        </tbody>
                        <% i++;}%>
                    </table>
                </div>
            </div>
        </div>
    </main>

    <a href="#" class="theme-toggle">
        <i class="fa-regular fa-moon"></i>
        <i class="fa-regular fa-sun"></i>
    </a>
    <%@ include file="../../footer.jsp"%>
</div>