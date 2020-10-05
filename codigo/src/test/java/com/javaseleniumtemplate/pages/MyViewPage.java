package com.javaseleniumtemplate.pages;

import org.openqa.selenium.By;

import com.javaseleniumtemplate.bases.PageBase;

public class MyViewPage extends PageBase {
	
	//MyViewPage = MainPage

	// Mapping Page Content
	By buttonAssignedToMe = By.xpath("//a[contains(.,'Assigned to Me (Unresolved)')]");
	By buttonUnassigned = By.xpath("//a[contains(.,'Unassigned')]");
	By buttonReportedByMe = By.xpath("//a[contains(.,'Reported by Me')]");
	By buttonResolved = By.xpath("//a[contains(.,'Resolved')]");
	By buttonRecentlyModified = By.xpath("//a[contains(.,'Recently Modified (30 Days)')]");
	By buttonMonitoredByMe = By.xpath("//a[@class='white'][contains(.,'Monitored by Me')]");

}
