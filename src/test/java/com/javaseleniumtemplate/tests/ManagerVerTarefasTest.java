package com.javaseleniumtemplate.tests;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.ManagerVerTarefasPage;
import com.javaseleniumtemplate.utils.Utils;
import org.testng.Assert;
import org.testng.annotations.Test;

public class ManagerVerTarefasTest extends TestBase {

    // Objects
    LoginFlows loginFlows;
    ManagerVerTarefasPage managerVerTarefasPage;

    //Tests
    @Test
    public void validarAcessoVerTarefasComSucesso() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerVerTarefasPage = new ManagerVerTarefasPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String tituloPagina = "Ver Tarefas - MantisBT";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerVerTarefasPage.clicarMenuAcesso();

        Assert.assertEquals(tituloPagina, managerVerTarefasPage.retornarTituloPagina());
    }

    @Test
    public void validarInserirMarcador() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerVerTarefasPage = new ManagerVerTarefasPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String numTarefaDefault = "0000001";
        String id = Utils.gerarNumerosAleatorios();
        String tagNome = "tagDefault" + id;

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerVerTarefasPage.clicarMenuAcesso();
        managerVerTarefasPage.editarTarefa(numTarefaDefault);
        managerVerTarefasPage.preencherMarcador(tagNome);
        managerVerTarefasPage.clicarEmAplicar();

        Assert.assertTrue(managerVerTarefasPage.validarMarcadorAplicado(tagNome));
    }

}