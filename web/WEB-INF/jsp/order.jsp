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
                <h2>Курьерская служба</h2>
            </div>
            <div class="span6 login">
                <c:choose>
                    <c:when test="${not empty authUser}">
                        <p>Здравствуйте, ${authUser.name}</p>
                        <a href="<%= request.getContextPath()%>/j_spring_security_logout" />Выйти</a>
                    </c:when>
                    <c:otherwise>
                        <p><a href="<%= request.getContextPath()%>/login">Войти</a> / <a href="<%= request.getContextPath()%>/registration">Регистрация</a></p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        ${sender_name}
        ${sender_address}
        ${recipient_name}
        ${recipient_address}
        ${start_date}
        ${stop_date}
        ${user_id}
        ${length}
    </body>

</html>
