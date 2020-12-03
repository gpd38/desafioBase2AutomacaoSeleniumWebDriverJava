package com.javaseleniumtemplate.pages;

import org.openqa.selenium.By;

import com.javaseleniumtemplate.bases.PageBase;

public class MainPage extends PageBase {

	// MainPage = MyViewPage

	// Mapping Side Menu
	By myViewLink = By.xpath("//span[contains(.,'My View')]");
	By viewIssuesLink = By.xpath("//span[contains(.,'View Issues')]");
	By reportIssueLinkLateral = By.xpath("//span[contains(.,'Report Issue')]");
	By changeLogLink = By.xpath("//span[contains(.,'Change Log')]");
	By roadmapLink = By.xpath("//span[contains(.,'Roadmap')]");
	By summaryLink = By.xpath("//span[contains(.,'Summary')]");
	By managerLink = By.xpath("//span[contains(.,'Manage')]");

	// Mapping Top Menu
	// By reportIssueLinkSuperior = By.xpath("//a[@href='/bug_report_page.php']");
	By inviteUserLink = By.xpath("//a[contains(.,'Invite Users')]");
	// By allProjectLink = By.xpath("");
	By usernameLoginInfoTextArea = By.xpath("//span[@class='user-info']");
	By myAccountLink = By.xpath("//a[@href='/account_page.php']/i"); //By.xpath("//a[contains(.,'My Account')]");//
	By logoutLink = By.xpath("//a[contains(.,'Logout')]");
	By issueSearchField = By.xpath("//input[@name='bug_id']");

	// Actions
	public void clickMyView() {
		click(myViewLink);
	}

	public void clickViewIssues() {
		click(viewIssuesLink);
	}

	public void clickReportIssueLateral() {
		click(reportIssueLinkLateral);
	}

	public void clickChangeLog() {
		click(changeLogLink);
	}

	public void clickRoadmap() {
		click(roadmapLink);
	}

	public void clickSummary() {
		click(summaryLink);
	}

	public void clickManager() {
		click(managerLink);
	}

	// public void clickReportIssueSuperior() {
	// click(reportIssueLinkSuperior);
	// }

	public void clickInviteUser() {
		click(inviteUserLink);
	}

	// public void clickAllProject() {
	// click(allProjectLink);
	// }

	public String returnUserNameLoginInformation() {
		return getText(usernameLoginInfoTextArea);
	}
	
	public void clickUserNameLoginInformation() {
		click(usernameLoginInfoTextArea);
	}

	public void clickMyAccount() {
		click(myAccountLink);
	}

	public void clickLogout() {
		click(logoutLink);
	}

	public void clickIssueSearchField(String pesquisa) {
		sendKeys(issueSearchField, pesquisa);
	}

}
