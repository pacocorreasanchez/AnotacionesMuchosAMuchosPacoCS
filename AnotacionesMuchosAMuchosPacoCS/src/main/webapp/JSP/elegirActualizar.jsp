<%-- 
    Document   : elegirActualizar
    Created on : 28 ene. 2019, 17:57:07
    Author     : paco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="ROBOTS" content="NOARCHIVE"> 
        <meta name="generator" content="NetBeans"> 
        <meta name="referrer" content="always"> 
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="${estilos}" />
        <title>Elección de actualizar</title>
    </head>
    <body>
    <center>
        <div id="principal">

            <h2>Elige uno para modificar</h2>
            <c:if test = "${listadoProfesores == null || listadoProfesores.size() < 0}">
                <h1>No hay registros en la tabla</h1>
            </c:if>


            <form method="post" action="Controlador?op=update">
                <center>
                    <table>
                        <c:forEach var="item" items="${listadoProfesores}">
                            <tr>
                                <td><input type="radio" name="registro" value="${item.idProfesor}" /></td>
                                <td>${item.nombreProfesor}</td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="2"><input type="submit" value="Actualizar" class="boton" /></td>
                        </tr>
                    </table>
                </center>
            </form>
            <center>
                <p><a href="${contexto}/index.jsp" class="enlace">Menú inicial</a></p>
            </center>
        </div>
    </center>
</body>
</html>
