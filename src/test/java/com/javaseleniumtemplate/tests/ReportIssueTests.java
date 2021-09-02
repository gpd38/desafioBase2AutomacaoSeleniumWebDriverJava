package com.javaseleniumtemplate.tests;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.BugReportPage;
import com.javaseleniumtemplate.pages.MainPage;
import com.javaseleniumtemplate.utils.Utils;
import org.testng.Assert;
import org.testng.annotations.Test;

import java.io.IOException;

public class ReportIssueTests extends TestBase {
    //Objects
    LoginFlows loginFlows;
    MainPage mainPage;
    BugReportPage bugReportPage;

    //Tests
    @Test
    public void cadastrarNovaIssueComSucessoInformandoSomenteCamposObrigatorios() {
        //Objects instances
        loginFlows = new LoginFlows();
        mainPage = new MainPage();
        bugReportPage = new BugReportPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();
        String projectName = "Projeto Default A";
        String categoria = "[Todos os Projetos] Categoria A";
        String resumo = "Resumo teste automático " + id;
        String descricao = "Descrição teste automático " + id;
        String msgCadastroSucesso = "Operação realizada com sucesso.";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        mainPage.clicarEmReportIssue();
        bugReportPage.selecionarProjetoReporter(projectName);
        bugReportPage.ClicarEmSubmitReport();
        bugReportPage.selecionarCategoria(categoria);
        bugReportPage.preencherResumo(resumo);
        bugReportPage.preencherDescricao(descricao);
        bugReportPage.ClicarEmSubmitReport();

        Assert.assertEquals(msgCadastroSucesso, bugReportPage.returnMsgSucessoTexto());

    }

    //Tests
    @Test
    public void cadastrarNovaIssueComSucessoInformandoTodosOsCampos() {
        //Objects instances
        loginFlows = new LoginFlows();
        mainPage = new MainPage();
        bugReportPage = new BugReportPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();
        String projectName = "Projeto Default A";
        String categoria = "[Todos os Projetos] Categoria A";
        String frequencia = "sempre";
        String gravidade = "obstáculo";
        String prioridade = "urgente";
        String perfil = "Plataforma Default B SO Default B Versão Original B";
        String atribuirUsuario = "desenvolvedor";
        String resumo = "Resumo teste automático " + id;
        String descricao = "Descrição teste automático " + id;
        String passosParaReproduzir = "Passo a passo da tarefa "+id;
        String infoAdicionais = "Informações adicionais da tarefa "+id;
        //String caminhoArquivo = "src/test/resources/files/anexo_ocorrencia.jpg";
        String marcador = "Tag "+id;
        String msgCadastroSucesso = "Operação realizada com sucesso.";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        mainPage.clicarEmReportIssue();
        bugReportPage.selecionarProjetoReporter(projectName);
        bugReportPage.ClicarEmSubmitReport();
        bugReportPage.selecionarCategoria(categoria);
        bugReportPage.selecionarFrequencia(frequencia);
        bugReportPage.selecionarGravidade(gravidade);
        bugReportPage.selecionarPrioridade(prioridade);
        bugReportPage.selecionarPerfil(perfil);
        bugReportPage.atribuirUsuarioTarefa(atribuirUsuario);
        bugReportPage.preencherResumo(resumo);
        bugReportPage.preencherDescricao(descricao);
        bugReportPage.preencherPassoAPasso(passosParaReproduzir);
        bugReportPage.preencherInfoAdicionais(infoAdicionais);
        bugReportPage.preencherMarcador(marcador);
        //bugReportPage.inserirAnexo(caminhoArquivo);
        bugReportPage.ClicarEmSubmitReport();

        Assert.assertEquals(msgCadastroSucesso, bugReportPage.returnMsgSucessoTexto());

    }

}