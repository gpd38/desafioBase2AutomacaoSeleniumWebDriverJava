package com.javaseleniumtemplate.pages;

import com.javaseleniumtemplate.bases.PageBase;
import org.openqa.selenium.By;

public class LoginPage extends PageBase {
    //Mapping
    By campoUsername = By.id("username");
    By campoPassword = By.id("password");
    By botaoLogin = By.xpath("//input[@type='submit']");
    By mensagemErroTextArea = By.xpath("//div[4]");
    By linkPerdeuSuaSenha = By.xpath("//a[@class='pull-right']");
    By pageViewIssueInfo = By.xpath("//h4[@class='header lighter bigger']");

    //Actions
    public void preencherUsuario(String usuario) {
        clear(campoUsername);
        sendKeys(campoUsername, usuario);
    }

    public void preencherSenha(String senha) {
        clear(campoPassword);
        sendKeys(campoPassword, senha);
    }

    public void clicarEmLogin() {
        click(botaoLogin);
    }

    public String retornaMensagemDeErro() {
        return getText(mensagemErroTextArea);
    }

    public void clicarEmPerdeuSenha() {
        click(linkPerdeuSuaSenha);
    }

    public String returnPagePerdeuSenhaInformation() {
        return getText(pageViewIssueInfo);
    }

    public String retornaUrlAtualTratada() {
        return (getURLSemParametros());
    }
}
