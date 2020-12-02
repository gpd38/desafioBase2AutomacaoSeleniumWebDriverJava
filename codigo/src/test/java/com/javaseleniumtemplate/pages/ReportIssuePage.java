package com.javaseleniumtemplate.pages;

import org.openqa.selenium.By;

import com.javaseleniumtemplate.bases.PageBase;

public class ReportIssuePage extends PageBase {

	// Mapping Report Issue
	//By pageReportIssueInfo = By.xpath("//h4[contains(.,'Enter Issue Details')]");
	By categoryComboBox = By.name("category_id");
	By reproducibilityComboBox = By.id("reproducibility");
	By severityComboBox = By.id("severity");
	By priorityComboBox = By.id("priority");
	By selectProfileComboBox = By.id("profile_id");
	By createNewOptionProfile = By.xpath("//i[contains(@title,'+')]");
	By newPlatformProfile = By.id("platform");
	By newOsProfile = By.id("os");
	By newOsVersionProfile = By.id("os_build");
	By assignToComboBox = By.id("handler_id");
	By summaryField = By.xpath("//input[@name='summary']");
	By descriptionField = By.xpath("//textarea[@name='description']");
	By stepToReproduceField = By.name("steps_to_reproduce");
	By additionalInformationField = By.name("additional_info");
	By tagField = By.name("tag_string");
	By tagComboBox = By.id("tag_select");
	// By uploadFileField = By.xpath(//span[contains(.,'Attach files by dragging & dropping, selecting or pasting them.')]");
	By uploadFileField = By.id("ufile[]"); // Validar se está funcionando
	By submitButton = By.xpath("//input[@type='submit']");
	By messageRetornoSuccess = By.xpath("//p[contains(.,'Operation successful.')]");
	By selectProjectAccessBugReport = By.xpath("//input[@value='Select Project']");

	// Actions
	public String returnPageReportIssueInformation() {
		return getText(messageRetornoSuccess);
	}

	public void selecionarProjetoInicial() {
		click(selectProjectAccessBugReport);
	}

	public void selecionarCategoria(String categoria) {
		comboBoxSelectByVisibleText(categoryComboBox, categoria);
	}

	public void preencherResumo(String resumo) {
		sendKeys(summaryField, resumo);
	}

	public void preencherDescricao(String descricao) {
		sendKeys(descriptionField, descricao);
	}

	public void InserirAnexo(String caminhoArquivo) {
		sendKeysWithoutWaitVisible(uploadFileField, caminhoArquivo);
	}

	public void ClicarEmSubmitReport() {
		click(submitButton);
	}

	public String returnMessageSuccess() {
		return getText(messageRetornoSuccess);
	}

}
