package com.javaseleniumtemplate.pages;

import com.javaseleniumtemplate.bases.PageBase;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

public class ManagerTagPage extends PageBase {

    // Mapping
    By botaoAcessoCriarTag = By.xpath("//div[4]//div[1]/a[1]");
    By campoNomeTag = By.id("tag-name");
    By campoDescricaoTag = By.id("tag-description");
    By tabelaTag = By.xpath("//tr/td/a");
    By botaoCadastrarTag = By.name("config_set");
    By textoEdicao = By.xpath("//h4[@class='widget-title lighter']");
    By botaoAtualizarTag = By.xpath("//input[@value='Atualizar Marcador']");
    By botaoConfirmarDeletarTag = By.xpath("//input[@type='submit']");
    By botaoDeletarTag = By.xpath("//input[@value='Apagar Marcador']");

    //Actions
    public void clicarBotaoCriarTag() {
        click(botaoAcessoCriarTag);
    }

    public void clicarBotaoAddTag() {
        click(botaoCadastrarTag);
    }

    public void preencherNomeTag(String tagName) {
        sendKeys(campoNomeTag, tagName);
    }

    public void preencherDescricaoTag(String descriptionTag) {
        sendKeys(campoDescricaoTag, descriptionTag);
    }

    public void clicarElementoEspecifico(String thisElement) {
        WebElement findElement = search(thisElement);
        assert findElement != null;
        findElement.click();
    }

    public String returnEdicaoSucesso() {
        return getText(textoEdicao);
    }

    public List<WebElement> getAllElements() {
        return (waitForElements(tabelaTag));
    }

    private WebElement search(String searchItem) {
        String result;
        List<WebElement> listaTags = getAllElements();
        for (WebElement atual : listaTags) {
            result = atual.getText();
            if (result.contains(searchItem)) {
                return atual;
            }
        }
        return null;
    }

    public Boolean existeElemento(String tagName) {
        return search(tagName) != null;
    }

    public void clicarBotaoAtualizarTag() {
        click(botaoAtualizarTag);
    }

    public void limparCampoTagName() {
        clear(campoNomeTag);
    }

    public void clicarBotaoDeletarTag() {
        click(botaoDeletarTag);
    }

    public void clicarBotaoConfirmarDeletarTag() {
        click(botaoConfirmarDeletarTag);
    }
}