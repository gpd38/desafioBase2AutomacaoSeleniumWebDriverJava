package com.javaseleniumtemplate.tests;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.testng.Assert;
import org.testng.annotations.Test;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.pages.LoginPage;
import com.javaseleniumtemplate.pages.MainPage;

public class LoginTests extends TestBase {
	// Objects
	LoginPage loginPage;
	MainPage mainPage;
	//Utils util;

	// Tests
	@Test
	public void efetuarLoginComSucesso() {
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

		Assert.assertEquals(usuario, mainPage.returnUserNameLoginInformation());
	}

	@Test
	public void efetuarLoginComSenhaIncorreta() {
		loginPage = new LoginPage();
		mainPage = new MainPage();

		// Parameteres
		String usuario = "administrator";
		String senha = "123456";
		String mensagemErroEsperada = "Your account may be disabled or blocked or the username/password you entered is incorrect.";

		// Test
		loginPage.preenhcerUsuario(usuario);
		loginPage.clicarEmLogin();
		loginPage.preencherSenha(senha);
		loginPage.clicarEmLogin();

		Assert.assertEquals(mensagemErroEsperada, loginPage.retornaMensagemDeErro());
	}

	@Test
	public void efetuarLoginComUsuarioIncorreto() {
		loginPage = new LoginPage();
		mainPage = new MainPage();

		// Parameteres
		String mensagemErroEsperada = "Your account may be disabled or blocked or the username/password you entered is incorrect.";

		// Test: Usuário nulo
		loginPage.clicarEmLogin();

		Assert.assertEquals(mensagemErroEsperada, loginPage.retornaMensagemDeErro());
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

	/**
	 * Precisa melhorar validação para celula vazia e celula de resposta correta
	 */
	@Test
	public void efetuarLoginComSucessoUsandoDataDriven() {
		loginPage = new LoginPage();
		mainPage = new MainPage();

		// Parameteres
		String usuario = null;
		String senha = null;
		String resposta = null;
		FileInputStream file = null;
		HSSFWorkbook workBook = null;
		HSSFSheet sheet = null;
		Iterator<Row> rows = null;
		Iterator<Cell> cells = null;
		Row row = null;
		Cell cell = null;
		String caminhoArquivo = "src/test/resources/dataDriven/usuarios.xls";

		try {
			file = new FileInputStream(caminhoArquivo);
			try {
				workBook = new HSSFWorkbook(file);
				// Escolhendo a aba ZERO da planilha
				sheet = workBook.getSheetAt(0);
				// Armazena todas as linhas da planilha
				rows = sheet.iterator();
				while (rows.hasNext()) {
					// Armazena uma linha para ser trabalhada
					row = rows.next();
					usuario = (row.getCell(0)).getStringCellValue();
					senha = (row.getCell(1)).getStringCellValue();
					resposta = row.getCell(2).getStringCellValue();
					// Test
					loginPage.preenhcerUsuario(usuario);
					loginPage.clicarEmLogin();
					loginPage.preencherSenha(senha);
					loginPage.clicarEmLogin();

					Assert.assertEquals(resposta, loginPage.retornaMensagemDeErro());

					row = null;
					usuario = null;
					senha = null;
					resposta = null;
				}
				workBook.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	//@Test
	public void efetuarLoginComSucessoUsandoBanco() {
		Assert.fail("Not implemented");
		// refazer01();
	}

	private void refazer01() {
		// Objects instances
		// loginPage = new LoginPage();
		// mainPage = new MainPage();

		// Parameteres
		// String usuario = "administrator";
		// String senhaTemp = "mantisbt";
		// String senha = UsuariosDBSteps.retornaSenhaDoUsuarioDB(usuario);

		// MessageDigest m;
		// try {
		// m = MessageDigest.getInstance("MD5");
		// m.update(senhaTemp.getBytes(),0,senhaTemp.length());
		// String senhaMD5 = new BigInteger(1,m.digest()).toString(16);
		// } catch (NoSuchAlgorithmException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }

		// Test
		// loginPage.preenhcerUsuario(usuario);
		// loginPage.clicarEmLogin();
		// loginPage.preencherSenha(senha);
		// loginPage.clicarEmLogin();

		// Assert.assertEquals(usuario, mainPage.returnUserNameLoginInformation());
	}

}
