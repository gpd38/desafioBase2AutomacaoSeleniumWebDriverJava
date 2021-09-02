package com.javaseleniumtemplate.pages;

import com.javaseleniumtemplate.bases.PageBase;
import org.openqa.selenium.By;

public class MainPage extends PageBase {
    //Mapping
    By usernameLoginInfo = By.xpath("//span[@class='user-info']");
    By reportIssueLink = By.xpath("//a[@href='/bug_report_page.php']"); //Deve ter projeto criado
    By linkMinhaConta = By.xpath("//i[@class='ace-icon fa fa-user']");
    By linkSair = By.cssSelector(".user-menu > li:nth-child(4) > a");

    //Actions
    public String retornaUsernameDasInformacoesDeLogin() {
        return getText(usernameLoginInfo);
    }

    public void clicarInformacoesDeLogin() {
        click(usernameLoginInfo);
    }

    public void clicarEmReportIssue() {
        click(reportIssueLink);
    }

    public void clickMyAccount() {
        click(linkMinhaConta);
    }

    public void clickSair() {
        click(linkSair);
    }
}
