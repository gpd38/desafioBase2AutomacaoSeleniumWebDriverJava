package com.javaseleniumtemplate.tests;

import org.testng.Assert;
import org.testng.annotations.Test;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.MainPage;

public class MainTests extends TestBase {
	// Objects
	LoginFlows loginFlows;
	MainPage mainPage;

	// Tests
	@Test
	public void validarTelaComUsuarioVisualizador() {
		loginFlows = new LoginFlows();
		mainPage = new MainPage();

		// Parameteres
		String usuario = "visualizador";
		String senha = "mantisbt";

		// Test
		loginFlows.efetuarLogin(usuario, senha);

		// TODO Posso validar usando o metodo privado ?
		// TODO Qual a melhor forma de validar ?
		Assert.assertTrue(mainPage.returnThereIsAccessMyView());
		Assert.assertTrue(mainPage.returnThereIsAccessViewIssues());
		Assert.assertTrue(mainPage.returnThereIsAccessChangeLog());
		Assert.assertTrue(mainPage.returnThereIsAccessRoadMap());
		Assert.assertFalse(mainPage.returnThereIsAccessReportIssue());
		Assert.assertFalse(mainPage.returnThereIsAccessSummary());
		Assert.assertFalse(mainPage.returnThereIsAccessManager());
	}

}
