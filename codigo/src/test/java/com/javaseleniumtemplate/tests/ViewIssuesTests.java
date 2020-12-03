package com.javaseleniumtemplate.tests;

import org.testng.Assert;
import org.testng.annotations.Test;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.MainPage;
import com.javaseleniumtemplate.pages.ViewIssuesPage;

public class ViewIssuesTests extends TestBase {
	// Objects
	LoginFlows loginFlows;
	MainPage mainPage;
	ViewIssuesPage viewIssuePage;

	// Tests
	@Test
	public void acessarViewIssuesComSucesso() {
		// Objects instances
		loginFlows = new LoginFlows();
		mainPage = new MainPage();
		viewIssuePage = new ViewIssuesPage();

		// Parameteres
		String usuario = "administrator";
		String senha = "mantisbt";
		String mensagemEncontrouPagina = "Viewing Issues";

		// Test
		loginFlows.efetuarLogin(usuario, senha);
		mainPage.clickViewIssues();

		//TODO Refatorar este assert
		Assert.assertEquals(mensagemEncontrouPagina, viewIssuePage.returnPageViewIssueInformation().substring(0, 14));
	}
	
	@Test
	public void validarURLPage() {
		// Objects instances
		loginFlows = new LoginFlows();
		mainPage = new MainPage();
		viewIssuePage = new ViewIssuesPage();

		// Parameteres
		String usuario = "administrator";
		String senha = "mantisbt";
		String urlPage = "http://192.168.99.100:8989/view_all_bug_page.php";

		// Test
		loginFlows.efetuarLogin(usuario, senha);
		mainPage.clickViewIssues();

		Assert.assertEquals(urlPage, viewIssuePage.returnPageViewIssuesURL());
	}
	
	//@Test
	public void apagarMarcador() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void resolverTarefa() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void alterarGravidadeTarefa() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void alterarStatusRetornoDaTarefa() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void alterarStatusAtribuidoDaTarefa() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void alterarStatusAdmitidoDaTarefa() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void alterarStatusResolvidoDaTarefa() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void alterarStatusFechadoDaTarefa() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void alterarPrioridadeDaTarefa() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void moverTarefa() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void copiarTarefa() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void TestCaseAtribuirTarefa() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void TestCaseApagarTarefa() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void fecharTarefa() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void validarAcessoTelaVerTarefas() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void pesquisarTarefasInexistentes() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void pesquisarTarefasExistentes() {
		Assert.fail("Not implemented");
	}

	//@Test
	public void validarExclusaoTotalDasTarefas() {
		Assert.fail("Not implemented");
	}

}
