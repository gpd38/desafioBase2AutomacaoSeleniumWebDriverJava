package com.javaseleniumtemplate.tests;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.pages.FormularioPage;
import com.javaseleniumtemplate.utils.Utils;
import org.testng.Assert;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import java.io.IOException;

public class FormularioTests extends TestBase {
    static Utils utils;
    //Objects
    FormularioPage form;

    //ttps://docs.google.com/forms/d/e/1FAIpQLSedwSVn6AQrtRYlwJBewZA1bIsmN2K1GIpy6hXlLeFM6ahbhQ/viewform
    @DataProvider(name = "formadam")
    public static Object[][] getDadosFormularioComExcelAdam() throws IOException {

        utils = new Utils();
        String path = System.getProperty("user.dir") + "/src/test/resources/files/formadam.xls";

        int l = utils.getRowCount(path);
        int c = utils.getCellCount(path, 1);

        String LoginTestData[][] = new String[l][c];

        for (int i = 0; i < l; i++) //1
        {
            for (int j = 0; j < c; j++) //0
            {
                LoginTestData[i][j] = utils.getCellData(path, i, j);
            }
        }

        return LoginTestData;
    }

    //@Test(dataProvider = "formadam")
    public void efetuarLoginComDataDrivenAdam(String nome, String telefone, String email) {
        form = new FormularioPage();

        // Test
        form.preencherNome(nome);
        form.preencherTelefone(telefone);
        form.preencherEmail(email);
        form.clicarEnviar();

        Assert.assertEquals("Thanks for submitting your contact info!", form.getMsgSucesso());
    }

    @DataProvider(name = "formARocket")
    public static Object[][] getDadosFormularioComExcelRocket() throws IOException {

        utils = new Utils();
        String path = System.getProperty("user.dir") + "/src/test/resources/files/formAdam.xls";

        int l = utils.getRowCount(path);
        int c = utils.getCellCount(path, 1);

        String LoginTestData[][] = new String[l][c];

        for (int i = 0; i < l; i++) //1
        {
            for (int j = 0; j < c; j++) //0
            {
                LoginTestData[i][j] = utils.getCellData(path, i, j);
            }
        }

        return LoginTestData;
    }

    //@Test(dataProvider = "formRocket")
    public void efetuarLoginComDataDrivenRocket(String nome, String email, String ticket, String checkA, String checkB ) {
        form = new FormularioPage();

        // Test
        form.preencherNome(nome);
        form.preencherEmail(email);
        form.preencherTelefone(ticket);
        form.preencherNome(checkA);
        form.preencherEmail(checkB);
        form.clicarEnviar();

        Assert.assertEquals("Sua resposta foi registrada. Muito obrigado e boa sorte o/", form.getMsgSucesso());
        //Checkpoint 1/3
    }

    @DataProvider(name = "formMundi")
    public static Object[][] getDadosFormularioComExcelMundi() throws IOException {

        utils = new Utils();
        String path = System.getProperty("user.dir") + "/src/test/resources/files/formMundi.xls";

        int l = utils.getRowCount(path);
        int c = utils.getCellCount(path, 1);

        String votacao[][] = new String[l][c];

        for (int i = 0; i < l; i++) //1
        {
            for (int j = 0; j < c; j++) //0
            {
                votacao[i][j] = utils.getCellData(path, i, j);
            }
        }

        return votacao;
    }

    @Test(dataProvider = "formMundi")
    public void efetuarLoginComDataDrivenMundi(String apto, String votacao) {
        form = new FormularioMundiPage();

        // Test
        form.preencherApto(apto);
        form.preencherVotacao(votacao);
        form.clicarEnviar();

        Assert.assertEquals("Thanks for submitting your contact info!", form.getMsgSucesso());
    }

}
