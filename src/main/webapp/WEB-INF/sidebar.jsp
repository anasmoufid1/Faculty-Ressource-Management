<%@ page import="com.loginservice.login.models.Personne" %>
<%@ page import="com.loginservice.login.models.Fournisseur" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
	session = request.getSession();
    String role=(String)session.getAttribute("role");
    String nommm;
    String prenommm;
    if(role.equals("FOURNISSEUR")){
        Fournisseur fournisseur= (Fournisseur)session.getAttribute("fournisseur");
        nommm ="Société : ";
        prenommm = fournisseur.getCompanyName();
    }
    else{
        Personne prs = (Personne)session.getAttribute("personne");
        // Récupérer le nom d'utilisateur depuis la session
        nommm = prs.getNom();
        prenommm = prs.getPrenom();
    }

%>
        <aside id="sidebar" class="js-sidebar">
            <!-- Content For Sidebar -->
            <div class="h-100">
                <div class="sidebar-logo">
                    <a href="#"><%= nommm %> <%= prenommm %></a>
                </div>
                <ul class="sidebar-nav">
                    <li class="sidebar-header">
                        <%=role%>
                    </li>

                    <!-- ---------------------- RESPONSABLE --------------------------  -->
                    <%if (role.equals("RESPONSABLE")) {%>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">
                            <i class="fa-solid fa-list pe-2"></i>
                            Dashboard
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link collapsed" data-bs-target="#pages" data-bs-toggle="collapse"
                           aria-expanded="false"><i class="fa-solid fa-file-lines pe-2"></i>
                            Projets
                        </a>
                        <ul id="pages" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="#" class="sidebar-link">Afficher Projets</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="#" class="sidebar-link">Ajouter Projet</a>
                            </li>
                        </ul>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link collapsed" data-bs-target="#auth" data-bs-toggle="collapse"
                           aria-expanded="false"><i class="fa-regular fa-user pe-2"></i>
                            Profile
                        </a>
                        <ul id="auth" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="profile" class="sidebar-link">Paramétres du profile</a>
                            </li>

                        </ul>

                    </li>


                    <%}else if (role.equals("FOURNISSEUR")){%>
                    <!-- ---------------------- FOURNISSEUR --------------------------  -->

                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">
                            <i class="fa-solid fa-list pe-2"></i>
                            Dashboard
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link collapsed" data-bs-target="#pages" data-bs-toggle="collapse"
                           aria-expanded="false"><i class="fa-solid fa-file-lines pe-2"></i>
                            Appels d'offre
                        </a>
                        <ul id="pages" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="appelsoffre" class="sidebar-link">Consulter</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="soumissions" class="sidebar-link">Vos Soumissions</a>
                            </li>
                        </ul>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link collapsed" data-bs-target="#profile" data-bs-toggle="collapse"
                           aria-expanded="false"><i class="fa-regular fa-user pe-2"></i>
                            Profile
                        </a>
                        <ul id="profile" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="profile" class="sidebar-link">Paramétres du profile</a>
                            </li>

                        </ul>

                    </li>


                    <%}else if (role.equals("ENSEIGNANT")){%>
                    <!-- ---------------------- ENSEIGNANT  --------------------------  -->

                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link collapsed" data-bs-target="#auth" data-bs-toggle="collapse"
                           aria-expanded="false"><i class="fa-regular fa-user pe-2"></i>
                            Profile
                        </a>
                        <ul id="auth" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="profile" class="sidebar-link">Paramétres du profile</a>
                            </li>

                        </ul>

                    </li>



                    <%}else if (role.equals("TECHNICIEN")){%>
                    <!-- ---------------------- TECHNICIEN  --------------------------  -->


                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link collapsed" data-bs-target="#auth" data-bs-toggle="collapse"
                           aria-expanded="false"><i class="fa-regular fa-user pe-2"></i>
                            Profile
                        </a>
                        <ul id="auth" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="profile" class="sidebar-link">Paramétres du profile</a>
                            </li>

                        </ul>

                    </li>

                    <%}else if (role.equals("CHEFDEPARTEMENT")){%>
                    <!-- ---------------------- CHEF DEPARTEMENT  --------------------------  -->


                    <li class="sidebar-item">
                        <a href="EnseignantPerDepartement" class="sidebar-link">
                            <i class="fa-solid fa-list pe-2"></i>
                            Home
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link collapsed" data-bs-target="#pages" data-bs-toggle="collapse"
                           aria-expanded="false"><i class="fa-solid fa-file-lines pe-2"></i>
                            Besoins
                        </a>
                        <ul id="pages" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="Collecte_Besoin" class="sidebar-link">Collecte des besoins</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="ShowListBesoin" class="sidebar-link">Envoyer la liste des besoins au respoansable</a>
                            </li>
                        </ul>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link collapsed" data-bs-target="#auth" data-bs-toggle="collapse"
                           aria-expanded="false"><i class="fa-regular fa-user pe-2"></i>
                            Profile
                        </a>
                        <ul id="auth" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="Profile" class="sidebar-link">Paramétres du profile</a>
                            </li>

                        </ul>

                    </li>


                    <%}%>


                    <li class="sidebar-header">
                       <a href="logout"
									class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
									class="fas fa-power-off me-2"></i>Logout
								</a>
                    </li>
                    			
                    
                </ul>
            </div>
        </aside>
        
        <script>
        window.onload = function () {
            window.history.forward();
        };
    </script>
    <script>
    function toggleDropdown(event) {
        event.preventDefault();
        const dropdown = document.getElementById('projectsDropdown');
        if (dropdown.style.display === 'none') {
            dropdown.style.display = 'block';
        } else {
            dropdown.style.display = 'none';
        }
    }
</script>