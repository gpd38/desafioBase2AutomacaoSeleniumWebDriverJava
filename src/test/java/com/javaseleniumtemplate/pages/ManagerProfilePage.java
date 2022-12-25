package com.javaseleniumtemplate.pages;

import com.javaseleniumtemplate.bases.PageBase;
import org.openqa.selenium.By;

public class ManagerProfilePage extends PageBase {

    // Mapping
    By botaoCriarPerfil = By.xpath("//fieldset[1]//div[2]/input[1]");
    By campoPlataforma = By.id("platform");
    By campoSO = By.id("os");
    By campoVersaoSO = By.id("os-version");
    By campoDescricao = By.id("description");
    By msgErrorEnviaSemInformacao = By.xpath("//p[1]");
    By botaoEnviar = By.xpath("//input[@value='Enviar']");
    By dropdownPerfil = By.id("select-profile");

    //Actions
    public void clicarAddPerfil() {
        click(botaoCriarPerfil);
    }

    public void preencherPlataforma(String plataforma) {
        clear(campoPlataforma);
        sendKeys(campoPlataforma, plataforma);
    }

    public void preencherSistemaOperacional(String SO) {
        clear(campoSO);
        sendKeys(campoSO, SO);
    }

    public void preencherVersaoSO(String versionSO) {
        clear(campoVersaoSO);
        sendKeys(campoVersaoSO, versionSO);
    }

    public void preencherDescricao(String descricao) {
        clear(campoDescricao);
        sendKeys(campoDescricao, descricao);
    }

    public void clicarEnviar() {
        click(botaoEnviar);
    }

    public String retornaMensagemDeErroSemInformacao() {
        return getText(msgErrorEnviaSemInformacao);
    }

    public boolean existePerfilCadastrado(String concatProfile) {
        comboBoxSelectByVisibleText(dropdownPerfil, concatProfile);
        return true;
    }
}