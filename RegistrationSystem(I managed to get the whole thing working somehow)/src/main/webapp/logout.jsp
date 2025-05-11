<%-- 
    Document   : logout
    Created on : 03 Mar 2025, 17:53:13
    Author     : reith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
