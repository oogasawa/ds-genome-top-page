<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>


<div>
<h1>DS Text Search</h1>
<form action="/search" method="GET">
<input type="text" id="query" name="query" size="40" value="${query}" autofocus />
<input type="submit" value="submit" />
<input type="button" value="clear" onclick="document.getElementById('query').value=''" />

<br />
<input type="radio" name="case" value="insensitive" <c:if test="${regexMode == 'insensitive'}">checked</c:if> />Case insensitive
&nbsp;&nbsp;&nbsp;
<input type="radio" name="case" value="sensitive" <c:if test="${regexMode == 'sensitive'}">checked</c:if> />Case sensitive

</form>

<hr />

</div>