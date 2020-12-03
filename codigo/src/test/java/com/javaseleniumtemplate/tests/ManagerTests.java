package com.javaseleniumtemplate.tests;

import org.testng.Assert;
import org.testng.annotations.Test;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.MainPage;
import com.javaseleniumtemplate.pages.ManagerPage;

public class ManagerTests extends TestBase {

	// Objects
	LoginFlows loginFlows;
	MainPage mainPage;
	ManagerPage managerPage;

	// Tests
	@Test
	public void acessarManagerComSucesso() {
		// Objects instances
		loginFlows = new LoginFlows();
		mainPage = new MainPage();
		managerPage = new ManagerPage();

		// Parameteres
		String usuario = "administrator";
		String senha = "mantisbt";
		String mensagemEncontrouPagina = "Site Information";

		// Test
		loginFlows.efetuarLogin(usuario, senha);
		mainPage.clickManager();

		Assert.assertEquals(mensagemEncontrouPagina, managerPage.returnPageManagerInformation());

	}
	
	// @Test
	public void validarAcessoAbaUsuario() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void validarAcessoAbaProjetos() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void validarAcessoAbaMarcadores() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void validarAcessoAbaPerfil() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void validarAcessoAbaGerenciarConfiguracoes() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void validarAcessoAbaGerenciarPlugins() {
		Assert.fail("Not implemented");
	}

	// User Tab Tests
	// @Test
	public void criarNovoUsuario() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void criarUsuarioRepetido() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void editarUsuario() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void desativarUsuario() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void filtrarUsuariosDesativados() {
		Assert.fail("Not implemented");
	}

	// Project Tab Tests
	// @Test
	public void criarCategoria() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void editarCategoria() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void deletarCategoria() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void criarProjeto() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void criarProjetoRepetido() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void editarProjeto() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void criarSubProjeto() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void editarSubProjeto() {
		Assert.fail("Not implemented");
	}

	// Tag Tab Tests
	// @Test
	public void criarNovoMarcador() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void deletarMarcador() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void criarMarcadorRepetido() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void editarMarcador() {
		Assert.fail("Not implemented");
	}

	// Profile Tab Tests
	// @Test
	public void criarNovoPerfil() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void deletarPerfil() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void editarPerfil() {
		Assert.fail("Not implemented");
	}

	// @Test
	public void criarPerfilRepetido() {
		Assert.fail("Not implemented");
	}

}
