package com.javaseleniumtemplate.tests;

import org.testng.Assert;
import org.testng.annotations.Test;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.pages.LoginPage;
import com.javaseleniumtemplate.pages.MainPage;
import com.javaseleniumtemplate.pages.MyAccountPage;

public class MyAccountTests extends TestBase {
	// Objects
	LoginPage loginPage;
	MainPage mainPage;
	MyAccountPage myAccountPage;

	// Tests
	@Test
	public void acessarMyAccountComSucesso() {
		// Objects instances
		loginPage = new LoginPage();
		mainPage = new MainPage();
		myAccountPage = new MyAccountPage();

		// Parameteres
		String usuario = "administrator";
		String senha = "mantisbt";
		String mensagemEncontrouPagina = "Edit Account";

		// Test
		loginPage.preenhcerUsuario(usuario);
		loginPage.clicarEmLogin();
		loginPage.preencherSenha(senha);
		loginPage.clicarEmLogin();
		mainPage.clickUserNameLoginInformation();
		mainPage.clickMyAccount();

		Assert.assertEquals(mensagemEncontrouPagina, myAccountPage.returnPageMyAccountInformation());
	}

	@Test
	public void efetuarLogout() throws Exception {
		// Objects instances
		loginPage = new LoginPage();
		mainPage = new MainPage();

		// Parameteres
		String usuario = "administrator";
		String senha = "mantisbt";

		// Test
		loginPage.preenhcerUsuario(usuario);
		loginPage.clicarEmLogin();
		loginPage.preencherSenha(senha);
		loginPage.clicarEmLogin();
		mainPage.clickUserNameLoginInformation();
		mainPage.clickLogout();

		Assert.assertTrue(loginPage.existeBotaoEntrar());
	}

	// @Test
	public void changePassword() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void changeEmail() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void validarAcessoPerfilVisualizadorFuncionalidadeMyView() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void validarAcessoPerfilVisualizadorFuncionalidadeViewIssues() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void validarAcessoPerfilVisualizadorFuncionalidadeChangeLog() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void validarAcessoPerfilVisualizadorFuncionalidadeRoadmap() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void validarAcessoPerfilVisualizadorFuncionalidadeReportIssue() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void validarAcessoPerfilVisualizadorFuncionalidadeSummary() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void validarAcessoPerfilVisualizadorFuncionalidadeManage() {
		Assert.fail("Not implemented");
	}

}
