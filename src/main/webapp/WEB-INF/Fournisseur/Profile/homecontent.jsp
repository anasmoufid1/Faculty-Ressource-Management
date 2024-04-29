<%@ page import="com.loginservice.login.models.Notification" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
        <!-- Profil Card -->
        <div class="card border-0">
            <div class="card-header">
                <h5 class="card-title">Details de Votre Profil</h5>
                <h6 class="card-subtitle text-muted">Dans cette section, vous pouvez modifier votre mot de passe.</h6>
            </div>
            <div class="card-body">

                <%if(request.getParameter("success")!=null && request.getParameter("success").equals("true")){%>
                <div class="alert alert-success alert-dismissible" role="alert">
                    Vous avez modifier votre mot de passe avec succes!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%}%>
                <%if(request.getParameter("success")!=null && request.getParameter("success").equals("false")){%>
                <div class="alert alert-danger alert-dismissible" role="alert">
                    Votre mot de passe n'a pas ete modifie!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%}%>
                <%if(fournisseurr.isEstListeNoire()){%>
                <div class="alert alert-danger" role="alert">
                    Votre Compte est bloque a cause de fraudes des <a href="#" class="alert-link">termes d'utilisation</a>.
                </div>
                <%}%>

                <!-- Informations du Profil et Modification de Mot de Passe -->
                <div class="row align-items-center justify-content-center">
                    <!-- Informations du Profil -->
                    <div class="col-md-6 border-end">
                        <div class="row">
                            <!-- Image de Profil -->
                            <div class="col-md-4 text-center">
                                <img src="img/fournisseur.png" class="img-fluid rounded-circle border-secondary" style="width: 150px; height: 150px;" alt="Image de Profil">
                            </div>
                            <!-- Détails du Profil -->
                            <div class="col-md-8">
                                <h3 class="text-secondary"><%=fournisseurr.getCompanyName().toUpperCase(java.util.Locale.ROOT)%></h3>
                                <p><strong>Nom d'utulisateur :</strong> <%=fournisseurr.getUser().getUsername()%></p>
                                <%if(fournisseurr.getAdresse()!=null){%>
                                    <p><strong>Adresse :</strong> <%=fournisseurr.getAdresse()%></p>
                                    <p><strong>Nom du Gerant :</strong> <%=fournisseurr.getGerantName()%></p>
                                    <p><strong>Site Internet :</strong> <a href="<%=fournisseurr.getSiteInternet()%>"><%=fournisseurr.getSiteInternet()%></a></p>
                                <%}%>
                                <!-- Ajoutez d'autres informations ici -->
                            </div>
                        </div>
                    </div>
                    <!-- Modification de Mot de Passe -->
                    <div class="col-md-6">
                        <h3 class="text-secondary">Modifier Mot de Passe</h3>
                        <!-- Formulaire de Modification de Mot de Passe -->
                        <form method="post" action="changepass">
                            <div class="form-group">
                                <label for="currentPassword">Mot de passe actuel</label>
                                <input type="password" class="form-control <%if(erreur!=null && erreur.equals("currentpass")){%>border-danger<%}%>" id="currentPassword" name="currentPassword" required>
                                <% if(erreur != null && erreur.equals("currentpass")) { %>
                                    <p class="text-danger">Mot de passe actuel incorrecte</p>
                                <% } %>
                            </div>
                            <div class="form-group">
                                <label for="newPassword">Nouveau mot de passe</label>
                                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                            </div>
                            <div class="form-group">
                                <label for="confirmPassword">Confirmer le nouveau mot de passe</label>
                                <input type="password" class="form-control <%if(erreur!=null && erreur.equals("newpass")){%>border-danger<%}%>" id="confirmPassword" name="confirmPassword" required>
                                <% if(erreur != null && erreur.equals("newpass")) { %>
                                <p class="text-danger">Confirmation du mot de passe incorrecte </p>
                                <% } %>
                            </div>
                            <div class="form-group mt-3"> <!-- Ajout de la classe mt-3 pour créer une marge top -->
                                <button type="submit" class="btn btn-outline-secondary">Modifier</button>
                            </div>
                        </form>

                    </div>
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