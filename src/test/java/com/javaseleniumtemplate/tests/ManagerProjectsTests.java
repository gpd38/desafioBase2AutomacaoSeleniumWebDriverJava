package com.javaseleniumtemplate.tests;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.ManagerPage;
import com.javaseleniumtemplate.pages.ManagerProjectsPage;
import com.javaseleniumtemplate.utils.Utils;
import org.testng.Assert;
import org.testng.annotations.Test;

public class ManagerProjectsTests extends TestBase {

    // Objects
    LoginFlows loginFlows;
    ManagerPage managerPage;
    ManagerProjectsPage managerProjectPage;

    //Tests
    @Test
    public void cadastrarProjeto() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerProjectPage = new ManagerProjectsPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String projectName = "projeto" + id;
        String projectStatus = "desenvolvimento";
        String descriptionProject = "descrição projeto " + id;
        String msgCadastroSucesso = "Operação realizada com sucesso.";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerProjectsTab();
        managerProjectPage.clicarBotaoCriarProjeto();
        managerProjectPage.preencherNomeProjeto(projectName);
        managerProjectPage.selecionarStatusProjeto(projectStatus);
        managerProjectPage.preencherDescricaoProjeto(descriptionProject);
        managerProjectPage.clicarBotaoAddProjeto();

        Assert.assertEquals(msgCadastroSucesso, managerProjectPage.returnMsgSucessoTexto());

    }

    @Test
    public void cadastrarProjetoRepetido() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerProjectPage = new ManagerProjectsPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String projectName = "projeto" + id;
        String projectStatus = "desenvolvimento";
        String descriptionProject = "descrição projeto " + id;
        String msgErrorCadastroRepetido = "APPLICATION ERROR #701";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerProjectsTab();
        managerProjectPage.clicarBotaoCriarProjeto();
        managerProjectPage.preencherNomeProjeto(projectName);
        managerProjectPage.selecionarStatusProjeto(projectStatus);
        managerProjectPage.preencherDescricaoProjeto(descriptionProject);
        managerProjectPage.clicarBotaoAddProjeto();

        //Repetindo o cadastro
        managerProjectPage.clicarBotaoCriarProjeto();
        managerProjectPage.preencherNomeProjeto(projectName);
        managerProjectPage.selecionarStatusProjeto(projectStatus);
        managerProjectPage.preencherDescricaoProjeto(descriptionProject);
        managerProjectPage.clicarBotaoAddProjeto();

        Assert.assertEquals(msgErrorCadastroRepetido, managerProjectPage.returnMsgErrorTexto());

    }

    @Test
    public void editarProjeto() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerProjectPage = new ManagerProjectsPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String projectName = "Projeto" + id;
        String projectStatus = "obsoleto";
        String descriptionProject = "Descrição projeto " + id;

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerProjectsTab();
        managerProjectPage.clicarBotaoCriarProjeto();
        managerProjectPage.preencherNomeProjeto(projectName);
        managerProjectPage.selecionarStatusProjeto(projectStatus);
        managerProjectPage.preencherDescricaoProjeto(descriptionProject);
        managerProjectPage.clicarBotaoAddProjeto();
        //Atualizar a aba
        managerPage.clickManagerProjectsTab();
        //Clicar sobre o elemento recém cadastrado
        managerProjectPage.selecionarEditarProjeto(projectName);

        id = Utils.gerarNumerosAleatorios();
        projectName = "Projeto" + id;
        projectStatus = "estável";
        descriptionProject = "Nova descrição projeto " + id;

        managerProjectPage.preencherNomeProjeto(projectName);
        managerProjectPage.selecionarStatusProjeto(projectStatus);
        managerProjectPage.clicarHCG();
        managerProjectPage.preencherDescricaoProjeto(descriptionProject);
        managerProjectPage.editarProjeto();

        Assert.assertTrue(managerProjectPage.returnExisteElemento(projectName));

    }

    @Test
    public void deletarProjeto() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerProjectPage = new ManagerProjectsPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String projectName = "Projeto" + id;
        String projectStatus = "desenvolvimento";
        String descriptionProject = "Descrição projeto " + id;

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerProjectsTab();
        managerProjectPage.clicarBotaoCriarProjeto();
        managerProjectPage.preencherNomeProjeto(projectName);
        managerProjectPage.selecionarStatusProjeto(projectStatus);
        managerProjectPage.preencherDescricaoProjeto(descriptionProject);
        managerProjectPage.clicarBotaoAddProjeto();
        //Atualizar a aba
        managerPage.clickManagerProjectsTab();
        //Clicar sobre o elemento recém cadastrado
        managerProjectPage.selecionarEditarProjeto(projectName);
        //Deletar projeto
        managerProjectPage.deletarProjeto();
        managerProjectPage.clicarConfirmacaoDeletarProjeto();

        Assert.assertFalse(managerProjectPage.returnExisteElemento(projectName));

    }

}