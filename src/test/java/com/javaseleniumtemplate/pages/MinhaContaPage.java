package com.javaseleniumtemplate.pages;

import com.javaseleniumtemplate.bases.PageBase;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

public class MinhaContaPage extends PageBase {

    // Mapping My Account Tab
    By pageAccountInfo = By.xpath("//h4[@class='widget-title lighter']");
    By abaPreferencias = By.xpath("//a[contains(.,'Preferências')]");
    By abaGerenciarColunas = By.xpath("//a[contains(.,'Gerenciar Colunas')]");
    By abaPerfis = By.xpath("//a[contains(.,'Perfís')]");
    By abaToken = By.xpath("//a[contains(.,'Tokens API')]");
    By campoNomeToken = By.xpath("//input[@name='token_name']");
    By botaoCriarTokenAPI = By.xpath("//input[@type='submit']");
    By mensagemErroAddToken = By.xpath("//p[@class='bold']");
    By tableToken = By.cssSelector("table.table:nth-child(1) > tbody");
    By botaoTokenApi = By.cssSelector("a.btn-primary:nth-child(6)");

    // Actions
    public String returnPageMyAccountInformation() {
        return getText(pageAccountInfo);
    }

    public void acessarAbaPreferencia() {
        click(abaPreferencias);
    }

    public void acessarAbaGerenciarColunas() {
        click(abaGerenciarColunas);
    }

    public String retornaMensagemErro() {
        return getText(mensagemErroAddToken);
    }

    public void acessarAbaPerfis() {
        click(abaPerfis);
    }

    public void acessarAbaToken() {
        click(abaToken);
    }

    public void clicarBotaoCriarTokenAPI() {
        click(botaoCriarTokenAPI);
    }

    public void preencherToken(String nomeToken) {
        clear(campoNomeToken);
        sendKeys(campoNomeToken, nomeToken);
    }

    public boolean existeToken(String nomeToken) {
        String result;
        List<WebElement> listatokens = waitForElements(tableToken);
        for (WebElement atual : listatokens) {
            result = atual.getText();
            if (result.contains(nomeToken)) {
                return true;
            }
        }
        return false;
    }

    public void retornarTelaToken() {
        click(botaoTokenApi);
    }

}
