package com.javaseleniumtemplate.tests;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.pages.LoginPage;
import com.javaseleniumtemplate.pages.MainPage;
import com.javaseleniumtemplate.utils.Utils;
import org.testng.Assert;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import java.io.IOException;

public class LoginTests extends TestBase {
    static Utils utils;
    //Objects
    LoginPage loginPage;
    MainPage mainPage;

    @DataProvider(name = "LoginTestData")
    public static Object[][] getDadosUsuarioParaTesteComExcel() throws IOException {

        utils = new Utils();
        String path = System.getProperty("user.dir") + "/src/test/resources/files/LoginTestData.xls";

        int l = utils.getRowCount(path);
        int c = utils.getCellCount(path, 1);

        String LoginTestData[][] = new String[l][c];

        for (int i = 0; i < l; i++) //1
        {
            for (int j = 0; j < c; j++) //0
            {
                LoginTestData[i][j] = utils.getCellData(path, i, j);
            }
        }

        return LoginTestData;
    }

    //Tests
    @Test
    public void efetuarLoginComSucesso() {
        //Objects instances
        loginPage = new LoginPage();
        mainPage = new MainPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";

        //Test
        loginPage.preencherUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();

        //Validation
        Assert.assertEquals(usuario, mainPage.retornaUsernameDasInformacoesDeLogin());
    }

    @Test
    public void efetuarLoginComSenhaIncorreta() {
        loginPage = new LoginPage();

        // Parameteres
        String usuario = "administrator";
        String senha = "123456";
        String mensagemErroEsperadaPT = "Sua conta pode estar desativada ou bloqueada ou o nome de usuário e a senha que você digitou não estão corretos.";

        // Test
        loginPage.preencherUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();

        Assert.assertEquals(mensagemErroEsperadaPT, loginPage.retornaMensagemDeErro());
    }

    @Test
    public void efetuarLoginComUsuarioIncorreto() {
        loginPage = new LoginPage();

        // Parameteres
        String mensagemErroEsperadaPT = "Sua conta pode estar desativada ou bloqueada ou o nome de usuário e a senha que você digitou não estão corretos.";

        // Test: Usuario nulo
        loginPage.clicarEmLogin();

        Assert.assertEquals(mensagemErroEsperadaPT, loginPage.retornaMensagemDeErro());
    }

    @Test
    public void perdeuSuaSenha() {
        // Objects instances
        loginPage = new LoginPage();

        // Parameteres
        String usuario = "administrator";
        String mensagemEncontrouPagina = "Reajuste de Senha";

        // Test
        loginPage.preencherUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.clicarEmPerdeuSenha();

        Assert.assertEquals(mensagemEncontrouPagina, loginPage.returnPagePerdeuSenhaInformation());

    }

    @Test(dataProvider = "LoginTestData")
    public void efetuarLoginComDataDriven(String usuario, String senha, String resposta) {
        loginPage = new LoginPage();

        // Test
        loginPage.preencherUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();

        Assert.assertEquals(resposta, loginPage.retornaUrlAtualTratada());
    }

    /**
     //        String LoginTestData[][] = {
     //                {"AdminNaoExiste","mantisbt","http://localhost:8989/login_page.php"},
     //                {"administrator","SenhaNaoExiste","http://localhost:8989/login_page.php"},
     //                {"Inexistente_User","Inexistente_Senha","http://localhost:8989/login_page.php"},
     //                {"administrator","","http://localhost:8989/login_page.php"},
     //                {"administrator","MANTISBT","http://localhost:8989/login_page.php"},
     //                {"administrator","mantisbt","http://localhost:8989/login_page.php"},
     //                {".","mantisbt","http://localhost:8989/login_page.php"}
     //        };
     */

}
