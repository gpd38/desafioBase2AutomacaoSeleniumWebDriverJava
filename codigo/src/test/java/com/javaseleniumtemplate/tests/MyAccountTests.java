package com.javaseleniumtemplate.tests;

import org.testng.Assert;
import org.testng.annotations.Test;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.pages.LoginPage;
import com.javaseleniumtemplate.pages.MainPage;
import com.javaseleniumtemplate.pages.MyAccountPage;

public class MyAccountTests extends TestBase {

	LoginPage loginPage;
	MainPage mainPage;
	MyAccountPage myAccountPage;

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

	// @Test
	public void atualizarSenha() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void atualizarEmail() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void acessarPaginaMinhaVisao() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void acessarPaginaVerTarefas() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void acessarPaginaCriarTarefas() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void acessarPaginaGerenciar() {
		Assert.fail("Not implemented");
	}

	//@Test
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
		mainPage.clickLogout();

		Assert.assertTrue(loginPage.existeBotaoEntrar());
	}

}
