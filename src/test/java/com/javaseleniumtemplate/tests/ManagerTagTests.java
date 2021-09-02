package com.javaseleniumtemplate.tests;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.ManagerPage;
import com.javaseleniumtemplate.pages.ManagerTagPage;
import com.javaseleniumtemplate.utils.Utils;
import org.testng.Assert;
import org.testng.annotations.Test;

public class ManagerTagTests extends TestBase {

    // Objects
    LoginFlows loginFlows;
    ManagerPage managerPage;
    ManagerTagPage managerTagPage;

    //Tests
    @Test
    public void cadastrarTagCompleta() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerTagPage = new ManagerTagPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String tagName = "tag" + id;
        String tagDescription = "descrição tag " + id;

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerTagsTab();
        managerTagPage.clicarBotaoCriarTag();
        managerTagPage.preencherNomeTag(tagName);
        managerTagPage.preencherDescricaoTag(tagDescription);
        managerTagPage.clicarBotaoAddTag();

        Assert.assertTrue(managerTagPage.existeElemento(tagName));

    }

    @Test
    public void validarTelaEdicaoDeTag() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerTagPage = new ManagerTagPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String tagName = "tag" + id;
        String tagDescription = "descrição tag " + id;
        String msgTelaEditarSucesso = "Detalhes do marcador: " + tagName;

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerTagsTab();
        managerTagPage.clicarBotaoCriarTag();
        managerTagPage.preencherNomeTag(tagName);
        managerTagPage.preencherDescricaoTag(tagDescription);
        managerTagPage.clicarBotaoAddTag();
        managerTagPage.clicarElementoEspecifico(tagName);

        Assert.assertEquals(msgTelaEditarSucesso, managerTagPage.returnEdicaoSucesso());

    }

    @Test
    public void editarTag() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerTagPage = new ManagerTagPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String tagName = "tag" + id;
        String tagDescription = "descrição tag " + id;

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerTagsTab();
        managerTagPage.clicarBotaoCriarTag();
        managerTagPage.preencherNomeTag(tagName);
        managerTagPage.preencherDescricaoTag(tagDescription);
        managerTagPage.clicarBotaoAddTag();
        managerTagPage.clicarElementoEspecifico(tagName);

        managerTagPage.clicarBotaoAtualizarTag();
        managerTagPage.limparCampoTagName();
        id = Utils.gerarNumerosAleatorios();
        tagName = "tag" + id;
        managerTagPage.preencherNomeTag(tagName);
        managerTagPage.clicarBotaoAtualizarTag();

        String msgTelaEditarSucesso = "Detalhes do marcador: " + tagName;

        Assert.assertEquals(msgTelaEditarSucesso, managerTagPage.returnEdicaoSucesso());

    }

    @Test
    public void deletarTag() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerTagPage = new ManagerTagPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String tagName = "tag" + id;
        String tagDescription = "descrição tag " + id;

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerTagsTab();
        managerTagPage.clicarBotaoCriarTag();
        managerTagPage.preencherNomeTag(tagName);
        managerTagPage.preencherDescricaoTag(tagDescription);
        managerTagPage.clicarBotaoAddTag();
        managerTagPage.clicarElementoEspecifico(tagName);

        managerTagPage.clicarBotaoDeletarTag();
        managerTagPage.clicarBotaoConfirmarDeletarTag();

        Assert.assertFalse(managerTagPage.existeElemento(tagName));

    }

}