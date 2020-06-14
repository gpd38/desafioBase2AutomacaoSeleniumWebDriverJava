package com.javaseleniumtemplate.tests;

import org.testng.Assert;
import org.testng.annotations.Test;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.dbsteps.UsuariosDBSteps;
import com.javaseleniumtemplate.pages.LoginPage;
import com.javaseleniumtemplate.pages.MainPage;

public class LoginTests extends TestBase {
	// Objects
	LoginPage loginPage;
	MainPage mainPage;

	// Tests
	@Test
	public void efetuarLoginComSucesso() {
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

		Assert.assertEquals(usuario, mainPage.retornaUsernameDasInformacoesDeLogin());
	}
	
	@Test
	public void efetuarLoginComSenhaErrada() {
		// Objects instances
		loginPage = new LoginPage();
		mainPage = new MainPage();

		// Parameteres
		String usuario = "administrator";
		String senha = "123456";
		String mensagemErroEsperada = "Sua conta pode estar desativada ou bloqueada ou o nome de usuário e a senha que você digitou não estão corretos."; 

		// Test
		loginPage.preenhcerUsuario(usuario);
		loginPage.clicarEmLogin();
		loginPage.preencherSenha(senha);
		loginPage.clicarEmLogin();

		Assert.assertEquals(mensagemErroEsperada, loginPage.retornaMensagemDeErro());
	}
	
	@Test
	public void efetuarLoginComUsuarioNulo() {
		// Objects instances
		loginPage = new LoginPage();
		mainPage = new MainPage();

		// Parameteres
		String usuario = "   ";
		String mensagemErroEsperada = "Sua conta pode estar desativada ou bloqueada ou o nome de usuário e a senha que você digitou não estão corretos."; 

		// Test
		loginPage.preenhcerUsuario(usuario);
		loginPage.clicarEmLogin();

		Assert.assertEquals(mensagemErroEsperada, loginPage.retornaMensagemDeErro());
	}
	
	//@Test
	public void perdeuSuaSenha() {
		// Objects instances
		loginPage = new LoginPage();
		mainPage = new MainPage();

		// Parameteres
		String usuario = "administrator";
		String url = "http://192.168.99.100:8989/lost_pwd_page.php";

		// Test
		loginPage.preenhcerUsuario(usuario);
		loginPage.clicarEmLogin();
		//loginPage.clicarEmPerdeuSenha();
		//loginPage.preencherEmail(email);
		//loginPage.clicarEmEnviar();
		
		Assert.assertEquals(url, loginPage.getURL());

	}

	//@Test
	public void efetuarLoginComSucesso_SenhaRetornadaDoDB() {
		// Objects instances
		loginPage = new LoginPage();
		mainPage = new MainPage();

		// Parameteres
		String usuario = "administrator";
		String senha = UsuariosDBSteps.retornaSenhaDoUsuarioDB(usuario);

		// Test
		loginPage.preenhcerUsuario(usuario);
		loginPage.clicarEmLogin();
		loginPage.preencherSenha(senha);
		loginPage.clicarEmLogin();

		Assert.assertEquals(usuario, mainPage.retornaUsernameDasInformacoesDeLogin());
	}

}
