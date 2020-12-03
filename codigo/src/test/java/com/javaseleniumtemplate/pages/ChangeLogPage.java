package com.javaseleniumtemplate.pages;

import org.openqa.selenium.By;

import com.javaseleniumtemplate.bases.PageBase;

public class ChangeLogPage extends PageBase {

	// Mapping Change Log Page
	By pageChangeLogInfo = By.xpath("//p[@class='lead'][contains(.,'No Change Log information available.')]");

	// Actions
	public String returnPageChangeLogInformation() {
		return getText(pageChangeLogInfo);
	}
}
