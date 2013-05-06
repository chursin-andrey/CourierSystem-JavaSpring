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
                    <li class="active"><a href="#tab1" data-toggle="tab">Новые заказы</a></li>
                    <li><a href="#tab2" data-toggle="tab">Обработанные заказы</a></li>
                    <li><a href="#tab3" data-toggle="tab">Пользователи</a></li>
                    <li><a href="#tab4" data-toggle="tab">Курьеры</a></li>
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
                                <c:forEach var="order" items="${newOrderList}">
                                    <tr class="warning">
                                        <td>${order.id}</td>
                                        <td>${order.sender_name}</td>
                                        <td>${order.recipient_name}</td>
                                        <td>${order.sender_address}</td>
                                        <td>${order.recipient_address}</td>
                                        <td>${order.delivery_start_time}</td>
                                        <td>${order.delivery_stop_time}</td>
                                        <td>
                                           <form action="<%= request.getContextPath()%>/admin/edit" method="post">
                                               <input type="hidden" name="orderId" value="${order.id}" />
                                               <div class="input-append">
                                               <select style="width: 200px;"name="courierId">
                                                    <option disabled selected value="default">Выберите курьера</option>
                                                    <c:forEach var="courier" items="${courierList}">
                                                        <option value="${courier.id}">${courier.name}</option>
                                                    </c:forEach>
                                                </select>
                                                <button name="apply" class="btn" type="submit"><i class="icon-ok"></i></button>
                                                </div>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>        
                    </div>
                    
                    <div class="tab-pane" id="tab2">
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
                                <c:forEach var="order" items="${oldOrderList}">
                                    <tr class="success">
                                        <td>${order.id}</td>
                                        <td>${order.sender_name}</td>
                                        <td>${order.recipient_name}</td>
                                        <td>${order.sender_address}</td>
                                        <td>${order.recipient_address}</td>
                                        <td>${order.delivery_start_time}</td>
                                        <td>${order.delivery_stop_time}</td>
                                        <td>
                                            <c:forEach var="courier" items="${courierList}">
                                                <c:if test="${courier.id == order.courier_id}">
                                                      <c:out value="${courier.name}"/>
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane" id="tab3">
                        <table id="cabinet" class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Имя пользователя</th>
                                    <th>Логин</th>
                                    <th>Тип</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${userList}">
                                    <c:choose>
                                        <c:when test="${user.role_id=='1'}">
                                            <tr class="success">
                                                <td>${user.name}</td>
                                                <td>${user.login}</td>
                                                <td>Пользователь</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr class="warning">
                                                <td>${user.name}</td>
                                                <td>${user.login}</td>
                                                <td>Администратор</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane" id="tab4">
                        <div class="span4">
                            <c:forEach var="courier" items="${courierList}">
                                <ul>
                                    <li>${courier.name}</li>
                                </ul>
                            </c:forEach>
                        </div>
                        <div class="span8">                            
                            <form action="<%= request.getContextPath()%>/admin/add" method="post" class="form-horizontal">
                                <div class="control-group">
                                    <label class="control-label">Имя курьера</label>
                                    <div class="controls">
                                        <input type="text" name="name" placeholder="Имя курьера" >
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <button type="submit" class="btn">Добавить</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>

</html>
