package com.javaseleniumtemplate.tests;

import org.testng.Assert;
import org.testng.annotations.Test;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.MainPage;
import com.javaseleniumtemplate.pages.RoadmapPage;

public class RoadmapTests extends TestBase {
	// Objects
	LoginFlows loginFlows;
	MainPage mainPage;
	RoadmapPage roadmapPage;

	// Tests
	@Test
	public void acessarRoadmapComSucesso() {
		// Objects instances
		loginFlows = new LoginFlows();
		mainPage = new MainPage();
		roadmapPage = new RoadmapPage();

		// Parameteres
		String usuario = "administrator";
		String senha = "mantisbt";
		String mensagemEncontrouPagina = "No Roadmap information available. Issues are included once projects have versions and issues have \"target version\" set.";

		// Test
		loginFlows.efetuarLogin(usuario, senha);
		mainPage.clickRoadmap();

		Assert.assertEquals(mensagemEncontrouPagina, roadmapPage.returnPageRoadmapInformation());

	}
}
