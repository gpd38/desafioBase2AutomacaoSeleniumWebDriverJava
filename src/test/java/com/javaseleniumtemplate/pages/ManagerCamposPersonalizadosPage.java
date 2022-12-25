package com.javaseleniumtemplate.pages;

import com.javaseleniumtemplate.bases.PageBase;
import org.openqa.selenium.By;

public class ManagerCamposPersonalizadosPage extends PageBase {

    // Mapping
    By botaoCriarCP = By.xpath("//input[@type='submit']");
    By campoTextoCP = By.xpath("//input[2]");
    By msgSucessoTexto = By.xpath("//p[@class='bold bigger-110']");
    By msgErrorTexto = By.xpath("//p[1]");
    By campoNomeCP = By.id("custom-field-name");
    By botaoAtualizarCP = By.xpath("//input[@value='Atualizar Campo Personalizado']");
    By botaoConfirmacaoDeletarCP = By.xpath("//input[@value='Apagar Campo']");
    By botaoDeletarCP = By.xpath("//input[@value='Apagar Campo Personalizado']");

    //Actions
    public void clicarBotaoCriarCampoPersonalizado() {
        click(botaoCriarCP);
    }

    public void preencherNomeCampoPersonalizado(String campoPersonalizado) {
        clear(campoTextoCP);
        sendKeys(campoTextoCP, campoPersonalizado);
    }

    public String retornaSucessoCampoPersonalizado() {
        return getText(msgSucessoTexto);
    }

    public String retornaErrorCampoPersonalizado() {
        return getText(msgErrorTexto);
    }

    public void clicarBotaoAtualizarCampoPersonalizado() {
        click(botaoAtualizarCP);
    }

    public void editarNomeCampoPersonalizado(String novoCampoPersonalizado) {
        clear(campoNomeCP);
        sendKeys(campoNomeCP, novoCampoPersonalizado);
    }

    public void clicarDeletarCampoPersonalizado() {
        click(botaoDeletarCP);
    }

    public void clicarConfirmacaoDeletarCampoPersonaizado() {
        click(botaoConfirmacaoDeletarCP);
    }
}
