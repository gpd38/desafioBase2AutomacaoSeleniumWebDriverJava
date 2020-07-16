package com.javaseleniumtemplate.pages;

import org.openqa.selenium.By;

import com.javaseleniumtemplate.bases.PageBase;

public class MainPage extends PageBase {

	// Mapping Side Menu
	By myViewLink = By.xpath("//a[contains(.,'My View')]");
	By viewIssuesLink = By.xpath("//a[contains(.,'View Issues')]");
	// By reportIssueLink = By.xpath("//span[contains(.,'Report Issue')]");
	By managerLink = By.xpath("//span[contains(.,'Manage')]");

	// Mapping Top Menu
	By reportIssueLink = By.xpath("//a[@href='/bug_report_page.php']");
	By usernameLoginInfoTextArea = By.xpath("//span[@class='user-info']");
	By inviteUserLink = By.xpath("//a[contains(.,'Invite Users')]");
	By myAccountLink = By.xpath("//a[contains(.,'My Account')]");
	By logoutLink = By.xpath("//a[contains(.,'Logout')]");
	By issueSearchField = By.xpath("//input[@name='bug_id']");

	// Actions
	public String returnUserNameLoginInformation() {
		return getText(usernameLoginInfoTextArea);
	}

	public void clickReportIssue() {
		click(reportIssueLink);
	}

}
