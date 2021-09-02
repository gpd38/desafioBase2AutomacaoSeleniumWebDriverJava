package com.javaseleniumtemplate.tests;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.ManagerCamposPersonalizadosPage;
import com.javaseleniumtemplate.pages.ManagerPage;
import com.javaseleniumtemplate.utils.Utils;
import org.testng.Assert;
import org.testng.annotations.Test;

public class ManagerCamposPersonalizadosTests extends TestBase {

    // Objects
    LoginFlows loginFlows;
    ManagerPage managerPage;
    ManagerCamposPersonalizadosPage managerCPP;

    //Tests
    @Test
    public void cadastrarCampoPersonalizado() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerCPP = new ManagerCamposPersonalizadosPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String campoPersonalizado = "cp" + id;
        String msgCadastroSucesso = "Operação realizada com sucesso.";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerCustomFieldsTab();
        managerCPP.preencherNomeCampoPersonalizado(campoPersonalizado);
        managerCPP.clicarBotaoCriarCampoPersonalizado();

        Assert.assertEquals(msgCadastroSucesso, managerCPP.retornaSucessoCampoPersonalizado());

    }

    @Test
    public void validarCadastroRepetidoDeCampoPersonalizado() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerCPP = new ManagerCamposPersonalizadosPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String campoPersonalizado = "cp" + id;
        String msgCadastroErro = "APPLICATION ERROR #1301";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerCustomFieldsTab();
        managerCPP.preencherNomeCampoPersonalizado(campoPersonalizado);
        managerCPP.clicarBotaoCriarCampoPersonalizado();

        //Repetindo o cadastro
        managerPage.clickManagerCustomFieldsTab();
        managerCPP.preencherNomeCampoPersonalizado(campoPersonalizado);
        managerCPP.clicarBotaoCriarCampoPersonalizado();

        Assert.assertEquals(msgCadastroErro, managerCPP.retornaErrorCampoPersonalizado());

    }

    @Test
    public void validarCampoPersonalizadoVazio() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerCPP = new ManagerCamposPersonalizadosPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String campoPersonalizado = "";
        String msgCadastroError = "APPLICATION ERROR #11";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerCustomFieldsTab();
        managerCPP.preencherNomeCampoPersonalizado(campoPersonalizado);
        managerCPP.clicarBotaoCriarCampoPersonalizado();

        Assert.assertEquals(msgCadastroError, managerCPP.retornaErrorCampoPersonalizado());
    }

    @Test
    public void editarCampoPersonalizado() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerCPP = new ManagerCamposPersonalizadosPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String campoPersonalizado = "cp" + id;
        String msgCadastroSucesso = "Operação realizada com sucesso.";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerCustomFieldsTab();
        managerCPP.preencherNomeCampoPersonalizado(campoPersonalizado);
        managerCPP.clicarBotaoCriarCampoPersonalizado();

        id = Utils.gerarNumerosAleatorios();
        campoPersonalizado = "Novo cp" + id;
        managerCPP.editarNomeCampoPersonalizado(campoPersonalizado);
        managerCPP.clicarBotaoAtualizarCampoPersonalizado();

        Assert.assertEquals(msgCadastroSucesso, managerCPP.retornaSucessoCampoPersonalizado());

    }

    @Test
    public void deletarCampoPersonalizado() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerCPP = new ManagerCamposPersonalizadosPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String campoPersonalizado = "cp" + id;
        String msgCadastroSucesso = "Operação realizada com sucesso.";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerCustomFieldsTab();
        managerCPP.preencherNomeCampoPersonalizado(campoPersonalizado);
        managerCPP.clicarBotaoCriarCampoPersonalizado();
        managerCPP.clicarDeletarCampoPersonalizado();
        managerCPP.clicarConfirmacaoDeletarCampoPersonaizado();

        Assert.assertEquals(msgCadastroSucesso, managerCPP.retornaSucessoCampoPersonalizado());

    }

}