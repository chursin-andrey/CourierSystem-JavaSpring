<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title}</title>

<link href="<%= request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="<%= request.getContextPath()%>/resources/css/datetimepicker.css" rel="stylesheet" type="text/css" />
<link href="<%= request.getContextPath()%>/resources/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery-1.9.1.min.js"></script>
<script src="http://api-maps.yandex.ru/2.0-stable/?load=package.full&lang=ru-RU" type="text/javascript"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/date.format.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/script.js"></script>