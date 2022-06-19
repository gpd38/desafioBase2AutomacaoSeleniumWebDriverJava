package com.javaseleniumtemplate.pages;

import com.javaseleniumtemplate.bases.PageBase;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;

public class ManagerVerTarefasPage extends PageBase {

    String tarefa = "0000001";
    // Mapping
    By botaoAcessarPagina = By.xpath("//a[@href='/view_all_bug_page.php']");
    By clicarEditarTarefa = By.xpath("//a[contains(.,'" + tarefa + "')]");
    By campoMarcador = By.id("tag_string");
    By aplicarMarcador = By.xpath("//input[@value='Aplicar']");
    By listaMarcadores = By.xpath("//td[@class='bug-tags']");

    //Actions
    public void clicarMenuAcesso() {
        click(botaoAcessarPagina);
    }

    public String retornarTituloPagina() {
        return getTitle();
    }

    public void editarTarefa(String numTarefaDefault) {
        tarefa = numTarefaDefault;
        click(clicarEditarTarefa);
    }

    public void preencherMarcador(String tag) {
        sendKeys(campoMarcador, tag);
    }

    public void clicarEmAplicar() {
        click(aplicarMarcador);
    }

    public boolean validarMarcadorAplicado(String tag) {
        String result;
        List<WebElement> listaTags = waitForElements(listaMarcadores);
        for (WebElement atual : listaTags) {
            result = atual.getText();
            if (result.contains(tag)) {
                return true;
            }
        }
        return false;
    }

}
