package com.javaseleniumtemplate.pages;

import org.openqa.selenium.By;

import com.javaseleniumtemplate.bases.PageBase;

public class MyViewPage extends PageBase {

	// Mapping Page Content   
	//By pageMyViewInfo = By.xpath("//h4[contains(.,'Timeline')]");
	By buttonAssignedToMe = By.xpath("//a[contains(.,'Viewing Issues')]");
	By buttonUnassigned = By.xpath("//a[contains(.,'Unassigned')]");
	By buttonReportedByMe = By.xpath("//a[contains(.,'Reported by Me')]");
	By buttonResolved = By.xpath("//a[contains(.,'Resolved')]");
	By buttonRecentlyModified = By.xpath("//a[contains(.,'Recently Modified (30 Days)')]");
	By buttonMonitoredByMe = By.xpath("//a[@class='white'][contains(.,'Monitored by Me')]");

//	public String returnPageMyViewIssuesInformation() {
//		return getText(pageMyViewInfo);
//	}

	public String returnPageMyViewURL() {
		return getURL();
	}

}
