# Desafio Base2 Automação Selenium WebDriver

Projeto da empresa Base2 Tecnologia para os funcionários aprenderem e testarem seus conhecimentos de automação.

A aplicação a ser automatiada será o mantis.

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
| Nº 1 		       | Não Iniciado      |
| Nº 2 		       | Não Iniciado      |
| Nº 3 		       | Não Iniciado      |
| Nº 4 		       | Não Iniciado      |
| Nº 5 		       | Não Iniciado      |
| Nº 6 		       | Não Iniciado      |
| Nº 7 		       | Não Iniciado      |
| Nº 8 		       | Não Iniciado      |
| Nº 9 		       | Não Iniciado      |

#### Funcionalidades automatizadas

Serão automatizadas 53 funcionalidades divididas nas seguintes telas.

- Tela Login - 3
  - TestCaseLoginSucesso 
  - TestCaseLoginFalha 
  - TestCasePerdeuSenha 
- Tela Minha Visão - 6
  - TestCaseMinhaVisaoAtribuidosAMim
  - TestCaseMinhaVisaoNaoAtribuidos
  - TestCaseMinhaVisaoRelatadosPorMim
  - TestCaseMinhaVisaoResolvidos
  - TestCaseMinhaVisaoModificadosRecentemente
  - TestCaseMinhaVisaoMonitoradosPorMim
- Tela minha Conta - 1
  - TestCaseAcessarMinhaConta
- Tela Ver Tarefas - 13
  - TestCaseVisualizarTarefaCadastrada
  - TestCaseMoverTarefa
  - TestCaseCopiarTarefa
  - TestCaseAtribuirTarefa
  - TestCaseApagarTarefa
  - TestCaseResolverTarefa
  - TestCaseAtualizarPrioridadeTarefa
  - TestCaseAtualizarGravidadeTarefa
  - TestCaseAtualizarStatusTarefa
  - TestCaseAtualizarCategoriaTarefa
  - TestCaseSalvarFiltroAtual
  - TestCaseFiltrarPorCategoria
  - TestCaseFiltrarPorGravidade
- Tela Criar Tarefa - 5
  - TestCaseCriarNovaTarefa
  - TestCaseValidarCriarMaisTarefas
  - TestCaseValidarCampoResumoObrigatorio
  - TestCaseValidarCampoDescricaoObrigatorio
  - TestCaseValidarTamanhoArquivoAnexo
- Tela Gerenciar
  - Gerenciar usuários - 6
    - TestCaseCriarNovoUsuario
    - TestCaseCriarUsuarioRepetido
    - TestCaseEditarUsuario
    - TestCaseDeletarUsuario
    - TestCaseDesativarUsuario
    - TestCaseFiltrarUsuariosDesativados
  - Gerenciar projetos - 11
    - TestCaseCriarCategoria
    - TestCaseEditarCategoria
    - TestCaseDeletarCategoria
    - TestCaseCriarProjeto
    - TestCaseCriarProjetoRepetido
    - TestCaseEditarProjeto
    - TestCaseDeletarProjeto
    - TestCaseCriarSubProjeto
    - TestCaseEditarSubProjeto
    - TestCaseAdicionarUsuariosAoProjeto
    - TestCaseRemoverUsuariosDoProjeto
  - Gerenciar marcadores - 4
    - TestCaseCriarNovoMarcador
    - TestCaseDeletarMarcador
    - TestCaseCriarMarcadorRepetido
    - TestCaseEditarMarcador
  - Gerenciar perfis - 4
    - TestCaseCriarNovoPerfil
    - TestCaseDeletarPerfil
    - TestCaseEditarPerfil
    - TestCaseCriarPerfilRepetido

#### Dados do projeto


#### Problema x Solução

#### Extras

Agradeço ao [Saymowan](https://github.com/saymowan/docker-mantis-mariadb) por ter disponibilizado um tutorial para instalação do mantis via docker, pois foi importante para a construção deste projeto.

A linguagem de configuração da aplicação mantis está em inglês (EN), por tanto as validações podem ser divergentes se o teste for executado em português (PT-BR)

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
