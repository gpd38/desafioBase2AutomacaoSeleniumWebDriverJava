package com.javaseleniumtemplate.tests;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.ManagerPage;
import com.javaseleniumtemplate.pages.ManagerProfilePage;
import com.javaseleniumtemplate.utils.Utils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.testng.Assert;
import org.testng.annotations.Test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;

public class ManagerProfileTests extends TestBase {

    // Objects
    LoginFlows loginFlows;
    ManagerPage managerPage;
    ManagerProfilePage managerProfilePage;

    @Test
    public void cadastrarProfile() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerProfilePage = new ManagerProfilePage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String plataforma = "Plataforma " + id;
        String sistemaOperacional = "SO " + id;
        String versaoSO = "Versão " + id;
        String descricao = "Descrição " + id;

        String concatProfile = plataforma + " " + sistemaOperacional + " " + versaoSO;

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerGlobalProfilesTab();
        managerProfilePage.preencherPlataforma(plataforma);
        managerProfilePage.preencherSistemaOperacional(sistemaOperacional);
        managerProfilePage.preencherVersaoSO(versaoSO);
        managerProfilePage.preencherDescricao(descricao);
        managerProfilePage.clicarAddPerfil();

        Assert.assertTrue(managerProfilePage.existePerfilCadastrado(concatProfile));
    }

    // script de banco deixa um cadastrado para este cenário não retornar erro inicialmente
    @Test
    public void validarClickBotaoEnviarSemInformacao() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerProfilePage = new ManagerProfilePage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String msgErrorEnviarVazio = "APPLICATION ERROR #200";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerGlobalProfilesTab();
        managerProfilePage.clicarEnviar();

        Assert.assertEquals(msgErrorEnviarVazio, managerProfilePage.retornaMensagemDeErroSemInformacao());
    }

    @Test
    public void efetuarCadastroProfileUsandoDataDriven() {
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerProfilePage = new ManagerProfilePage();

        // Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String plataforma, so, versao, descricao;
        FileInputStream file;
        HSSFWorkbook workBook;
        HSSFSheet sheet;
        Iterator<Row> rows;
        Row row;
        String caminhoArquivo = "src/test/resources/files/PerfilTestData.xls";

        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerGlobalProfilesTab();

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
                    plataforma = row.getCell(0).getStringCellValue();
                    so = row.getCell(1).getStringCellValue();
                    versao = row.getCell(2).getStringCellValue();
                    descricao = row.getCell(3).getStringCellValue();

                    // Test
                    managerProfilePage.preencherPlataforma(plataforma);
                    managerProfilePage.preencherSistemaOperacional(so);
                    managerProfilePage.preencherVersaoSO(versao);
                    managerProfilePage.preencherDescricao(descricao);
                    managerProfilePage.clicarAddPerfil();

                    String concatProfile = plataforma + " " + so + " " + versao;

                    Assert.assertTrue(managerProfilePage.existePerfilCadastrado(concatProfile));
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