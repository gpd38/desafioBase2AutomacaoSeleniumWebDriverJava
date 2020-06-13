package com.javaseleniumtemplate.tests;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.dbsteps.UsuariosDBSteps;
import com.javaseleniumtemplate.pages.LoginPage;
import com.javaseleniumtemplate.pages.MainPage;
import org.testng.Assert;
import org.testng.annotations.Test;

public class LoginTests extends TestBase {
    //Objects
    LoginPage loginPage;
    MainPage mainPage;

    //Tests
    @Test
    public void efetuarLoginComSucesso(){
        //Objects instances
        loginPage = new LoginPage();
        mainPage = new MainPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";

        //Test
        loginPage.preenhcerUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();

        Assert.assertEquals(usuario, mainPage.retornaUsernameDasInformacoesDeLogin());
    }

    @Test
    public void efetuarLoginComSucesso_SenhaRetornadaDoDB(){
        //Objects instances
        loginPage = new LoginPage();
        mainPage = new MainPage();

        //Parameteres
        String usuario = "administrator";
        String senha = UsuariosDBSteps.retornaSenhaDoUsuarioDB(usuario);

        //Test
        loginPage.preenhcerUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();

        Assert.assertEquals(usuario, mainPage.retornaUsernameDasInformacoesDeLogin());
    }
    
    @Test
    public void efetuarLoginComSenhaErrada(){
        //Objects instances
        loginPage = new LoginPage();
        mainPage = new MainPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "123456";

        //Test
        loginPage.preenhcerUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();

        Assert.assertEquals(usuario, loginPage.retornaMensagemDeErro());
    }
}
