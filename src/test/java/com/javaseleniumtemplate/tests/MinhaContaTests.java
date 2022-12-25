package com.javaseleniumtemplate.tests;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.pages.LoginPage;
import com.javaseleniumtemplate.pages.MainPage;
import com.javaseleniumtemplate.pages.MinhaContaPage;
import com.javaseleniumtemplate.utils.Utils;
import org.testng.Assert;
import org.testng.annotations.Test;

public class MinhaContaTests extends TestBase {

    // Objects
    LoginPage loginPage;
    MainPage mainPage;
    MinhaContaPage minhaContaPage;

    // Tests
    @Test
    public void acessarMinhaContaComSucesso() {
        // Objects instances
        loginPage = new LoginPage();
        mainPage = new MainPage();
        minhaContaPage = new MinhaContaPage();

        // Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String mensagemEncontrouPagina = "Alterar Conta";

        // Test
        loginPage.preencherUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();
        mainPage.clicarInformacoesDeLogin();
        mainPage.clickMyAccount();

        Assert.assertEquals(mensagemEncontrouPagina, minhaContaPage.returnPageMyAccountInformation());
    }

    @Test
    public void efetuarLogout() {
        // Objects instances
        loginPage = new LoginPage();
        mainPage = new MainPage();

        // Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String urlPagina = "http://localhost:8989/login_page.php";

        // Test
        loginPage.preencherUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();
        mainPage.clicarInformacoesDeLogin();
        mainPage.clickSair();

        Assert.assertEquals(urlPagina, loginPage.getURL());
    }

    @Test
    public void acessarAbaPreferencia() {
        // Objects instances
        loginPage = new LoginPage();
        mainPage = new MainPage();
        minhaContaPage = new MinhaContaPage();

        // Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String urlPagina = "http://localhost:8989/account_prefs_page.php";

        // Test
        loginPage.preencherUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();
        mainPage.clicarInformacoesDeLogin();
        mainPage.clickMyAccount();
        minhaContaPage.acessarAbaPreferencia();

        Assert.assertEquals(urlPagina, minhaContaPage.getURL());
    }

    @Test
    public void acessarAbaGerenciarColunas() {
        // Objects instances
        loginPage = new LoginPage();
        mainPage = new MainPage();
        minhaContaPage = new MinhaContaPage();

        // Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String urlPagina = "http://localhost:8989/account_manage_columns_page.php";

        // Test
        loginPage.preencherUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();
        mainPage.clicarInformacoesDeLogin();
        mainPage.clickMyAccount();
        minhaContaPage.acessarAbaGerenciarColunas();

        Assert.assertEquals(urlPagina, minhaContaPage.getURL());
    }

    @Test
    public void acessarAbaPerfis() {
        // Objects instances
        loginPage = new LoginPage();
        mainPage = new MainPage();
        minhaContaPage = new MinhaContaPage();

        // Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String urlPagina = "http://localhost:8989/account_prof_menu_page.php";

        // Test
        loginPage.preencherUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();
        mainPage.clicarInformacoesDeLogin();
        mainPage.clickMyAccount();
        minhaContaPage.acessarAbaPerfis();

        Assert.assertEquals(urlPagina, minhaContaPage.getURL());
    }

    @Test
    public void acessarAbaToken() {
        // Objects instances
        loginPage = new LoginPage();
        mainPage = new MainPage();
        minhaContaPage = new MinhaContaPage();

        // Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String urlPagina = "http://localhost:8989/api_tokens_page.php";

        // Test
        loginPage.preencherUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();
        mainPage.clicarInformacoesDeLogin();
        mainPage.clickMyAccount();
        minhaContaPage.acessarAbaToken();

        Assert.assertEquals(urlPagina, minhaContaPage.getURL());
    }

    @Test
    public void validarErroCriacaoTokenAPI() {
        // Objects instances
        loginPage = new LoginPage();
        mainPage = new MainPage();
        minhaContaPage = new MinhaContaPage();

        // Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String erroCriacaoToken = "APPLICATION ERROR #11";

        // Test
        loginPage.preencherUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();
        mainPage.clicarInformacoesDeLogin();
        mainPage.clickMyAccount();
        minhaContaPage.acessarAbaToken();
        minhaContaPage.clicarBotaoCriarTokenAPI();

        Assert.assertEquals(erroCriacaoToken, minhaContaPage.retornaMensagemErro());
    }

    @Test
    public void validarCriacaoTokenAPIComSucesso() {
        // Objects instances
        loginPage = new LoginPage();
        mainPage = new MainPage();
        minhaContaPage = new MinhaContaPage();

        // Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();
        String nomeToken = "Token-" + id;

        // Test
        loginPage.preencherUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();
        mainPage.clicarInformacoesDeLogin();
        mainPage.clickMyAccount();
        minhaContaPage.acessarAbaToken();
        minhaContaPage.preencherToken(nomeToken);
        minhaContaPage.clicarBotaoCriarTokenAPI();
        minhaContaPage.retornarTelaToken();

        Assert.assertTrue(minhaContaPage.existeToken(nomeToken));
    }

}
