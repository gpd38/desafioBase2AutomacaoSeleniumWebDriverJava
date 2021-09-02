package com.javaseleniumtemplate.tests;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.ManagerResumoPage;
import org.testng.Assert;
import org.testng.annotations.Test;

public class ManagerResumoTests extends TestBase {

    // Objects
    LoginFlows loginFlows;
    ManagerResumoPage managerResumoPage;

    //Tests
    @Test
    public void validarAcessoAoResumoComUsuarioAdmin() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerResumoPage = new ManagerResumoPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String tituloInternoPagina = "Resumo";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerResumoPage.clicarMenuAcesso();

        Assert.assertEquals(tituloInternoPagina, managerResumoPage.retornarMensagemSucesso());

    }

    @Test
    public void validarAcessoNegadoResumoComDeveloper() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerResumoPage = new ManagerResumoPage();

        //Parameteres
        String usuario = "desenvolvedor";
        String senha = "mantisbt";

        //Test
        loginFlows.efetuarLogin(usuario, senha);

        Assert.assertFalse(managerResumoPage.existeMenuAcesso());
    }

}