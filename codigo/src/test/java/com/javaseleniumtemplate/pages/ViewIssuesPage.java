package com.javaseleniumtemplate.pages;

import org.openqa.selenium.By;

import com.javaseleniumtemplate.bases.PageBase;

public class ViewIssuesPage extends PageBase {

	// Mapping View Issue Page
	By pageViewIssueInfo = By.xpath("//h4[contains(.,'Viewing Issues')]");
	By buttonResetFilter = By.xpath("//a[contains(.,'Reset')]");
	By buttonSaveFilter = By.xpath("//a[contains(.,'Save')]");
	By searchFilterField = By.xpath("//input[@class='input-sm']");
	By buttonApplyFilter = By.xpath("//input[contains(@value,'Apply Filter')]");
	By buttonPrintReports = By.xpath("//a[contains(.,'Print Reports')]");
	By buttonCSVExport = By.xpath("//a[contains(.,'CSV Export')]");
	By buttonExcelExport = By.xpath("//a[contains(.,'Excel Export')]");
	By buttonSumary = By.xpath("//a[@class='btn btn-primary btn-white btn-round btn-sm'][contains(.,'Summary')]");
	By advancedFilterLink = By.xpath("//a[contains(.,'Advanced Filters')]");
	By createPermaLink = By.xpath("//a[contains(.,'Create Permalink')]");
	By checkSelectAllIssue = By.xpath("//span[@class='lbl padding-6']");
	By selectActionIssue = By.xpath("//select[@name='action']");
	By buttonOkActionIssue = By.xpath("//input[@value='OK']");

	// Actions
	public String returnPageViewIssueInformation() {
		return getText(pageViewIssueInfo);
	}
	
	public String returnPageViewIssuesURL() {
		return getURL();
	}

}
