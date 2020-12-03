package com.javaseleniumtemplate.pages;

import org.openqa.selenium.By;

import com.javaseleniumtemplate.bases.PageBase;

public class LoginPage extends PageBase {
	// Mapping
	By usernameField = By.name("username");
	By passwordField = By.name("password");
	By loginButton = By.xpath("//input[@type='submit']");
	By mensagemErroTextArea = By.xpath("//p[contains(.,'Your account may be disabled or blocked or the username/password you entered is incorrect.')]");
	By linkCreateNewAccount = By.xpath("//a[contains(.,'criar uma nova conta')]");
	By linkLostYourPassword = By.xpath("//a[@class='pull-right']");
	By pageViewIssueInfo = By.xpath("//h4[contains(.,'Password Reset')]");

	// Actions
	public void preenhcerUsuario(String usuario) {
		sendKeys(usernameField, usuario);
	}

	public void preencherSenha(String senha) {
		sendKeys(passwordField, senha);
	}

	public void clicarEmLogin() {
		click(loginButton);
	}

	public String retornaMensagemDeErro() {
		return getText(mensagemErroTextArea);
	}

	public Boolean existeBotaoEntrar() {
		return returnIfElementExists(loginButton);
	}

	public void clicarEmPerdeuSenha() {
		click(linkLostYourPassword);
	}

	public String returnPagePerdeuSenhaInformation() {
		return getText(pageViewIssueInfo);
	}

}
