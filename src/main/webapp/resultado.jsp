<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">

  <title>BOLETIM</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <link rel="shortcut icon" href="./icons/favicon.ico" type="image/x-icon">


</head>
<body>
<h1>BOLETIM ESCOLAR</h1>
<table border="1">
  <% List<String[]> processedData = (List<String[]>) session.getAttribute("processedData"); %>
  <% if (processedData != null) { %>
  <% for (String[] linha : processedData) { %>
  <tr>
    <% for (int colIndex = 0; colIndex < linha.length; colIndex++) { %>
    <% double valor = 0; %>


    <% if (colIndex > 2 && colIndex <4) { // Define as colunas para aplicar a formatação Média do primeiro Bimestre %>
    <% try { %>
    <% valor = Double.parseDouble(linha[colIndex].replace(",", ".")); %>
    <% } catch (NumberFormatException e) { %>
    <% /* Ignorar e manter o valor como 0 */ %>
    <% } %>
    <% } %>


    <% if (colIndex > 7 && colIndex <9) { // Define as colunas para aplicar a formatação da Média do segundo Bimestre %>
    <% try { %>
    <% valor = Double.parseDouble(linha[colIndex].replace(",", ".")); %>
    <% } catch (NumberFormatException e) { %>
    <% /* Ignorar e manter o valor como 0 */ %>
    <% } %>
    <% } %>


    <% if (colIndex > 12 && colIndex <14) { // Define as colunas para aplicar a formatação da Média do terceiro Bimestre  %>
    <% try { %>
    <% valor = Double.parseDouble(linha[colIndex].replace(",", ".")); %>
    <% } catch (NumberFormatException e) { %>
    <% /* Ignorar e manter o valor como 0 */ %>
    <% } %>
    <% } %>
    <%//  //%>


    <% if (colIndex > 17 && colIndex <19) { // Define as colunas para aplicar a formatação da Média do quarto Bimestre %>
    <% try { %>
    <% valor = Double.parseDouble(linha[colIndex].replace(",", ".")); %>
    <% } catch (NumberFormatException e) { %>
    <% /* Ignorar e manter o valor como 0 */ %>
    <% } %>
    <% } %>

    <td <%= valor > 0 && valor < 15 ? "style=\"color: red;\"" : "" %> ><%= linha[colIndex] %></td>
    <% } %>



  </tr>
  <% } %>
  <% } else { %>
  <tr>
    <td colspan="5">Nenhum resultado disponível</td>
  </tr>
  <% } %>
</table>

</body>
</html>
