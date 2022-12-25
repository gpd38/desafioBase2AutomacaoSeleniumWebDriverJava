package com.javaseleniumtemplate.tests;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.ManagerPage;
import org.testng.Assert;
import org.testng.annotations.Test;

public class ManagerTests extends TestBase {

    // Objects
    LoginFlows loginFlows;
    ManagerPage managerPage;

    //Tests
    @Test
    public void validateAccessInformationTab() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String tituloPageNaAbaInformation = "http://localhost:8989/manage_overview_page.php";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        Assert.assertEquals(tituloPageNaAbaInformation, managerPage.returnUrlPaginaAtual());

    }

    @Test
    public void validateAccessUsersTab() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String tituloPageNaAbaUsers = "http://localhost:8989/manage_user_page.php";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerUsersTab();
        Assert.assertEquals(tituloPageNaAbaUsers, managerPage.returnUrlPaginaAtual());
    }

    @Test
    public void validateAccessProjectsTab() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String tituloPageNaAbaProjetos = "http://localhost:8989/manage_proj_page.php";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerProjectsTab();
        Assert.assertEquals(tituloPageNaAbaProjetos, managerPage.returnUrlPaginaAtual());
    }

    @Test
    public void validateAccessTagsTab() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String tituloPageNaAbaTags = "http://localhost:8989/manage_tags_page.php";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerTagsTab();
        Assert.assertEquals(tituloPageNaAbaTags, managerPage.returnUrlPaginaAtual());
    }

    @Test
    public void validateAccessCustomFieldsTab() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String tituloPageNaAbaCustomFields = "http://localhost:8989/manage_custom_field_page.php";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerCustomFieldsTab();
        Assert.assertEquals(tituloPageNaAbaCustomFields, managerPage.returnUrlPaginaAtual());
    }

    @Test
    public void validateAccessGlobalProfilesTab() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String tituloPageNaAbaProfiles = "http://localhost:8989/manage_prof_menu_page.php";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerGlobalProfilesTab();
        Assert.assertEquals(tituloPageNaAbaProfiles, managerPage.returnUrlPaginaAtual());
    }

    @Test
    public void validateAccessPluginsTab() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String tituloPageNaAbaPlugins = "http://localhost:8989/manage_plugin_page.php";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerPluginsTab();
        Assert.assertEquals(tituloPageNaAbaPlugins, managerPage.returnUrlPaginaAtual());
    }

    @Test
    public void validateAccessConfigurationTab() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String tituloPageNaAbaConfiguration = "http://localhost:8989/adm_permissions_report.php";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerConfigurationTab();

        Assert.assertEquals(tituloPageNaAbaConfiguration, managerPage.returnUrlPaginaAtual());
    }

    @Test
    public void validarUltimoCampoComJavaScript() {
//Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String msgCadastroSucesso = "Operação realizada com sucesso.";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerConfigurationTab();
        managerPage.clickManagerConfigurationSubTabColums();
        managerPage.encontrarElementoComJS();
        managerPage.clicarBotaoAtualizarColunas();

        Assert.assertEquals(msgCadastroSucesso, managerPage.returnMsgSucessoTexto());
    }
}
