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
import com.javaseleniumtemplate.dbsteps.UsuariosDBSteps;
import com.javaseleniumtemplate.pages.LoginPage;
import com.javaseleniumtemplate.pages.MainPage;
import com.javaseleniumtemplate.utils.Utils;

public class LoginTests extends TestBase {
	// Objects
	LoginPage loginPage;
	MainPage mainPage;
	Utils util;

	// Tests
	//@Test
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

		Assert.assertEquals(usuario, mainPage.returnUserNameLoginInformation());
	}

	//@Test
	public void efetuarLoginComSenhaErrada() {
		// Objects instances
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

	//@Test
	public void efetuarLoginComUsuarioNulo() {
		// Objects instances
		loginPage = new LoginPage();
		mainPage = new MainPage();

		// Parameteres
		String mensagemErroEsperada = "Your account may be disabled or blocked or the username/password you entered is incorrect.";

		// Test
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
		// loginPage.clicarEmPerdeuSenha();
		// loginPage.preencherEmail(email);
		// loginPage.clicarEmEnviar();

		Assert.assertEquals(url, loginPage.getURL());

	}

	// @Test
	public void efetuarLoginComSucessoSenhaRetornadaDoDB() {
		// Objects instances
		loginPage = new LoginPage();
		mainPage = new MainPage();

		// Parameteres
		String usuario = "administrator";
		// String senhaTemp = "mantisbt";
		String senha = UsuariosDBSteps.retornaSenhaDoUsuarioDB(usuario);

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
		loginPage.preenhcerUsuario(usuario);
		loginPage.clicarEmLogin();
		loginPage.preencherSenha(senha);
		loginPage.clicarEmLogin();

		Assert.assertEquals(usuario, mainPage.returnUserNameLoginInformation());
	}

	/**
	 * Precisa corrigir erro de celula vazia para usuario e senha Precisa corrigir o
	 * erro quando a celula é número inteiro - senha
	 */
	//@Test
	public void efetuarLoginComSucessoDataDriven() {
		// Objects instances
		loginPage = new LoginPage();
		mainPage = new MainPage();
		util = new Utils();

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

}
