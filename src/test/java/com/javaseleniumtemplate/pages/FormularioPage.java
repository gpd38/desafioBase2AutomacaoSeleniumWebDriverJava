package com.javaseleniumtemplate.pages;

import com.javaseleniumtemplate.bases.PageBase;
import org.openqa.selenium.By;

public class FormularioPage extends PageBase {
    //Mapping
    By campoNome = By.xpath("//input[@aria-labelledby='i1']");
    By campoTelefone = By.xpath("//input[@aria-labelledby='i5']");
    By campoEmail = By.xpath("//input[@aria-describedby='i10 i11']");
    By msgSucesso = By.xpath("//div[@class='vHW8K'][contains(.,'Thanks for submitting your contact info!')]");
    By botaoEnviar = By.xpath("//span[@class='l4V7wb Fxmcue'][contains(.,'Enviar')]");

    //Actions
    public void preencherNome(String nome) {
        clear(campoNome);
        sendKeys(campoNome, nome);
    }

    public void preencherTelefone(String telefone) {
        clear(campoTelefone);
        sendKeys(campoTelefone, telefone);
    }

    public void preencherEmail(String email) {
        clear(campoEmail);
        sendKeys(campoEmail, email);
    }

    public void clicarEnviar(){
        click(botaoEnviar);
    }

    public String getMsgSucesso(){
        return(getText(msgSucesso));
    }

}
