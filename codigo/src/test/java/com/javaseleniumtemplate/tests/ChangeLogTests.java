package com.javaseleniumtemplate.tests;

import org.testng.Assert;
import org.testng.annotations.Test;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.ChangeLogPage;
import com.javaseleniumtemplate.pages.MainPage;

public class ChangeLogTests extends TestBase {
	// Objects
	LoginFlows loginFlows;
	MainPage mainPage;
	ChangeLogPage changeLogPage;

	// Tests
	@Test
	public void acessarChangeLogComSucesso() {
		// Objects instances
		loginFlows = new LoginFlows();
		mainPage = new MainPage();
		changeLogPage = new ChangeLogPage();

		// Parameteres
		String usuario = "administrator";
		String senha = "mantisbt";
		String mensagemEncontrouPagina = "No Change Log information available. Issues are included once projects have versions and issues are resolved with \"fixed in version\" set.";

		// Test
		loginFlows.efetuarLogin(usuario, senha);
		mainPage.clickChangeLog();

		Assert.assertEquals(mensagemEncontrouPagina, changeLogPage.returnPageChangeLogInformation());

	}
}
