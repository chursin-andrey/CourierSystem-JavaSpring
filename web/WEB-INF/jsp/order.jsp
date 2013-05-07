<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/jsp/layout/head.jsp"></jsp:include>
    </head>

    <body>

        <div id="header" class="row">
            <div class="span6 logo">
                <h2><a href="<%= request.getContextPath()%>">Курьерская служба</a></h2>
            </div>
            <div class="span6 login">
                <c:choose>
                    <c:when test="${not empty authUser}">
                        <p>Здравствуйте, ${authUser.name} <a href="<%= request.getContextPath()%>/j_spring_security_logout" />(Выйти)</a></p>
                        <c:choose>
                            <c:when test="${authUser.role_id=='1'}">
                                <a href="<%= request.getContextPath()%>/user"><strong>Профиль</strong></a>
                            </c:when>
                            <c:otherwise>
                                <a href="<%= request.getContextPath()%>/admin"><strong>Панель администратора</strong></a>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <p><a href="<%= request.getContextPath()%>/login">Войти</a> / <a href="<%= request.getContextPath()%>/reg">Регистрация</a></p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
       <c:choose>
            <c:when test='${no_matches_found == "null"}'>
                <div class="mydiv" >
                    <c:out value="${no_mathes_found}">К сожалению, заказ с введенным номером не существует</c:out>    
                </div>
            </c:when>
            <c:otherwise>
                <div class="mydiv" >
                <h4>Заказ №${order.id}</h4>
                <blockquote>
                <dl class="dl-horizontal">
                    <dt>Имя отправителя:</dt>
                    <dd>${order.sender_name}</dd>
                    <dt>Адрес отправителя:</dt>
                    <dd>${order.sender_address}</dd>
                    <dt>Имя получателя:</dt>
                    <dd>${order.recipient_name}</dd>
                    <dt>Адрес получателя:</dt>
                    <dd>${order.recipient_address}</dd>
                    <dt>Забрать до::</dt>
                    <dd>${order.delivery_start_time}</dd>
                    <dt>Доставить до:</dt>
                    <dd>${order.delivery_stop_time}</dd>
                </dl>
        
                <dl class="dl-horizontal">
                    <dt>Цена</dt>
                    <dd><p class="text-info">1150 р.</p></dd>
                </dl>
                </blockquote>
                <pre><p class="muted">Вы можете отслеживать статус заказа по этой ссылке: <a href="http://localhost:8080<%= request.getContextPath()%>/order/${order.id}">http://localhost:8080<%= request.getContextPath()%>/order/<c:out value="${order.id}" /></a></p></pre>
            </c:otherwise>
       </c:choose>
        </div>

    </body>

</html>
