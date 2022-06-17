<p align="center">
  <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava?color=blue">
  <img alt="GitHub" src="https://img.shields.io/github/license/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava?color=green">
  <img alt="GitHub language count" src="https://img.shields.io/github/languages/count/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava?color=red">
</p>

## Automação

Projeto da empresa Base2 Tecnologia para os funcionários aprenderem e testarem seus conhecimentos de automação.

A aplicação a ser automatiada será o mantis.

<p align="center">
    <a href="#Desafio Selenium">Desafio Selenium</a> •
    <a href="#Arquitetura">Arquitetura</a> •
    <a href="#Setup">Setup</a> •
    <a href="#Cenários">Cenários</a> •
    <a href="#Licença">Licença</a> •
    <a href="#Autor">Autor</a>
</p>

## Desafio Selenium

1. Implementar 50 scripts de testes que manipulem uma aplicação web (sugestões: Mantis ou TestLink) com Page Objects.
2. Alguns scripts devem ler dados de uma planilha Excel para implementar Data-Driven.
   - Quem utilizar Cucumber, SpecFlow ou outra ferramenta de BDD não precisa implementar lendo de uma planilha Excel. Pode ser a implementação de um Scenario Outline.
3. Notem que 50 scripts podem cobrir mais de 50 casos de testes se usarmos Data-Driven. Em outras palavras, implementar 50 CTs usando data-driven não é a mesma coisa que implementar 50 scripts.
4. Os casos de testes precisam ser executados em no mínimo três navegadores. Utilizando o Selenium Grid.
   - Não é necessário executar em paralelo. Pode ser demonstrada a execução dos browsers separadamente.
   - Não é uma boa prática executar os testes em todos os browsers em uma única execução. A melhor forma é controlar o browser através de um arquivo de configuração.
       - .NET: normalmente utiliza-se app.config
       - Java: normalmente utiliza-se a classe Properties e cria-se um arquivo chamado environment.properties.
5. Gravar screenshots ou vídeo automaticamente dos casos de testes.
6. O projeto deverá gerar um relatório de testes automaticamente com screenshots ou vídeos embutidos. Sugestões: Allure Report ou ExtentReport.
7. A massa de testes deve ser preparada neste projeto, seja com scripts carregando massa nova no BD ou com restore de banco de dados.
8. Um dos scripts deve injetar Javascript para executar alguma operação na tela. O objetivo aqui é exercitar a injeção de Javascript dentro do código do Selenium.
   - Sugestão: fazer o login usando Javascript ao invés do código do Selenium.
9. Testes deverão ser agendados pelo Jenkins, CircleCI, TFS, TeamCity ou outra ferramenta de CI que preferir.

## Arquitetura

- Linguagem Java
- Java Kit Development versão 8
- Gestão de dependências: Maven
- Framework de Testes automatizass web: Selenium WebDriver
- Orquestrador de testes: TestNG
- Relatório de testes automatizados: ExtentReports

**Premissas de uma boa arquitetura de automação de testes:**

* Facilitar o desenvolvimento dos testes automatizados (reuso).
* Facilitar a manutenção dos testes (refatoração).
* Tornar o fluxo do teste o mais legível possível (fácil entendimento do que está sendo testado).

**Arquitetura padrão Base2**

Para facilitar o entendimento da arquitetura do projeto de testes automatizados, foi criado um fluxograma baseado nas
features principais que envolvam a arquitetura conforme imagem abaixo:

