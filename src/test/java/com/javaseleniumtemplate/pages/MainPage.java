package com.javaseleniumtemplate.pages;

import com.javaseleniumtemplate.bases.PageBase;
import org.openqa.selenium.By;

public class MainPage extends PageBase {
    //Mapping
    By usernameLoginInfoTextArea = By.xpath("//span[@class='user-info']"); //By.xpath("//td[@class='login-info-left']/span[@class='italic']");
    By reportIssueLink = By.xpath("//a[@href='/bug_report_page.php']");

    //Actions
    public String retornaUserNameDasInformacoesDeLogin(){
        return getText(usernameLoginInfoTextArea);
    }

    public void clicarEmReportIssue(){
        click(reportIssueLink);
    }
}
