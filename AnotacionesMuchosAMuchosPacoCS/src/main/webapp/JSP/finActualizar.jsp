<%-- 
    Document   : finActualizar
    Created on : 28 ene. 2019, 17:59:19
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
        <title>Actualizar</title>
    </head>
    <body>
        <div id="principal">
            <center>
                <div class="contenedor">
                    <h2 class="me">Actualización de datos.</h2>
                </div>
            </center>
            <form method="post" action="Conclusion?op=update">
                <center>
                    <table>

                        <input type="hidden" name="id" value="${profesor.idProfesor}" readonly/>

                        <tr>
                            <td>Nombre</td>
                            <td><input type="text" name="nombre" value="${profesor.nombreProfesor}"/></td>
                        </tr>  
                        <c:forEach var="modulo" varStatus="contador" items="${profesor.modulos}">
                            <tr>
                            <input type="hidden" name="idmodulo${contador.index + 1}" value="${modulo.idModulo}"/>
                            <td>Modulo ${contador.index + 1}: </td>
                            <td><input type="text" name="modulo${contador.index + 1}" value="${modulo.nombreModulo}"/></td>
                            </tr>
                        </c:forEach>

                        <!--Este forEach añade campos vacios para insertar nuevos modulos, tantos como haga falta para llegas a 5-->
                        <c:forEach var="contador" begin="1" end="${5 - (profesor.modulos.size())}">		    
                            <tr>
                                <td>Modulo ${profesor.modulos.size()+contador}</td>
                                <td><input type="text" name="modulo${profesor.modulos.size()+contador}"/></td>
                            
                                <td>
                                    <select name="selectModulo${profesor.modulos.size()+contador}">
                                        <option value="vacio" default selected>Modulo</option>
                                        <c:forEach var="modulo" items="${listadoModulos}">
                                            <option value="${modulo.idModulo}">${modulo.nombreModulo}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                        </c:forEach>


                        <tr>
                            <td colspan="2"><input type="submit" name="enviar" value="Enviar" class="boton" /></td>
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
