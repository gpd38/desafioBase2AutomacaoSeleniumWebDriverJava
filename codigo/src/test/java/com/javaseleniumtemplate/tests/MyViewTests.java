package com.javaseleniumtemplate.tests;

import org.testng.Assert;
import org.testng.annotations.Test;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.MainPage;
import com.javaseleniumtemplate.pages.MyViewPage;

public class MyViewTests extends TestBase {
	// Objects
	LoginFlows loginFlows;
	MainPage mainPage;
	MyViewPage myViewPage;

	// Tests
	@Test
	public void acessarMyViewComSucesso() {
		// Objects instances
		loginFlows = new LoginFlows();
		mainPage = new MainPage();
		myViewPage = new MyViewPage();

		// Parameteres
		String usuario = "administrator";
		String senha = "mantisbt";
		String mensagemEncontrouPagina = "Timeline";

		// Test
		loginFlows.efetuarLogin(usuario, senha);
		mainPage.clickMyView();

		Assert.assertEquals(mensagemEncontrouPagina, myViewPage.returnPageMyViewInformation());

	}

	@Test
	public void validarURLPage() {
		// Objects instances
		loginFlows = new LoginFlows();
		mainPage = new MainPage();
		myViewPage = new MyViewPage();

		// Parameteres
		String usuario = "administrator";
		String senha = "mantisbt";
		String urlPage = "http://192.168.99.100:8989/my_view_page.php";

		// Test
		loginFlows.efetuarLogin(usuario, senha);
		mainPage.clickMyView();

		Assert.assertEquals(urlPage, myViewPage.returnPageMyViewURL());

	}

	// @Test
	public void validarAcessoAssignedToMe() {
		Assert.fail("Not implemented");
	}

}
