package com.javaseleniumtemplate.pages;

import org.openqa.selenium.By;

import com.javaseleniumtemplate.bases.PageBase;

public class ManagerPage extends PageBase {

	// Mapping Manager Tab
	By managerSiteInformationTab = By.xpath("//i[@class='blue ace-icon fa fa-info-circle']");
	By managerUsersTab = By.xpath("//a[contains(.,'Manage Users')]");
	By managerProjectsTab = By.xpath("//a[contains(.,'Manage Projects')]");
	By managerTagsTab = By.xpath("//a[contains(.,'Manage Tags')]");
	By managerCustomFieldsTab = By.xpath("//a[contains(.,'Manage Custom Fields')]");
	By managerGlobalProfilesTab = By.xpath("//a[contains(.,'Manage Global Profiles')]");

	// Mapping Manager User
	By checkShowDisable = By.xpath("//span[contains(.,'Show Disabled')]");
	By buttonApplyFilterManagerAccount = By.xpath("//input[@value='Apply Filter']");
	By buttonCreateNewAccount = By.xpath("//a[contains(.,'Create New Account')]");
	By userName = By.xpath("//input[@name='username']");
	By realName = By.xpath("//input[@name='realname']");
	By email = By.xpath("//input[@name='email']");
	By accessLevel = By.xpath("//select[@name='access_level']");
	By userEnable = By.xpath("//input[@id='user-enabled']");
	By userProtected = By.xpath("//input[@id='user-protected']");
	By buttonCreateUser = By.xpath("//input[@value='Create User']");

	// Mapping Manager Project
	By buttonCreateNewProject = By.xpath("//button[contains(.,'Create New Project')]");;
	By projectName = By.xpath("//input[@name='name']");
	By statusProject = By.xpath("//select[@name='status']");
	By checkInheritGlobalCategories = By.xpath("//span[@class='lbl']");
	By viewStatusProject = By.xpath("//select[@name='view_state']");
	By descriptionProject = By.xpath("//textarea[@name='description']");
	By buttonAddProject = By.xpath("//input[@value='Add Project']");

	// Mapping Manager Global Categories
	By categoryNameField = By.xpath("//input[@name='name']");
	By buttonAddCategory = By.xpath("//input[@value='Add Category']");
	By buttonAddEditCategory = By.xpath("//input[@name='add_and_edit_category']");
	By buttonEditCategory;

	// Mapping Manager Tags
	By accessCreateTag = By.xpath("//a[contains(.,'Create Tag')]");
	By tagNameField = By.id("tag-name");
	By tagDescriptionField = By.id("tag-description");
	By buttonCreateTag = By.xpath("//input[@name='config_set']");
	By buttonDeletTag = By.xpath("//input[@value='Delete Tag']");
	By buttonUpdateTag = By.xpath("//input[@value='Update Tag']");

	// Mapping Manager Custom Fields
	By customField = By.xpath("//input[@name='name']");
	By buttonNewCustomField = By.xpath("//input[@value='New Custom Field']");
	By buttonDeletCustomField = By.xpath("//input[@value='Delete Custom Field']");

}
