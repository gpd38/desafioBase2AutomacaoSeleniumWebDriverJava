package com.javaseleniumtemplate.pages;

import com.javaseleniumtemplate.bases.PageBase;
import org.openqa.selenium.By;

public class ManagerPage extends PageBase {

    // Mapping Manager Tab
    By gerenciarAbaInformacao = By.cssSelector(".nav-list > li:nth-last-child(1)");
    By gerenciarAbaUsuario = By.xpath("//div[2]/div[2]//li[2]/a[1]");
    By gerenciarAbaProjeto = By.xpath("//div[2]/div[2]//li[3]");
    By gerenciarAbaTag = By.xpath("//div[2]/div[2]//li[4]");
    By gerenciarAbaCamposPersonalizados = By.xpath("//div[2]/div[2]//li[5]");
    By gerenciarAbaPerfilGlobal = By.xpath("//div[2]/div[2]//li[6]");
    By gerenciarAbaPlugins = By.xpath("//div[2]/div[2]//li[7]");
    By gerenciarAbaConfiguracao = By.xpath("//div[2]/div[2]//li[8]");

    //Actions
    public void clickManagerGeralInfoTab() {
        click(gerenciarAbaInformacao);
    }

    public void clickManagerUsersTab() {
        click(gerenciarAbaUsuario);
    }

    public void clickManagerProjectsTab() {
        click(gerenciarAbaProjeto);
    }

    public void clickManagerTagsTab() {
        click(gerenciarAbaTag);
    }

    public void clickManagerCustomFieldsTab() {
        click(gerenciarAbaCamposPersonalizados);
    }

    public void clickManagerGlobalProfilesTab() {
        click(gerenciarAbaPerfilGlobal);
    }

    public void clickManagerPluginsTab() {
        click(gerenciarAbaPlugins);
    }

    public void clickManagerConfigurationTab() {
        click(gerenciarAbaConfiguracao);
    }

    public String returnUrlPaginaAtual() {
        return getURL();
    }

}