![alt text](https://i.imgur.com/wexOWJF.png)

**Relatório de testes**

Após toda execução: sucesso ou falha, é gerado um relatório com cada passo realizado do teste. Está disponível na pasta
do projeto "target/reports". Existe a possibilidade de tirar screenshots em cada passo ou somente em caso de falha.
Verifique o arquivo globalParameteres.properties e coloque true ou false no parâmetro: get.screenshot.for.each.step.

Obs: a imagens possuem path dinâmico, basta zipar a pasta do relatório e enviar para o destinatário ou subir em algum
bucket AWS para acessar que todos os dados estarão consistentes.

**Padrões por tipo de componente**

* Pastas: começam sempre com letra minúscula. Ex: `pages, dbsteps, basess`
* Classes: começam sempre com letra maiúscula. Ex: `LoginPage, LoginTests`
* Arquivos: começam sempre com letra minúscula. Ex: `report.png`
* Métodos: começam sempre com letra minúscula. Ex: `efetuarLoginComSucesso()`
* Variáveis: começam sempre com letra minúscula. Ex: `botaoXPTO`
* Objetos: começam sempre com letra minúscula. Ex: `loginPage`

**Padrão de siglas e palavras com uma letra**

No caso de siglas, manter o padrão da primeira letra, de acordo com o padrão do tipo que será nomeado, ex:

```
cpfField (variável)
preencherCPF() (método)
```

No caso de palavras com uma letra, as duas devem ser escritas juntas de acordo com o padrão do tipo que será nomeado,
ex:`retornaSeValorEOEsperado()`

**Padrões de escrita: Classes e Arquivos**

Nomes de classes e arquivos devem terminar com o tipo de conteúdo que representam, em inglês, ex:

```
LoginPage (classe de PageObjects)
LoginTests (classe de testes)
LoginTestData.csv (planilha de dados)
```

OBS: Atenção ao plural e singular! Se a classe contém um conjunto do tipo que representa, esta deve ser escrita no
plural, caso seja uma entidade, deve ser escrita no singular.

**Padrões de escrita: Geral**

Nunca utilizar acentos, espaços, caracteres especiais e “ç” para denominar pastas, classes, métodos, variáveis, objetos
e arquivos.

**Padrões de escrita: Objetos**

Nomes dos objetos devem ser exatamente os mesmos nomes de suas classes, iniciando com letra minúscula, ex:

```
LoginPage (classe) loginPage (objeto)
LoginFlows (classe) loginFlows (objeto)
```

## Setup

- Versão 1.8 do Java JDK instalada no computador (https://www.oracle.com/br/java/technologies/javase/javase-jdk8-downloads.html)
- Versão community do IntelliJ IDEA instalada no computador (https://www.jetbrains.com/pt-br/idea/download/#section=windows)
- Versão do Google Chrome instalada no computador: Versão 92.0.4515.159 (https://www.google.com/chrome/)
- Versão do MozillaFirefox instalada no computador: Versão 91.0.1  (https://www.mozilla.org/pt-BR/firefox/new/)
- Versão do Microsoft Edge instalada no computador: Versão 92.0.902.73  (https://www.microsoft.com/pt-br/edge?r=1)
- Versão do Jenkins instalada no computador: Versão 2.289.3 (https://www.jenkins.io/download/)

**Jenkins**

- Configuração opção 1:
    - Criar um projeto do tipo pipeline
    - Na opção "Pipeline"
        - Definition: Pipeline Script SCM
        - SCM: git
        - Repositories: https://github.com/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava
        - Brach build: Master
        - Script Path: Jenkinsfile

- Configuração opção 2:
    - Criar um projeto do tipo pipeline
    - Na opção "Pipeline"
        - Definition: Pipeline Script
    - Inserir o script abaixo:
```
pipeline {
   agent any
   stages {
        stage('Git Checkout') {
            steps {
                git branch: 'master', url:'https://github.com/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava.git'            
            }
        }
        stage ('Build') {
            steps{
               bat 'mvn clean package -DskipTests=true'
            }
       }
       stage ('Tests') {
            steps{
               bat 'mvn test'
            }
       }
    }
}
```

Após salvar, verifique se o projeo está habilitado e clique em "construir agora" (BR) ou "build" (EN).

## Cenários 

- [LoginTests](https://github.com/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava/blob/master/src/test/java/com/javaseleniumtemplate/tests/LoginTests.java)
    - efetuarLoginComSucesso
    - efetuarLoginComSenhaIncorreta
    - efetuarLoginComUsuarioIncorreto
    - perdeuSuaSenha
    - efetuarLoginComUsandoDataDriven
- [ManagerCamposPersonalizadosTests](https://github.com/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava/tree/master/src/test/java/com/javaseleniumtemplate/tests/ManagerCamposPersonalizados.java)
    - cadastrarCampoPersonalizado
    - validarCampoPersonalizadoVazio
    - validarCadastroRepetidoDeCampoPersonalizado
    - editarCampoPersonalizado
    - deletarCampoPersonalizado
- [ManagerProfileTests](https://github.com/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava/tree/master/src/test/java/com/javaseleniumtemplate/tests/ManagerProfileTests.java)
    - cadastrarProfile
    - validarClickBotaoEnviarSemInformacao
    - efetuarCadastroProfileUsandoDataDriven
- [ManagerProjectsTests](https://github.com/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava/tree/master/src/test/java/com/javaseleniumtemplate/tests/ManagerProjectsTests.java)
    - cadastrarProjeto
    - cadastrarProjetoRepetido
    - editarProjeto
    - deletarProjeto
- [ManagerResumoTests](https://github.com/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava/tree/master/src/test/java/com/javaseleniumtemplate/tests/ManagerResumoTest.java)
    - validarAcessoAoResumoComUsuarioAdmin
    - validarAcessoNegadoResumoComDeveloper
- [ManagerTagTests](https://github.com/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava/tree/master/src/test/java/com/javaseleniumtemplate/tests/ManagerTagTests.java)
    - cadastrarTag
    - validarTelaEdicaoDeTag
    - editarTag
    - deletarTag
- [ManagerTests](https://github.com/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava/tree/master/src/test/java/com/javaseleniumtemplate/tests/ManagerTests.java)
    - validateAccessInformationTab
    - validateAccessUsersTab
    - validateAccessProjectsTab
    - validateAccessTagsTab
    - validateAccessCustomFieldsTab
    - validateAccessGlobalProfilesTab
    - validateAccessPluginsTab
    - validateAccessConfigurationTab
- [ManagerUsersTests](https://github.com/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava/tree/master/src/test/java/com/javaseleniumtemplate/tests/ManagerUsersTests.java)
    - cadastrarRelatorUser
    - cadastrarVisualizadorUser
    - cadastrarAtualizadorUser
    - cadastrarDesenvolvedorUser
    - cadastrarGerenteUser
    - cadastrarAdministradorUser
    - cadastroDeUserNameRepetido
    - cadastroDeUserEmailRepetido
    - redefinirSenha
- [ManagerVerTarefasTests](https://github.com/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava/tree/master/src/test/java/com/javaseleniumtemplate/tests/ManagerVerTarefasTest.java)
    - validarAcessoVerTarefasComSucesso
    - validarInserirMarcador
- [MinhaContaTests](https://github.com/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava/tree/master/src/test/java/com/javaseleniumtemplate/tests/MinhaContaTests.java)
    - acessarMinhaContaComSucesso
    - efetuarLogout
    - acessarAbaPreferencia
    - acessarAbaGerenciarColunas
    - acessarAbaPerfis
    - acessarAbaToken
    - validarErroCriacaoTokenAPI
    - validarCriacaoTokenAPIComSucesso
- [ReportIssueTests](https://github.com/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava/tree/master/src/test/java/com/javaseleniumtemplate/tests/ReportIssueTests.java)
    - cadastrarNovaIssueComSucessoInformandoSomenteCamposObrigatorios
    - cadastrarNovaIssueComSucessoInformandoTodosOsCampos

### Selenium Grid

Para executar utilizando o selenium grid no projeto.
    
    - Configurar os contêineres hub
    - Configurar os node dos navegadores
    - Executar os comandos:
        - java -jar selenium-server-4.2.2.jar node
        - java -jar selenium-server-4.2.2.jar hub
    - Ajustar as configurações nas proriedades do projeto para execução remota
    - Acessar a url "http://localhost:4444/" e validar se tudo está em execução
    - Rodar os testes

![alt text](https://github.com/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava/blob/master/evidencias/selenium%20grid/Screenshot_2.png)

### Licença

Este projeto esta sobe a licença [MIT](./LICENSE).

### Autor

<table>
    <tr>
        <td align="center">
            <a href="https://www.linkedin.com/in/gustavopereiradias">
                <img style="border-radius: 50%;" src="https://raw.githubusercontent.com/gpd38/desafioBase2AutomacaoSeleniumWebDriverJava/master/img/gustavo.png" width="100px;" alt="fotografia do autor do github"/>
                <br /><b>Gustavo Pereira Dias</b>
            </a>
            <br />
        </td>
    </tr>
</table>
