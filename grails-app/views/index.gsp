<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>09:45 - 13/08/2015</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>Application Status</h1>
			<ul>
				<li>App version: <g:meta name="app.version"/></li>
				<li>Grails version: <g:meta name="app.grails.version"/></li>
				<li>Groovy version: ${GroovySystem.getVersion()}</li>
				<li>JVM version: ${System.getProperty('java.version')}</li>
				<li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
				<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
				<li>Domains: ${grailsApplication.domainClasses.size()}</li>
				<li>Services: ${grailsApplication.serviceClasses.size()}</li>
				<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
			</ul>
			<h1>Installed Plugins</h1>
			<ul>
				<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
					<li>${plugin.name} - ${plugin.version}</li>
				</g:each>
			</ul>
		</div>
		<div id="page-body" role="main">
			<h1>Tutorial 02</h1>
			
			<p>
				      Página criada em 11/08/15 com o objetivo de aprendizagem do framework Grails, linguem groovy,
				padrão de projeto MVC e outros conceitos relacionados.				  
			</p>
			<h1>Assunto inicial = VISÕES</h1>
			<p>
				      De acordo com o padrão MVC não deve haver controle nas visões, porém isso pode ser feito através
				do uso de scriptlets. Vamos a alguns exemplos:
			</p>
			<%
				//Declarando a variavel
				def data = new Date()
			 %>
			<h2> Ex1: Data e hora atual = <%= data %></h2>
			<h2> Ex2: Data e hora atraves de uma expressao groovy (sem scriptlet) = ${data}</h2>
			<h2> Ex3: Loops nas visões. Implementado na nossa segunda página de exemplos, conforme explicação será abaixo.</h2>
			<br>
			<p>
				   Conforme já comentado, o uso de scriptlet gera alguma polemica por misturar 
				   o controle nas visões. Vamos então criar um controlador chamado ExScriptlet que chamará
				   uma ou mais visoes com outros exemplos de scriptlet. <br>
				<br>
				   Quando eu crio o controlador o Grails automaticamente cria uma pasta de mesmo nome em "views". Ja na
				   classe do controlador o grails cria "def index() { }" (ação), isso significa que inicialmente o grails
				   vai procurar pelo index do controlador na pasta "views" quando o controlador for chamado. <br>
				   Está a ação padrão do controlador.<br>
				     Vamos então criar a Groovy Server Page (gsp) dentro da view do controlador que acabamos de fazer, 
				     A "index.gsp".				     
				     <br>
				     <br>
				     Para chamar o controlador basta digitar no navegador o endereco do site seguido de /Controlador, 
				     no nosso caso /ExScriptlet. 
			</p>
			<p>
				Vamos agora criar uma segunda visao para exemplos de scriptlet que sera chamada do mesmo controlador em uma 
				segunda "def" (ação).<br>
				Agora podemos chamar o segundo controlador com /ex2Scriptlet, correto? Nao!<br>
				Podemos usar /ExScriptlet direto pq a ação que esta sendo chamada é o index, no caso de outras, temos 
				que especificar o seu nome depois de outra "/", no nosso exemplo ficará "/ExScriptlet/Ex2Scriptlet".
				Perceba que temos agora um controlador chamado ExScriptlet com duas ações definidas, a pradão (index)
				e uma segunda chamada ex2Scriptlet. Poderíamos criar ainda outras ações de acordo com a necessidade.
			</p>
			<br>			
			<p>
				Mas voltando as visões, a partir deste ponto vou colocar os outros exemplos no arquivo "index.gsp". 
				Para ir para essa nossa segunda página, clique no link a seguir:
				<a href="ExScriptlet">LINK</a>. <br>
				<br>
				Note no codigo fonte, que no link acima eu usei o nome da minha app, uma "/" e o nome do 
				controlador. So pra exemplificar eu criarei abaixo um segundo link que aponta para a segunda
				ação do mesmo controlador. Veja que nesse segundo link eu coloquei 
				"/nome da app/controlador/acao". 
				<a href="/TutorialClaudio2/ExScriptlet/Ex2Scriptlet">LINK2</a>.
			</p>
			

			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>
		</div>
	</body>
</html>
