package com.javaseleniumtemplate.pages;

import org.openqa.selenium.By;

import com.javaseleniumtemplate.bases.PageBase;

public class SummaryPage extends PageBase {

	// Mapping Change Log Page
	By pageSummaryInfo = By.xpath("//span[contains(.,'Summary')]");

	// Actions
	public String returnPageSummaryInformation() {
		return getText(pageSummaryInfo);
	}
}
