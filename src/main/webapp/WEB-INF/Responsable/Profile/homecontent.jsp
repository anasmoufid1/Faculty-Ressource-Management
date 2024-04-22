<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="main">

    <nav class="navbar navbar-expand px-3 border-bottom">
        <button class="btn" id="sidebar-toggle" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>
    <main class="content px-3 py-2">
        <!-- Profil Card -->
        <div class="card border-0">
            <div class="card-header">
                <h5 class="card-title">Details de Votre Profil</h5>
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

            </div>
            <div class="card-body">
                <!-- Informations du Profil et Modification de Mot de Passe -->
                <div class="row align-items-center justify-content-center">
                    <!-- Informations du Profil -->
                    <div class="col-md-6 border-end">
                        <div class="row">
                            <!-- Image de Profil -->
                            <div class="col-md-4 text-center">
                                <img src="img/responsable.png" class="img-fluid rounded-circle border-secondary" style="width: 150px; height: 150px;" alt="Image de Profil">
                            </div>
                            <!-- Détails du Profil -->
                            <div class="col-md-8">
                                <h3 class="text-secondary"><%=responsable.getPersonne().getNom()+" "+responsable.getPersonne().getPrenom()%></h3>
                                <p><strong>Nom d'utulisateur :</strong> <%=responsable.getUser().getUsername()%></p>
                                <p><strong>Adresse :</strong> <%=responsable.getPersonne().getAdresse()%></p>
                                <p><strong>Email :</strong> <%=responsable.getPersonne().getEmail()%></p>
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