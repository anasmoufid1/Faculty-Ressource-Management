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
                <p style="text-decoration: underline;"></p>
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
                        List<Affectation> listAffectation = (List<Affectation>) request.getAttribute("listAffectation");
                        for (Affectation affectation : listAffectation) {
                    %>
                    <tr>
                        <td><%= affectation.getId() %></td>
                        <td><%= affectation.getEnseignant().getPersonne().getPrenom() + " " + affectation.getEnseignant().getPersonne().getNom() %></td>
                        <td><%= affectation.getRessource().getMarque()%></td>
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
</div>