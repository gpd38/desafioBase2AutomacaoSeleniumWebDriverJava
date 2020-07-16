package com.javaseleniumtemplate.pages;

import org.openqa.selenium.By;

import com.javaseleniumtemplate.bases.PageBase;

public class ViewIssuesPage extends PageBase {
	
	// Mapping View Issue Page
	By buttonResetFilter = By.xpath("//a[contains(.,'Reset')]");
	By buttonSaveFilter = By.xpath("//a[contains(.,'Save')]");
	By searchFilterField = By.xpath("//input[@class='input-sm']");
	By buttonApplyFilter = By.xpath("//input[contains(@value,'Apply Filter')]");
	By buttonPrintReports = By.xpath("//a[contains(.,'Print Reports')]");
	By buttonCSVExport = By.xpath("//a[contains(.,'CSV Export')]");
	By buttonExcelExport = By.xpath("");
	By buttonSumary = By.xpath("");
	By advancedFilterLink = By.xpath("");
	By createPermaLink = By.xpath("");

}
