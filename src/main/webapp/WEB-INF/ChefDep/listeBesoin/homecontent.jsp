<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.loginservice.login.models.Besoin" %>
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
                <h5 class="card-title">Liste des besoins</h5>
                <h6 class="card-subtitle text-muted"></h6>
            </div>
            <div class="card-body">
                <p>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Enseignant</th>
                                <th>Ressource</th>

                                <!-- Ajoutez d'autres colonnes au besoin -->
                            </tr>
                            </thead>
                            <tbody>

                            <%
                                List<Besoin> besoinlist = (List<com.loginservice.login.models.Besoin>) request.getAttribute("besoinlist");
                                for (com.loginservice.login.models.Besoin besoin : besoinlist) {
                            %>
                            <tr>
                                <td><%= besoin.getId() %></td>
                                <td><%= besoin.getEnseignant().getPersonne().getPrenom() + " " + besoin.getEnseignant().getPersonne().getNom()  %></td>
                                <td><%= besoin.getRessource().getMarque() %></td>

                                <!-- Ajoutez d'autres colonnes au besoin -->
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    <a href="EnseignantPerDepartement">
                        <button>
                            <div class="svg-wrapper-1">
                                <div class="svg-wrapper">
                                    <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            viewBox="0 0 24 24"
                                            width="24"
                                            height="24"
                                    >
                                        <path fill="none" d="M0 0h24v24H0z"></path>
                                        <path
                                                fill="currentColor"
                                                d="M1.946 9.315c-.522-.174-.527-.455.01-.634l19.087-6.362c.529-.176.832.12.684.638l-5.454 19.086c-.15.529-.455.547-.679.045L12 14l6-8-8 6-8.054-2.685z"
                                        ></path>
                                    </svg>
                                </div>
                            </div>
                            <span>envoyer</span>
                        </button>
                    </a>



                </p>
            </div>
        </div>
    </main>
    <a href="#" class="theme-toggle">
        <i class="fa-regular fa-moon"></i>
        <i class="fa-regular fa-sun"></i>
    </a>
    <%@ include file="/WEB-INF/footer.jsp"%>
</div>