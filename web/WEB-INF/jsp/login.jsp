<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/jsp/layout/head.jsp"></jsp:include>
        </head>
        <body>
            <div id="login" class="mydiv">
                <h4>Войти в курьерску службу</h4>
            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    Неверное имя пользователя или пароль
                </div>
            </c:if>
            <form action="<%= request.getContextPath()%>/<c:url value='j_spring_security_check' />" method="post" class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">Логин</label>
                    <div class="controls">
                        <input type="text" name='j_username' placeholder="Логин">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" name='j_password' for="inputPassword">Пароль</label>
                    <div class="controls">
                        <input type="password" name='j_password' placeholder="Пароль">
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button type="submit" class="btn">Войти</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
