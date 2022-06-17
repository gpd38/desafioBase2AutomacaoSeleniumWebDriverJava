package com.javaseleniumtemplate.tests;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.ManagerPage;
import com.javaseleniumtemplate.pages.ManagerProfilePage;
import com.javaseleniumtemplate.utils.Utils;
import org.testng.Assert;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import java.io.IOException;

public class ManagerProfileTests extends TestBase {

    // Objects
    LoginFlows loginFlows;
    ManagerPage managerPage;
    ManagerProfilePage managerProfilePage;
    static Utils utils;

    @Test
    public void cadastrarProfile() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerProfilePage = new ManagerProfilePage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String plataforma = "Plataforma " + id;
        String sistemaOperacional = "SO " + id;
        String versaoSO = "Versão " + id;
        String descricao = "Descrição " + id;

        String concatProfile = plataforma + " " + sistemaOperacional + " " + versaoSO;

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerGlobalProfilesTab();
        managerProfilePage.preencherPlataforma(plataforma);
        managerProfilePage.preencherSistemaOperacional(sistemaOperacional);
        managerProfilePage.preencherVersaoSO(versaoSO);
        managerProfilePage.preencherDescricao(descricao);
        managerProfilePage.clicarAddPerfil();

        Assert.assertTrue(managerProfilePage.existePerfilCadastrado(concatProfile));
    }

    // script de banco deixa um cadastrado para este cenário não retornar erro inicialmente
    @Test
    public void validarClickBotaoEnviarSemInformacao() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerProfilePage = new ManagerProfilePage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String msgErrorEnviarVazio = "APPLICATION ERROR #200";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerGlobalProfilesTab();
        managerProfilePage.clicarEnviar();

        Assert.assertEquals(msgErrorEnviarVazio, managerProfilePage.retornaMensagemDeErroSemInformacao());
    }

    @Test(dataProvider = "PerfilTestData")
    public void efetuarCadastroProfileUsandoDataDriven(String plataforma, String so, String versao, String descricao) {
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerProfilePage = new ManagerProfilePage();

        // Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";

        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerGlobalProfilesTab();

        // Test
        managerProfilePage.preencherPlataforma(plataforma);
        managerProfilePage.preencherSistemaOperacional(so);
        managerProfilePage.preencherVersaoSO(versao);
        managerProfilePage.preencherDescricao(descricao);
        managerProfilePage.clicarAddPerfil();

        String concatProfile = plataforma + " " + so + " " + versao;

        Assert.assertTrue(managerProfilePage.existePerfilCadastrado(concatProfile));
    }

    @DataProvider(name = "PerfilTestData")
    public static Object[][] getDadosPerfilParaTesteComExcel() throws IOException {

        utils = new Utils();
        String path = System.getProperty("user.dir") + "/src/test/resources/files/PerfilTestData.xls";

        int l = utils.getRowCount(path);
        int c = utils.getCellCount(path, 1);

        String perfilTestData[][] = new String[l][c];

        for (int i = 0; i < l; i++) //1
        {
            for (int j = 0; j < c; j++) //0
            {
                perfilTestData[i][j] = utils.getCellData(path, i, j);
            }
        }

        return perfilTestData;

    }

}