# Desafio Base2 Automação Selenium WebDriver em Java

Projeto da empresa Base2 Tecnologia para os funcionários aprenderem e testarem seus conhecimentos de automação.

A aplicação a ser automatiada será o mantis.

<p align="center">
	<img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava">
	<img alt="GitHub" src="https://img.shields.io/github/license/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava">
	<img alt="GitHub language count" src="https://img.shields.io/github/languages/count/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava">
</p>

<p align="center">
	<a href="#Desafio Parte1">Desafio parte 1</a> •
	<a href="#Desafio Parte2">Desafio parte 2</a> •
	<a href="#Desafio Parte3">Desafio parte 3</a>
</p>
<p align="center">
	<a href="#Andamento do desafio">Andamento do desafio</a> •
	<a href="#Funcionalidades automatizadas">Funcionalidades automatizadas</a>
</p>
<p align="center">
	<a href="#Extras">Extras</a> •
	<a href="#Dúvidas">Dúvidas</a> •
	<a href="#Licença">Licença</a> •
	<a href="#Autor">Autor</a> •
	<a href="#Bibliografia">Bibliografia</a>
</p>

#### Desafio parte 1

1. Implementar 50 scripts de testes que manipulem uma aplicação web (sugestões: Mantis ou TestLink) com Page Objects.
2. Alguns scripts devem ler dados de uma planilha Excel para implementar Data-Driven.
Quem utilizar Cucumber, SpecFlow ou outra ferramenta de BDD não precisa implementar lendo de uma planilha Excel. Pode ser a implementação de um Scenario Outline.
3. Notem que 50 scripts podem cobrir mais de 50 casos de testes se usarmos Data-Driven. Em outras palavras, implementar 50 CTs usando data-driven não é a mesma coisa que implementar 50 scripts.
4. Os casos de testes precisam ser executados em no mínimo três navegadores. Utilizando o Selenium Grid.
Não é necessário executar em paralelo. Pode ser demonstrada a execução dos browsers separadamente.
Não é uma boa prática executar os testes em todos os browsers em uma única execução. A melhor forma é controlar o browser através de um arquivo de configuração.
Java: normalmente utiliza-se a classe Properties e cria-se um arquivo chamado environment.properties.

#### Desafio parte 2

5. Gravar screenshots ou vídeo automaticamente dos casos de testes.
6. O projeto deverá gerar um relatório de testes automaticamente com screenshots ou vídeos embutidos. Sugestões: Allure Report ou ExtentReport.
7. A massa de testes deve ser preparada neste projeto, seja com scripts carregando massa nova no BD ou com restore de banco de dados.

#### Desafio parte 3

8. Um dos scripts deve injetar Javascript para executar alguma operação na tela. O objetivo aqui é exercitar a injeção de Javascript dentro do código do Selenium.
Sugestão: fazer o login usando Javascript ao invés do código do Selenium.
9. Testes deverão ser agendados pelo Jenkins, CircleCI, TFS, TeamCity ou outra ferramenta de CI que preferir.

#### Andamento do desafio

| Item Desafio   | Status do projeto |
| -------------- | ----------------- |
| Nº 1           | Em andamento      |
| Nº 2           | Em Andamento 	 |
| Nº 3           | Em andamento      |
| Nº 4           | Em andamento      |
| Nº 5           | Em andamento      |
| Nº 6           | Em andamento      |
| Nº 7           | Não Iniciado      |
| Nº 8           | Não Iniciado      |
| Nº 9           | Não Iniciado      |

#### Funcionalidades automatizadas

Serão automatizadas xx funcionalidades divididas nas seguintes telas.

- Tela Criar Tarefa - 8
	- createIssueWithAllCompleteFields
	- createIssueWithRequiredFields
	- validateFieldRequiredDescription
	- validateFieldRequiredSummary
	- validateFieldRequiredCategory
	- createIssueDuplicated
	- validateAssignUserIssue
	- validateSizeAttachedFile
- LoginTest - 6
    - efetuarLoginComSucesso
	- efetuarLoginComSenhaErrada
	- efetuarLoginComUsuarioNulo
	- perdeuSuaSenha
	- efetuarLoginComSucessoSenhaRetornadaDoDB
	- efetuarLoginComSucessoDataDriven
