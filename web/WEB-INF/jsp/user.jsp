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

        <div class="mydiv">
            <div class="tabbable">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab1" data-toggle="tab">Ваш список заказов</a></li>
                    <li><a href="#tab2" data-toggle="tab">Настройки</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab1">
                        <table id="cabinet" class="table table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>ФИО отправителя</th>
                                    <th>ФИО получателя</th>
                                    <th>Адрес отправителя</th>
                                    <th>Адрес получателя</th>
                                    <th>Время отправления</th>
                                    <th>Время получения</th>
                                    <th>Курьер</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${orderList}">
                                    <c:choose>
                                        <c:when test="${order.courier_id=='0'}">
                                            <tr class="warning">
                                                <td>${order.id}</td>
                                                <td>${order.sender_name}</td>
                                                <td>${order.recipient_name}</td>
                                                <td>${order.sender_address}</td>
                                                <td>${order.recipient_address}</td>
                                                <td>${order.delivery_start_time}</td>
                                                <td>${order.delivery_stop_time}</td>
                                                <td>Неназначен</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr class="success">
                                                <td>${order.id}</td>
                                                <td>${order.sender_name}</td>
                                                <td>${order.recipient_name}</td>
                                                <td>${order.sender_address}</td>
                                                <td>${order.recipient_address}</td>
                                                <td>${order.delivery_start_time}</td>
                                                <td>${order.delivery_stop_time}</td>
                                                <td>Назначен</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane" id="tab2">
                        <form action="<%= request.getContextPath()%>/user/edit" method="post" class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Имя пользователя</label>
                                <div class="controls">
                                    <input type="text" name="name" placeholder="Имя пользователя" value="${authUser.name}">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Логин</label>
                                <div class="controls">
                                    <input type="text" name="login" placeholder="Логин" value="${authUser.login}">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" name='password' for="inputPassword">Новый пароль</label>
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
                                    <button type="submit" class="btn">Изменить</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>

</html>
