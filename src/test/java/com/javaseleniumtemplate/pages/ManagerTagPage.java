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
    By elementoTagPesquisado;

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

    public boolean existeElementoEspecifico(String tag) {
        List<WebElement> listaTags = waitForElements(tabelaTag);
        System.out.println("QTD LISTA: " + listaTags.size());
        for (WebElement atual : listaTags) {
            elementoTagPesquisado = By.xpath("//a[contains(.,'" + atual.getText() + "')]");
            if (getText(elementoTagPesquisado).equalsIgnoreCase(tag))
                return true;
        }
        return false;
    }

    public By pesquisarElementoEspecifico(String tag) {
        List<WebElement> listaTags = waitForElements(tabelaTag);
        for (WebElement atual : listaTags) {
            elementoTagPesquisado = By.xpath("//a[contains(.,'" + atual + "')]");
            if (returnIfElementExists(elementoTagPesquisado) && getText(elementoTagPesquisado).equalsIgnoreCase(tag))
                return (elementoTagPesquisado);
        }
        return null;
    }

    public void clicarNoElementoEncontrado(String tag) {
        click(pesquisarElementoEspecifico(tag));
    }

    public String returnEdicaoSucesso() {
        return getText(textoEdicao);
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