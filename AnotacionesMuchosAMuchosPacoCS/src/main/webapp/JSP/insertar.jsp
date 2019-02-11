<%-- 
    Document   : insertar
    Created on : 28 ene. 2019, 17:58:44
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
        <title>Insertar</title>
    </head>
    <body>
        <div id="principal">

            <center>
                <div class="contenedor">
                    <h2 class="me">Inserta los datos.</h2>
                </div>
            </center>
            <form method="post" action="Controlador?op=add">
                <center>
                    <table>
                        <tr>
                            <td>Nombre</td>
                            <td><input type="text" name="nombre" /></td>
                        </tr>
                        <tr>
                            <td>Módulo 1</td>
                            <td>
                                <select name="selectModulo1">
                                    <option value="vacio" default selected>Modulo</option>
                                    <c:forEach var="modulo" items="${listadoModulos}">
                                        <option value="${modulo.idModulo}">${modulo.nombreModulo}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td><input type="text" name="modulo1" /></td>
                        </tr>
                        <tr>
                            <td>Módulo 2</td>
                            <td>
                                <select name="selectModulo2">
                                    <option value="vacio" default selected>Modulo</option>
                                    <c:forEach var="modulo" items="${listadoModulos}">
                                        <option value="${modulo.idModulo}">${modulo.nombreModulo}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td><input type="text" name="modulo2" /></td>
                        </tr>
                        <tr>
                            <td>Módulo 3</td>
                            <td>
                                <select name="selectModulo3">
                                    <option value="vacio" default selected>Modulo</option>
                                    <c:forEach var="modulo" items="${listadoModulos}">
                                        <option value="${modulo.idModulo}">${modulo.nombreModulo}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td><input type="text" name="modulo3" /></td>
                        </tr>
                        <tr>
                            <td>Módulo 4</td>
                            <td>
                                <select name="selectModulo4">
                                    <option value="vacio" default selected>Modulo</option>
                                    <c:forEach var="modulo" items="${listadoModulos}">
                                        <option value="${modulo.idModulo}">${modulo.nombreModulo}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td><input type="text" name="modulo4" /></td>
                        </tr>
                        <tr>
                            <td>Módulo 5</td>
                            <td>
                                <select name="selectModulo5">
                                    <option value="vacio" default selected>Modulo</option>
                                    <c:forEach var="modulo" items="${listadoModulos}">
                                        <option value="${modulo.idModulo}">${modulo.nombreModulo}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td><input type="text" name="modulo5" /></td>
                        </tr>

                        <tr>
                            <td colspan="5"><input type="submit" name="enviar" value="Enviar" class="boton" /></td>
                        </tr>
                    </table>
                </center>
            </form>
            <center>
                <p><a href="${contexto}/index.jsp" class="enlace">Menú inicial</a></p>
            </center>
        </div>
    </body>
</html>
