package com.javaseleniumtemplate.pages;

import com.javaseleniumtemplate.bases.PageBase;
import org.openqa.selenium.By;

public class BugReportPage extends PageBase {
    //Mapping
    By dropdownProjetos = By.id("select-project-id");
    By dropdownCategoria = By.name("category_id");
    By campoResumo = By.name("summary");
    By campoDescricao = By.name("description");
    //By uploadArquivo = By.xpath("//div[@class='dropzone center dz-clickable']");
    By botaoSubmit = By.xpath("//input[@type='submit']");
    By frequenciaComboBox = By.name("reproducibility");
    By gravidadeComboBox = By.name("severity");
    By prioridadeComboBox = By.name("priority");
    By perfilComboBox = By.name("profile_id");
    By tarefaUsuario = By.name("handler_id");
    By campoPassoAPasso = By.name("steps_to_reproduce");
    By campoPerfilAdicional = By.name("additional_info");
    By campoMarcador = By.name("tag_string");
    By msgSucessoTexto = By.xpath("//p[@class='bold bigger-110']");

    //Actions
    public void selecionarProjetoReporter(String projeto) {
        comboBoxSelectByVisibleText(dropdownProjetos, projeto);
    }

    public void selecionarCategoria(String categoria) {
        comboBoxSelectByVisibleText(dropdownCategoria, categoria);
    }

    public void preencherResumo(String resumo) {
        clear(campoResumo);
        sendKeys(campoResumo, resumo);
    }

    public void preencherDescricao(String descricao) {
        clear(campoDescricao);
        sendKeys(campoDescricao, descricao);
    }

    public void ClicarEmSubmitReport() {
        click(botaoSubmit);
    }

    public String returnMsgSucessoTexto() {
        return getText(msgSucessoTexto);
    }

    public void selecionarFrequencia(String frequencia) {
        comboBoxSelectByVisibleText(frequenciaComboBox, frequencia);
    }

    public void selecionarGravidade(String gravidade) {
        comboBoxSelectByVisibleText(gravidadeComboBox, gravidade);
    }

    public void selecionarPrioridade(String prioridade) {
        comboBoxSelectByVisibleText(prioridadeComboBox, prioridade);
    }

    public void selecionarPerfil(String perfil) {
        comboBoxSelectByVisibleText(perfilComboBox, perfil);
    }

    public void atribuirUsuarioTarefa(String atribuirUsuario) {
        comboBoxSelectByVisibleText(tarefaUsuario, atribuirUsuario);
    }

    public void preencherPassoAPasso(String passosParaReproduzir) {
        clear(campoPassoAPasso);
        sendKeys(campoPassoAPasso, passosParaReproduzir);
    }

    public void preencherInfoAdicionais(String infoAdicionais) {
        clear(campoPerfilAdicional);
        sendKeys(campoPerfilAdicional, infoAdicionais);
    }

    public void preencherMarcador(String marcador) {
        clear(campoMarcador);
        sendKeys(campoMarcador, marcador);
    }
}
