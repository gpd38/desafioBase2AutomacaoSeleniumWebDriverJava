package com.javaseleniumtemplate.tests;

import org.testng.Assert;
import org.testng.annotations.Test;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.pages.LoginPage;
import com.javaseleniumtemplate.pages.MainPage;

public class MainTests extends TestBase {
	// Objects
	LoginPage loginPage;
	MainPage mainPage;
	
	// Tests
	//@Test
	public void existeTarefaRelatadaPorMim() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void existeBotaoVerTarefas() {
		Assert.fail("Not implemented");
	}

	@Test
	public void perdeuSuaSenha() {
		// Objects instances
		loginPage = new LoginPage();
		mainPage = new MainPage();

		// Parameteres
		String usuario = "administrator";
		String mensagemEncontrouPagina = "Password Reset";

		// Test
		loginPage.preenhcerUsuario(usuario);
		loginPage.clicarEmLogin();
		loginPage.clicarEmPerdeuSenha();

		Assert.assertEquals(mensagemEncontrouPagina, loginPage.returnPagePerdeuSenhaInformation());

	}

}
