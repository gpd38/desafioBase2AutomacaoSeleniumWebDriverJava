package com.javaseleniumtemplate.pages;

import com.javaseleniumtemplate.bases.PageBase;
import org.openqa.selenium.By;

public class ManagerResumoPage extends PageBase {

    // Mapping
    By botaoAcessarPagina = By.xpath("//a[@href='/summary_page.php']");
    By msgSucessoTexto = By.xpath("//h4[@class='widget-title lighter']");

    //Actions
    public void clicarMenuAcesso() {
        click(botaoAcessarPagina);
    }

    public String retornarMensagemSucesso() {
        return getText(msgSucessoTexto);
    }

    public boolean existeMenuAcesso() {
        return returnIfElementExists(botaoAcessarPagina);
    }
}
