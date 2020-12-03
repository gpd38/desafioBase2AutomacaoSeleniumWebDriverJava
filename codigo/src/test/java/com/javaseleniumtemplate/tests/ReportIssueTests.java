package com.javaseleniumtemplate.tests;

import org.testng.Assert;
import org.testng.annotations.Test;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.MainPage;
import com.javaseleniumtemplate.pages.ReportIssuePage;

public class ReportIssueTests extends TestBase {
	// Objects
	LoginFlows loginFlows;
	MainPage mainPage;
	ReportIssuePage reportIssuePage;

	// Tests
	@Test
	public void acessarReportIssuesComSucesso() {
		// Objects instances
		loginFlows = new LoginFlows();
		mainPage = new MainPage();
		reportIssuePage = new ReportIssuePage();

		// Parameteres
		String usuario = "administrator";
		String senha = "mantisbt";
		String mensagemEncontrouPagina = "Enter Issue Details";

		// Test
		loginFlows.efetuarLogin(usuario, senha);
		mainPage.clickReportIssueLateral();
		
		Assert.assertEquals(mensagemEncontrouPagina, reportIssuePage.returnPageReportIssueInformation());
	}
	
	@Test
	public void createIssueWithRequiredFields() {
		// Objects instances
		loginFlows = new LoginFlows();
		mainPage = new MainPage();
		reportIssuePage = new ReportIssuePage();

		// Parameteres
		String usuario = "administrator";
		String senha = "mantisbt";
		String categoria = "[All Projects] General";
		String resumo = "Resumo teste automático ";
		String descricao = "Descrição teste automático";
		String msgSucesso = "Operation successful.";

		// Test
		loginFlows.efetuarLogin(usuario, senha);
		mainPage.clickReportIssueLateral();
		reportIssuePage.selecionarProjetoInicial();
		reportIssuePage.selecionarCategoria(categoria);
		reportIssuePage.preencherResumo(resumo);
		reportIssuePage.preencherDescricao(descricao);
		reportIssuePage.ClicarEmSubmitReport();

		Assert.assertEquals(msgSucesso, reportIssuePage.returnMessageSuccess());
	}

	//@Test
	public void createIssueWithAllCompleteFields() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void validateFieldRequiredDescription() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void validateFieldRequiredSummary() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void validateFieldRequiredCategory() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void createIssueDuplicated() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void validateAssignUserIssue() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void validateSizeAttachedFile() {
		Assert.fail("Not implemented");
	}

}
