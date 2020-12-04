package com.javaseleniumtemplate.tests;

import org.testng.Assert;
import org.testng.annotations.Test;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.MainPage;
import com.javaseleniumtemplate.pages.SummaryPage;

public class SummaryTests extends TestBase {
	// Objects
	LoginFlows loginFlows;
	MainPage mainPage;
	SummaryPage summaryPage;

	// Tests
	@Test
	public void acessarSummaryComSucesso() {
		// Objects instances
		loginFlows = new LoginFlows();
		mainPage = new MainPage();
		summaryPage = new SummaryPage();

		// Parameteres
		String usuario = "administrator";
		String senha = "mantisbt";
		String mensagemEncontrouPagina = "Summary";

		// Test
		loginFlows.efetuarLogin(usuario, senha);
		mainPage.clickChangeLog();

		Assert.assertEquals(mensagemEncontrouPagina, summaryPage.returnPageSummaryInformation());

	}
}
