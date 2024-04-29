<%@ page import="com.loginservice.login.models.Besoin" %>
<%@ page import="com.loginservice.login.models.Ordinateur" %>
<%@ page import="com.loginservice.login.models.Imprimante" %>
<%@ page import="com.loginservice.login.models.Proposition" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.Date" %>
<div class="main">
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>

    <nav class="navbar navbar-expand px-3 border-bottom">
        <button class="btn" id="sidebar-toggle" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>
    <main class="content px-3 py-2">

        <!-- Table Element -->
        <div class="card border-0">
            <div class="card-header">
                <h5 class="card-title">Appels d'Offre</h5>
                <h6 class="card-subtitle text-muted">Veuillez trouver ci-dessous les appels d'offre efféctues récemment</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                     <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Date Début</th>
                            <th>Date Fin</th>
                            <th>Ordinateurs</th>
                            <th>Imprimantes</th>
                            <th>Etat</th>
                            <th>Propositions</th>
                            <!-- Ajoutez d'autres en-têtes de colonnes si nécessaire -->
                        </tr>
                        </thead>
                        <tbody>
                        <!-- Utilisez les balises scriptlet pour itérer sur la liste des appels d'offre -->
                        <% int i = 0;
                            for (AppelOffre appel : appelsoffre) { i++;%>
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
                                    boolean isexpire=false;
                                    boolean isempty=false;
                                    boolean iscloture=false;
                                    Date dateActuelle = new Date();
                                    Date dateFin = appel.getDateFin();
                                    if (dateActuelle.after(dateFin)) {
                                        isexpire = true;
                                    }


                                    List<Proposition> propositionList=appel.getPropositionList();
                                    if(propositionList.isEmpty()){
                                        isempty=true;
                                    }
                                     for(Proposition proposition : propositionList){
                                            if (proposition.getStatus() == 1) {
                                                iscloture = true;
                                                break;
                                            }
                                    }
                                if(iscloture){
                                %>
                                <span class="badge rounded-pill text-bg-success">Cloturé</span>
                                <%} else if (isexpire) {%>
                                <span class="badge rounded-pill text-bg-danger">Expiré</span>
                                <%}else{%>
                                <span class="badge rounded-pill text-bg-secondary">En Cours</span>
                                <%}%>
                            </td>

                            <td>
                                <%if(!isempty){%>
                                <a href="appelpropositions/<%= appel.getId() %>" class="btn btn-outline-secondary" title="Afficher Les propositions">
                                    <i class="fas fa-file-alt"></i>
                                </a>
                                 <%}else{%>
                                    <span class="badge rounded-pill text-bg-secondary">Aucunne</span>
                                <%}%>
                            </td>


                        </tr>
                        <% } %>
                        </tbody>
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
