<%@ page import="com.loginservice.login.models.PrixBesoinProposition" %>
<%@ page import="com.loginservice.login.models.Besoin" %>
<%@ page import="com.loginservice.login.models.Ordinateur" %>
<%@ page import="com.loginservice.login.models.Imprimante" %>
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
                <h5 class="card-title">Propositions</h5>
                <h6 class="card-subtitle text-muted">Propositions faites pour l'appel d'offre lancé entre le
                    <span class="text-secondary"><%=appelOffre.getDateDebut()%></span> et le <span class="text-secondary"><%=appelOffre.getDateFin()%></span></h6>
            </div>
            <div class="card-body">
                <%List<Proposition> propositionList=appelOffre.getPropositionList();%>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Fournisseur</th>
                            <th>Livrason Prevue le</th>
                            <th>Garantie</th>
                            <th>Prix Totale</th>
                            <th>Détails</th>
                            <th>Actions</th>
                            <!-- Ajoutez d'autres en-têtes de colonnes si nécessaire -->
                        </tr>
                        </thead>
                        <tbody>
                        <% int i=0;

                            boolean iscloture=false;
                            for(Proposition proposition:propositionList) {
                                if (proposition.getStatus()==1){
                                    iscloture=true;
                                    break;
                                }
                            }
                            for(Proposition proposition:propositionList) {
                            i++;
                        %>
                            <tr>
                                <td><%=i%></td>
                                <td><%=proposition.getFournisseur().getCompanyName()%></td>
                                <td><%=proposition.getDateLivraison()%></td>
                                <td><%=proposition.getDureeGarantille()%> mois</td>
                                <td><%=proposition.getPrix()%> Dhs</td>
                                <td>
                                    <button type="button" class="btn btn-outline-info" title="Plus de détails" data-bs-toggle="modal" data-bs-target="#details<%=proposition.getId()%>">
                                        <i class="fas fa-info-circle"></i>
                                    </button>
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
                                    <%for(PrixBesoinProposition prixBesoinProposition:proposition.getPrixDesBesoins()){%>

                                    <div class="modal fade" id="details<%=proposition.getId()%>" tabindex="-1" aria-labelledby="detailsLabel" aria-hidden="true">
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

                                            </div>
                                        </div>
                                    </div>


                                    <%}%>
                                </td>
                                <td><%if(proposition.getStatus()==1){%>
                                        <span class="badge rounded-pill text-bg-success mb-2">Accepté</span>
                                        <button type="button" class="btn btn-outline-success" title="Ressources Livrées" data-bs-toggle="modal" data-bs-target="#RessourcesLivrées">
                                            <i class="fas fa-truck"></i>
                                        </button>
                                    <div class="modal fade" id="RessourcesLivrées" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="RessourcesLivrées" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="RessourcesLivréesLbel">Confirmer l'Arrivage</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form method="post" action="/confirmer">
                                                        <input type="hidden" name="proposition" value="<%=proposition.getId()%>">
                                                        <p>La confirmation de l'arrivage entraîne la complétion de l'appel d'offre et par la suite le retirer définitivement.</p>
                                                        <p class="text-danger">Êtes-vous sûr de bien vouloir confirmer ?</p>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                                                    <button type="submit" class="btn btn-primary" id="btnConfirmer">Confirmer</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <%}else if (proposition.getStatus()==0){%>
                                    <span class="badge rounded-pill text-bg-danger">Eliminé</span>
                                <%}else {%>
                                    <%if(!iscloture){%>
                                    <button type="button" class="btn btn-outline-success" title="Accepter" data-bs-toggle="modal" data-bs-target="#Accepter<%=proposition.getId()%>">
                                        <i class="fas fa-check"></i>
                                    </button>
                                    <div class="modal fade" id="Accepter<%=proposition.getId()%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="Accepter<%=proposition.getId()%>" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="AccepterLabel">Accepter Proposition</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form method="post" action="/Accepter">
                                                    <div class="modal-body">
                                                        <input type="hidden" name="proposition" value="<%=proposition.getId()%>">
                                                        <p>L'acceptation d'une proposition entraine le refus de tous autres propositions. </p>
                                                        <p class="text-danger">Êtes-vous sûr de bien vouloir accepter ?</p>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                                                        <button type="submit" class="btn btn-success" id="btnAccepter">Confirmer</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <%}%>
                                    <button type="button" class="btn btn-outline-danger" title="Eliminer" data-bs-toggle="modal" data-bs-target="#Refuser<%=proposition.getId()%>">
                                        <i class="fas fa-times"></i>
                                    </button>
                                    <div class="modal fade" id="Refuser<%=proposition.getId()%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="Refuser<%=proposition.getId()%>" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="RefuserLabel">Refuser Proposition</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form method="post" action="/Refuser">
                                                <div class="modal-body">
                                                        <input type="hidden" name="proposition" value="<%=proposition.getId()%>">
                                                        <p>Le refus d'une proposition entraîne l'élimination du fournisseur concerné du processus de sélection et son ajout à la liste noire. </p>
                                                    <div class="form-group">
                                                        <label for="motif">Motif du refus:</label>
                                                        <textarea class="form-control" id="motif" name="motif" rows="3"></textarea>
                                                    </div><br>
                                                    <p class="text-danger">Êtes-vous sûr de bien vouloir refuser ?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                                                    <button type="submit" class="btn btn-danger" id="btnRefuser">Confirmer</button>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                               <%}%>

                                </td>
                            </tr>
                        <%}%>
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