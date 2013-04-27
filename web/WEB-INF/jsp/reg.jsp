<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/jsp/layout/head.jsp"></jsp:include>
        </head>
        <body>
            <div id="login" class="mydiv">
                <p class="text-right"><a href="<%= request.getContextPath()%>">На главную</a></p>
            <h4>Зарегестрироваться в курьерской службе</h4>
            <form action="<%= request.getContextPath()%>/reg/add" method="post" class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">Имя пользователя</label>
                    <div class="controls">
                        <input type="text" name="name" placeholder="Имя пользователя">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Логин</label>
                    <div class="controls">
                        <input type="text" name="login" placeholder="Логин">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" name='password' for="inputPassword">Пароль</label>
                    <div class="controls">
                        <input type="password" name='password' placeholder="Пароль">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" name='re_password' for="inputPassword">Повторите пароль</label>
                    <div class="controls">
                        <input type="password" name='re_password' placeholder="Повторите пароль">
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button type="submit" class="btn">Зарегестрироваться</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
