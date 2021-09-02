package com.javaseleniumtemplate.pages;

import com.javaseleniumtemplate.bases.PageBase;
import org.openqa.selenium.By;

public class ManagerUsersPage extends PageBase {

    // Mapping
    By botaoAcessoCriarUsuario = By.xpath("//div[2]/div[1]/div/div[1]/a");
    By botaoAdicionarUsuario = By.xpath("//input[@type='submit']");
    By botaoRedefinirSenha = By.xpath("//form[@id='manage-user-reset-form']//input[@type='submit']");
    By campoNomeUsuario = By.id("user-username");
    By campoNomeRealUsuario = By.id("user-realname");
    By campoEmail = By.id("email-field");
    By campoNivelDeAcesso = By.id("user-access-level");
    By msgSucessoTexto = By.xpath("//p[@class='bold bigger-110']");
    By msgErroTexto = By.xpath("//p[@class='bold']");

    //Actions
    public void clickButtonCreateUser() {
        click(botaoAcessoCriarUsuario);
    }

    public void clicarCadastrar() {
        click(botaoAdicionarUsuario);
    }

    public void clicarRedefinirSenha() {
        click(botaoRedefinirSenha);
    }

    public void preencherUserName(String userName) {
        sendKeys(campoNomeUsuario, userName);
    }

    public void preencherRealName(String realName) {
        sendKeys(campoNomeRealUsuario, realName);
    }

    public void preencherEmail(String email) {
        sendKeys(campoEmail, email);
    }

    public void preencherLevel(String accessLevel) {
        comboBoxSelectByVisibleText(campoNivelDeAcesso, accessLevel);
    }

    public String returnMsgSucessoTexto() {
        return getText(msgSucessoTexto);
    }

    public String returnMsgErro() {
        return getText(msgErroTexto);
    }

}