package com.javaseleniumtemplate.pages;

import org.openqa.selenium.By;

import com.javaseleniumtemplate.bases.PageBase;

public class MyAccountPage extends PageBase {

	// Mapping My Account Tab
	By userName = By.xpath("//td[contains(.,'administrator')]");
	By currentPassword = By.xpath("//input[@name='password_current']");
	By newPassword = By.xpath("//input[@name='password']");
	By confirmPassword = By.xpath("//input[@name='password_confirm']");
	By email = By.xpath("//input[@name='email']");
	By realName = By.xpath("//input[@name='realname']");
	// By accessLevel = By.xpath("");
	// By projectAccessLevel = By.xpath("");
	By buttonUpdateUser = By.xpath("//input[contains(@value,'Update User')]");

	// Mapping Tab Profile
	By tabProfileLink = By.xpath("//a[contains(.,'Profiles')]");
	By plataform = By.xpath("//input[@name='platform']");
	By operationalSystem = By.xpath("//input[@name='os']");
	By osVersion = By.xpath("//input[@name='os_build']");
	By description = By.xpath("//textarea[@name='description']");
	By buttonAddProfile = By.xpath("//input[@value='Add Profile']");

	// Mapping Token Tab
	By tabTokenLink = By.xpath("//a[contains(.,'API Tokens')]");
	By tokenName = By.xpath("//input[@name='token_name']");
	By buttonCreateAPIToken = By.xpath("//input[@value='Create API Token']");

	// Actions
	public String getNomeUsuario() {
		return getText(userName);
	}

	public void preencherPasswordAtual(String senhaAtual) {
		sendKeys(currentPassword, senhaAtual);
	}

	public void preencherPasswordNovo(String senhaNova) {
		sendKeys(newPassword, senhaNova);
	}

	public void preencherEmail(String _email) {
		sendKeys(email, _email);
	}

	public String retornaEmail() {
		return getText(email);
	}

	public void preencherRealName(String _realName) {
		sendKeys(realName, _realName);
	}

	public String retornaRealName() {
		return getText(realName);
	}

	public void clicarEmAtualizarUsuario() {
		click(buttonUpdateUser);
	}

}