- Tela Minha Conta - 8
	- acessarMinhaConta
	- atualizarSenha
	- atualizarEmail
	- acessarPaginaMinhaVisao
	- acessarPaginaVerTarefas
	- acessarPaginaCriarTarefas
	- acessarPaginaGerenciar
	- efetuarLogout
- Tela Minha Visão - 2
	- existeTarefaRelatadaPorMim
	- existeBotaoVerTarefas
- Tela Ver Tarefas - 18
	- apagarMarcador
	- resolverTarefa
	- alterarGravidadeTarefa
	- alterarStatusRetornoDaTarefa
	- alterarStatusAtribuidoDaTarefa
	- alterarStatusAdmitidoDaTarefa
	- alterarStatusResolvidoDaTarefa
	- alterarStatusFechadoDaTarefa
	- alterarPrioridadeDaTarefa
	- moverTarefa
	- copiarTarefa
	- TestCaseAtribuirTarefa
	- TestCaseApagarTarefa
	- fecharTarefa
	- validarAcessoTelaVerTarefas
	- pesquisarTarefasInexistentes
	- pesquisarTarefasExistentes
	- validarExclusaoTotalDasTarefas
- Tela Gerenciar - 27
    - validarAcessoAbaUsuario
	- validarAcessoAbaProjetos
	- validarAcessoAbaMarcadores
	- validarAcessoAbaPerfil
	- validarAcessoAbaGerenciarConfiguracoes
	- validarAcessoAbaGerenciarPlugins
- Aba Gerenciar usuários - 5
    - criarNovoUsuario
    - criarUsuarioRepetido
    - editarUsuario
    - desativarUsuario
    - filtrarUsuariosDesativados
- Aba Gerenciar projetos - 8
    - criarCategoria
    - editarCategoria
    - deletarCategoria
    - criarProjeto
    - criarProjetoRepetido
    - editarProjeto
    - criarSubProjeto
    - editarSubProjeto
- Aba Gerenciar marcadores - 4
    - criarNovoMarcador
    - deletarMarcador
    - criarMarcadorRepetido
    - editarMarcador
- Aba Gerenciar perfis - 4
    - criarNovoPerfil
    - deletarPerfil
    - editarPerfil
    - criarPerfilRepetido

#### Extras

Agradeço ao [Saymowan](https://github.com/saymowan/docker-mantis-mariadb) por ter disponibilizado um tutorial para instalação do mantis via docker, pois foi importante para a construção deste projeto.

A linguagem de configuração da aplicação mantis está em inglês (EN), por tanto as validações podem ser divergentes se o teste for executado em português (PT-BR)

#### Dúvidas
1) Porque TestNG e não JUnit ?
  - JUnit nao tem recurso simples para adquirirmos o nome do teste, detalhes do teste para colocar no relatório ExtentReports. Já o TestNG, ele permite isso facilmente.
2) ... 
  - ...

### Licença

Este projeto esta sobe a licença [MIT](./LICENSE).

### Autor

<table>
	<tr>
		<td align="center">
			<a href="https://www.linkedin.com/in/gustavopereiradias">
				<img style="border-radius: 50%;" src="https://raw.githubusercontent.com/gpd38/cursoNutrorAutomacaoWeb/master/img/gustavo.png" width="100px;" alt="fotografia do autor do github"/>
				<br /><b>Gustavo Pereira Dias</b>
			</a>
			<br />
		</td>
	</tr>
</table>

#### Bibliografia

1. https://www.guru99.com/selenium-tutorial.html
2. https://github.com/saymowan/docker-mantis-mariadb
3. https://www.udemy.com/
4. https://www.alura.com.br/
5. https://stackoverflow.com/
6. https://www.pluralsight.com/guides/getting-started-with-page-object-pattern-for-your-selenium-tests
7. https://docs.cucumber.io/cucumber/api
8. https://www.seleniumhq.org/docs/03_webdriver.jsp
9. https://mvnrepository.com/
10. http://www.automationtestinghub.com/

#### Problema x Solução
1) Running TestSuite [TestNGContentHandler] [WARN] It is strongly recommended to add "<!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd" >" at the top of your file, otherwise TestNG may fail or not work as expected.
  - Inserir no arquivo testngsuite.xml: <!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd" >
