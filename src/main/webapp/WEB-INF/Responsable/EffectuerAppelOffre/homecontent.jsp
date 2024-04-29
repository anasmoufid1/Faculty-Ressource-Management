<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<style>
    .form-group {
        display: flex;
        align-items: center;
    }

    .form-group label {
        margin-right: 10px;
    }

    .form-control {
        flex: 1;
    }

    #aujourdhui {
        margin-left: 10px;
        font-size: 12px;
    }
</style>
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
                <form action="EffctuerAppelOffre" method="POST">
                    <div class="form-group">
                        <label for="date_debut">Date de début :</label>
                        <input type="date" class="form-control" id="date_debut" name="date_debut">
                        <button type="button" class="btn btn-secondary" id="aujourdhui">Aujourd'hui</button>
                    </div>
                    <!-- Ajoutez de l'espace entre les champs -->
                    <div style="margin-top: 20px;"></div>
                    <div class="form-group">
                        <label for="date_expiration">Date d'expiration :</label>
                        <input type="date" class="form-control" id="date_expiration" name="date_expiration">
                    </div>
                    <!-- Déplacez le bouton "Enregistrer" à droite -->
                    <div style="text-align: right;margin-top: 20px;">
                        <button type="submit" class="btn btn-primary">Enregistrer</button>
                    </div>
                </form>
            </div>
        </div>

    </main>
    <a href="#" class="theme-toggle">
        <i class="fa-regular fa-moon"></i>
        <i class="fa-regular fa-sun"></i>
    </a>
    <%@ include file="/WEB-INF/footer.jsp"%>
</div>
<script>
    document.getElementById("aujourdhui").addEventListener("click", function() {
        var today = new Date().toISOString().split('T')[0];
        document.getElementById("date_debut").value = today;
    });
</script>
