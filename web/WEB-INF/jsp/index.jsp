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

        <div id="map">
            <div id="order">
                <form action="<%= request.getContextPath()%>/order" method="post">

                    <p><b>Заказать курьера</b></p>
                    <input type="text" name="sender_name" placeholder="ФИО отправителя">
                    <input type="text" name="sender_address" id="start" class="route" placeholder="Адрес отправителя">
                    <input type="text" name="recipient_name" placeholder="ФИО получателя">
                    <input type="text" name="recipient_address" id="end" class="route" placeholder="Адрес получателя">

                    <label>Время отправления</label>
                    <input size="16" type="text" name="start_date" value="${dateTimeNow}" readonly id="date_start" class="form_datetime">
                    <label>Время прибытия</label>
                    <input size="16" type="text" name="stop_date" value="" id="date_stop" readonly>

                    <input type="submit" class="btn btn-primary" value="Сделать заказ" />
                    <c:choose>
                        <c:when test="${not empty authUser}">
                            <input type="hidden" name="user_id" value="${authUser.id}">
                        </c:when>
                        <c:otherwise>
                            <input type="hidden" name="user_id" value="null">
                        </c:otherwise>
                    </c:choose>
                    <input type="hidden" name="length" id="inputLength" value="">
                </form> 
            </div>

            <div id="orderOption">
                <p>Длинна пути: <b><span class="getLength"></span></b></p>
                <p>Время пути: <b><span class="getTime"></span></b></p>
            </div>
        </div>

        <div id="orderSearch" class="mydiv">
            <form action="<%= request.getContextPath()%>/order/searсh" class="form-search" method="post">
                Найти заказ:
                <input class="input-xxlarge" type="text" name="order_id" placeholder="Номер заказа">
                <button type="submit" class="btn">Найти</button>
            </form>
        </div>

        <jsp:include page="/WEB-INF/jsp/layout/footer.jsp"></jsp:include>

    </body>

</html>
