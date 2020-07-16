package com.javaseleniumtemplate.pages;

import org.openqa.selenium.By;

import com.javaseleniumtemplate.bases.PageBase;

public class BugReportPage extends PageBase {

	// Mapping Report Issue
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
	By summaryField = By.name("summary");
	By descriptionField = By.name("description");
	By stepToReproduceField = By.name("steps_to_reproduce");
	By additionalInformationField = By.name("additional_info");
	By tagField = By.name("tag_string");
	By tagComboBox = By.id("tag_select");
	// By uploadFileField = By.xpath(//span[contains(.,'Attach files by dragging & dropping, selecting or pasting them.')]");
	By uploadFileField = By.id("ufile[]"); // Validar se está funcionando
	By submitButton = By.xpath("//input[@value='Submit Issue']");

	// Actions
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
}
