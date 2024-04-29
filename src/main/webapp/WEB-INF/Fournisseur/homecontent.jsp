<%@ page import="com.loginservice.login.models.Notification" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page import="java.util.Collections" %>
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
                                    List<Notification> notificationList=fournisseurr.getNotificationList();
                                    Collections.reverse(notificationList);
                                    for(Notification notification: notificationList){

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
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 col-md-6 d-flex">
                    <div class="card flex-fill border-0 illustration">
                        <div class="card-body p-0 d-flex flex-fill">
                            <div class="row g-0 w-100">
                                <div class="col-6">
                                    <div class="p-3 m-1">
                                        <h4><%=fournisseurr.getCompanyName().toUpperCase(java.util.Locale.ROOT)%></h4>
                                        <p class="mb-0">Admin Dashboard, CodzSword</p>
                                    </div>
                                </div>
                                <div class="col-6 align-self-end text-end">
                                    <img src="img/fournisseur.png" class="img-fluid illustration-img"
                                         alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 d-flex">
                    <div class="card flex-fill border-0">
                        <div class="card-body py-4">
                            <div class="d-flex align-items-start">
                                <div class="flex-grow-1">
                                    <h4 class="mb-2">
                                        $ 78.00
                                    </h4>
                                    <p class="mb-2">
                                        Total Earnings
                                    </p>
                                    <div class="mb-0">
                                                <span class="badge text-success me-2">
                                                    +9.0%
                                                </span>
                                        <span class="text-muted">
                                                    Since Last Month
                                                </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- Table Element -->
        <div class="card border-0">
            <div class="card-header">
                <h5 class="card-title">Titre</h5>
                <h6 class="card-subtitle text-muted">sous titre</h6>
            </div>
            <div class="card-body">
                <p>contenu</p>
            </div>
        </div>
    </main>
    <a href="#" class="theme-toggle">
        <i class="fa-regular fa-moon"></i>
        <i class="fa-regular fa-sun"></i>
    </a>
    <%@ include file="../footer.jsp"%>
</div>