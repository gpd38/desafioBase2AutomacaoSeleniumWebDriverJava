package com.javaseleniumtemplate.tests;

import org.testng.Assert;
import org.testng.annotations.Test;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.pages.BugReportPage;
import com.javaseleniumtemplate.pages.LoginPage;
import com.javaseleniumtemplate.pages.MainPage;

public class ReportIssueTests extends TestBase {
	// Objects
	LoginPage loginPage;
	MainPage mainPage;
	BugReportPage bugReportPage;

	// Tests
	//@Test
	public void createIssueWithRequiredFields() {
		// Objects instances
		loginPage = new LoginPage();
		mainPage = new MainPage();
		bugReportPage = new BugReportPage();

		// Parameteres
		String usuario = "administrator";
		String senha = "mantisbt";
		String categoria = "[All Projects] General";
		String resumo = "Resumo teste automático ";
		String descricao = "Descrição teste automático";
		String msgSucesso = "Operation successful.";

		// Test
		loginPage.preenhcerUsuario(usuario);
		loginPage.clicarEmLogin();
		loginPage.preencherSenha(senha);
		loginPage.clicarEmLogin();
		mainPage.clickReportIssue();
		bugReportPage.selecionarProjetoInicial();
		bugReportPage.selecionarCategoria(categoria);
		bugReportPage.preencherResumo(resumo);
		bugReportPage.preencherDescricao(descricao);
		bugReportPage.ClicarEmSubmitReport();

		Assert.assertEquals(msgSucesso, bugReportPage.returnMessageSuccess());
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
