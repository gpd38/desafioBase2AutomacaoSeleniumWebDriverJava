package com.javaseleniumtemplate.pages;

import com.javaseleniumtemplate.bases.PageBase;
import org.openqa.selenium.By;

public class ManagerProjectsPage extends PageBase {

    // Mapping
    By botaoCriarProjeto = By.xpath("//div[2]/div/div[1]/form//button");
    By campoNomeProjeto = By.id("project-name");
    By campoSelecionarStatus = By.id("project-status");
    By campoDescricaoProjeto = By.id("project-description");
    By checkHCG = By.xpath("//span[@class='lbl']");
    By msgSucessoTexto = By.xpath("//p[@class='bold bigger-110']");
    By msgErrorTexto = By.xpath("//p[1]");
    By botaoAdicionarProjeto = By.xpath("//input[@type='submit']");
    By botaoAtualizarProjeto = By.xpath("//input[@value='Atualizar Projeto']");
    By botaoDeletarProjeto = By.xpath("//input[@value='Apagar Projeto']");
    By botaoConfirmacaoDeletarProjeto = By.xpath("//input[@type='submit']");
    By elementTabelaDinamica;

    //Actions
    public void clicarBotaoCriarProjeto() {
        click(botaoCriarProjeto);
    }

    public void clicarBotaoAddProjeto() {
        click(botaoAdicionarProjeto);
    }

    public void clicarHCG() {
        click(checkHCG);
    }

    public void preencherNomeProjeto(String nameProject) {
        clear(campoNomeProjeto);
        sendKeys(campoNomeProjeto, nameProject);
    }

    public void preencherDescricaoProjeto(String descriptionProject) {
        clear(campoDescricaoProjeto);
        sendKeys(campoDescricaoProjeto, descriptionProject);
    }

    public void selecionarStatusProjeto(String statusProject) {
        comboBoxSelectByVisibleText(campoSelecionarStatus, statusProject);
    }

    public String returnMsgSucessoTexto() {
        return getText(msgSucessoTexto);
    }

    public String returnMsgErrorTexto() {
        return getText(msgErrorTexto);
    }

    public void selecionarEditarProjeto(String projectName) {
        elementTabelaDinamica = By.xpath("//td[contains(.,'"+projectName+"')]//a");
        click(elementTabelaDinamica);
    }

    public void editarProjeto(){
        click(botaoAtualizarProjeto);
    }

    public void deletarProjeto(){
        click(botaoDeletarProjeto);
    }

    public Boolean returnExisteElemento(String projectName) {
        elementTabelaDinamica = By.xpath("//td[contains(.,'"+projectName+"')]//a");
        return returnIfElementExists(elementTabelaDinamica);
    }

    public void clicarConfirmacaoDeletarProjeto() {
        click(botaoConfirmacaoDeletarProjeto);
    }
}