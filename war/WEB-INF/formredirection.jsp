<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>Please wait...</title>
</head>
<body onload="document.forms['openid-form-redirection'].submit();">
    <form name="openid-form-redirection" action="${message.OPEndpoint}" method="post" accept-charset="utf-8">
        <c:forEach var="parameter" items="${message.parameterMap}">
        <input type="hidden" name="${parameter.key}" value="${parameter.value}"/>
        </c:forEach>
        <input type="hidden">Loading...</input>
    </form>
</body>
</html>
