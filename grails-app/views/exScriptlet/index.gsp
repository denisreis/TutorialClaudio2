<html>
<head>
	<title>11/08/15</title>
</head>
<p>
	Continuação dos exemplos sobre as visões do MVC.<br>
	Este exemplo é interessante pq mostra como fazer a listagem do banco de dados.
</p>

<%--Exemplo de comentario, isso nao sera mostrado na página --%>
<h2>Ex3: Loops nas visões.</h2>
<u>Listagem de usuários cadastrados:</u><br>
<%
	/*Perceba que eu usei "nome do pacote/Nome controlador". Ou seja, a classe "Usuario" esta 
      dentro do pacote "tutorialclaudio2".*/
	def lista = tutorialclaudio2.Usuario.list()
	for (item in lista) {
 %> 
 	${item.nome}<br>
 <%
	}
 %>

</html>