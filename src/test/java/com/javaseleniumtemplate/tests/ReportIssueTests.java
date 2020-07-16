package com.javaseleniumtemplate.tests;

import org.testng.annotations.Test;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.BugReportPage;
import com.javaseleniumtemplate.pages.MainPage;

public class ReportIssueTests extends TestBase {
    //Objects
    LoginFlows loginFlows;
    MainPage mainPage;
    BugReportPage bugReportPage;

    //Tests
    @Test
    public void cadastrarNovaIssueComSucessoInformandoSomenteCamposObrigatorios(){
        //Objects instances
        loginFlows = new LoginFlows();
        mainPage = new MainPage();
        bugReportPage = new BugReportPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String categoria = "[All Projects] Teste";
        String resumo = "Resumo teste automático ";
        String descricao = "Descrição teste automático";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        mainPage.clickReportIssue();
        bugReportPage.selecionarCategoria(categoria);
        bugReportPage.preencherResumo(resumo);
        bugReportPage.preencherDescricao(descricao);
        bugReportPage.ClicarEmSubmitReport();
    }
}
