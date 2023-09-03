<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Boletins.DataProcessor" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>

<html lang="pt-br">
<head>
    <title>BOLETIM</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="shortcut icon" href="./icons/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <style >
        img{border-radius: 30px;width:50%; padding: 5px;}
    </style>
</head>

<body bgcolor="#b888c9">

<img  src="icons/SIMADE33.png" >

<h1>BOLETIM ESCOLAR</h1>
<h1>Novo Ensino Médio 2023</h1>


<form action="index.jsp" method="post">
    <h3 >Informe seu número de Matrícula:</h3>
    <label for="targetCode" class="texto" ></label>
    <input type="text" id="targetCode" class="btn btn-green" name="targetCode" placeholder="DIGITE AQUI">
    <br>
    <br>
    <input type="submit" class="btn btn-green" value="Consultar Boletim">

</form>

<%
    DataProcessor dataProcessor = new DataProcessor();
    String filePath = "C:/Users/Administrador/IdeaProjects/Boletim/src/main/java/Boletins/BoletimAluno.txt"; // Substitua pelo caminho do seu arquivo
    String targetCode = request.getParameter("targetCode"); // Obtém o valor do usuário

    List<String[]> processedData = new ArrayList<>();
    boolean hasError = false;

    if (targetCode != null && !targetCode.isEmpty()) {
        processedData = dataProcessor.processFileAndGetData(filePath, targetCode);

        if (processedData.isEmpty()) {
            hasError = true;
        } else {
            // Armazena os dados na sessão
            session.setAttribute("processedData", processedData);

            // Redireciona para a página de resultados
            response.sendRedirect("resultado.jsp");
        }
    }
%>

<% if (hasError) { %>
<script>
    alert("Número de Matrícula não encontrado!!!");
</script>
<% } %>

</body>
<footer class="footer">
    <div class= "footer__container">
        <section>
            <h4 class="footer__title">Sobre:</h4>
            <h6 class="footer__about-text">
                Site criado para acesso ao BOLETIM ESCOLAR On-Line, por alunos, pais e ou
                responsáveis. Solicite ao seu Professor ou Secretaria da Escola, o seu NÚMERO DE MATRÍCULA .

            </h6>
        </section>
        <address>
            <h4 class="footer__title">Contato:</h4>
            <li><i class="fa-brands fa-connectdevelop" style="color: #068e85;"></i>Flávio Lehmann</li>
            <li><i class="fa-solid fa-envelope"></i> flavio.lehmann@educacao.mg.gov.br</li>
            <li><i class="fa-solid fa-phone"></i>(33) 99940-2121 (vivo)</li>
            <li><i class="fa-brands fa-whatsapp" style="color: #056107"></i>(27) 98809-1558 </li>
            <li><i class="fa-regular fa-copyright" style="color: #0b3275;"></i>Todos os direitos reservados!</li>
        </address>
    </div>
</footer>


</html>

