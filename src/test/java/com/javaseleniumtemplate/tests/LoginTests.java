package com.javaseleniumtemplate.tests;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.pages.LoginPage;
import com.javaseleniumtemplate.pages.MainPage;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.testng.Assert;
import org.testng.annotations.Test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;

public class LoginTests extends TestBase {
    //Objects
    LoginPage loginPage;
    MainPage mainPage;

    //Tests
    @Test
    public void efetuarLoginComSucesso() {
        //Objects instances
        loginPage = new LoginPage();
        mainPage = new MainPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";

        //Test
        loginPage.preencherUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();

        //Validation
        Assert.assertEquals(usuario, mainPage.retornaUsernameDasInformacoesDeLogin());
    }

    @Test
    public void efetuarLoginComSenhaIncorreta() {
        loginPage = new LoginPage();
        mainPage = new MainPage();

        // Parameteres
        String usuario = "administrator";
        String senha = "123456";
        String mensagemErroEsperadaPT = "Sua conta pode estar desativada ou bloqueada ou o nome de usuário e a senha que você digitou não estão corretos.";

        // Test
        loginPage.preencherUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.preencherSenha(senha);
        loginPage.clicarEmLogin();

        Assert.assertEquals(mensagemErroEsperadaPT, loginPage.retornaMensagemDeErro());
    }

    @Test
    public void efetuarLoginComUsuarioIncorreto() {
        loginPage = new LoginPage();
        mainPage = new MainPage();

        // Parameteres
        String mensagemErroEsperadaPT = "Sua conta pode estar desativada ou bloqueada ou o nome de usuário e a senha que você digitou não estão corretos.";

        // Test: Usuario nulo
        loginPage.clicarEmLogin();

        Assert.assertEquals(mensagemErroEsperadaPT, loginPage.retornaMensagemDeErro());
    }

    @Test
    public void perdeuSuaSenha() {
        // Objects instances
        loginPage = new LoginPage();
        mainPage = new MainPage();

        // Parameteres
        String usuario = "administrator";
        String mensagemEncontrouPagina = "Reajuste de Senha";

        // Test
        loginPage.preencherUsuario(usuario);
        loginPage.clicarEmLogin();
        loginPage.clicarEmPerdeuSenha();

        Assert.assertEquals(mensagemEncontrouPagina, loginPage.returnPagePerdeuSenhaInformation());

    }

    @Test
    public void efetuarLoginComUsandoDataDriven() {

        loginPage = new LoginPage();
        mainPage = new MainPage();

        // Parameteres
        String usuario ,senha ,resposta;
        FileInputStream file;
        HSSFWorkbook workBook ;
        HSSFSheet sheet;
        Iterator<Row> rows;
        Row row;
        String caminhoArquivo = "src/test/resources/files/LoginTestData.xls";

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
                    usuario = row.getCell(0).getStringCellValue();
                    senha = row.getCell(1).getStringCellValue();
                    resposta = row.getCell(2).getStringCellValue();

                    // Test
                    loginPage.preencherUsuario(usuario);
                    loginPage.clicarEmLogin();
                    loginPage.preencherSenha(senha);
                    loginPage.clicarEmLogin();

                    Assert.assertEquals(resposta, loginPage.retornaUrlAtualTratada());
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
