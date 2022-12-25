package com.javaseleniumtemplate.tests;

import com.javaseleniumtemplate.bases.TestBase;
import com.javaseleniumtemplate.dbsteps.UsuariosDBSteps;
import com.javaseleniumtemplate.flows.LoginFlows;
import com.javaseleniumtemplate.pages.ManagerPage;
import com.javaseleniumtemplate.pages.ManagerUsersPage;
import com.javaseleniumtemplate.utils.Utils;
import org.testng.Assert;
import org.testng.annotations.Ignore;
import org.testng.annotations.Test;

public class ManagerUsersTests extends TestBase {

    // Objects
    LoginFlows loginFlows;
    ManagerPage managerPage;
    ManagerUsersPage managerUsersPage;

    //Tests
    @Test
    public void cadastrarRelatorUser() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerUsersPage = new ManagerUsersPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String username = "re" + id;
        String realname = "relator" + id;
        String email = "re" + id + "@base2.com.br";
        String level = "relator";
        String msgCadastroSucesso = "Usuário " + username + " criado com um nível de acesso de " + level;

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerUsersTab();
        managerUsersPage.clickButtonCreateUser();
        managerUsersPage.preencherUserName(username);
        managerUsersPage.preencherRealName(realname);
        managerUsersPage.preencherEmail(email);
        managerUsersPage.preencherLevel(level);
        managerUsersPage.clicarCadastrar();

        Assert.assertEquals(msgCadastroSucesso, managerUsersPage.returnMsgSucessoTexto());

    }

    @Test
    public void cadastrarVisualizadorUser() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerUsersPage = new ManagerUsersPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String username = "vi" + id;
        String realname = "visualizador" + id;
        String email = "vi" + id + "@base2.com.br";
        String level = "visualizador";
        String msgCadastroSucesso = "Usuário " + username + " criado com um nível de acesso de " + level;

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerUsersTab();
        managerUsersPage.clickButtonCreateUser();
        managerUsersPage.preencherUserName(username);
        managerUsersPage.preencherRealName(realname);
        managerUsersPage.preencherEmail(email);
        managerUsersPage.preencherLevel(level);
        managerUsersPage.clicarCadastrar();

        Assert.assertEquals(msgCadastroSucesso, managerUsersPage.returnMsgSucessoTexto());

    }

    @Test
    public void cadastrarAtualizadorUser() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerUsersPage = new ManagerUsersPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String username = "at" + id;
        String realname = "atualizador" + id;
        String email = "at" + id + "@base2.com.br";
        String level = "atualizador";
        String msgCadastroSucesso = "Usuário " + username + " criado com um nível de acesso de " + level;

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerUsersTab();
        managerUsersPage.clickButtonCreateUser();
        managerUsersPage.preencherUserName(username);
        managerUsersPage.preencherRealName(realname);
        managerUsersPage.preencherEmail(email);
        managerUsersPage.preencherLevel(level);
        managerUsersPage.clicarCadastrar();

        Assert.assertEquals(msgCadastroSucesso, managerUsersPage.returnMsgSucessoTexto());

    }

    @Test
    public void cadastrarDesenvolvedorUser() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerUsersPage = new ManagerUsersPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String username = "de" + id;
        String realname = "desenvolvedor" + id;
        String email = "de" + id + "@base2.com.br";
        String level = "desenvolvedor";
        String msgCadastroSucesso = "Usuário " + username + " criado com um nível de acesso de " + level;

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerUsersTab();
        managerUsersPage.clickButtonCreateUser();
        managerUsersPage.preencherUserName(username);
        managerUsersPage.preencherRealName(realname);
        managerUsersPage.preencherEmail(email);
        managerUsersPage.preencherLevel(level);
        managerUsersPage.clicarCadastrar();

        Assert.assertEquals(msgCadastroSucesso, managerUsersPage.returnMsgSucessoTexto());

    }

    @Test
    public void cadastrarGerenteUser() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerUsersPage = new ManagerUsersPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String username = "ge" + id;
        String realname = "gerente" + id;
        String email = "ge" + id + "@base2.com.br";
        String level = "gerente";
        String msgCadastroSucesso = "Usuário " + username + " criado com um nível de acesso de " + level;

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerUsersTab();
        managerUsersPage.clickButtonCreateUser();
        managerUsersPage.preencherUserName(username);
        managerUsersPage.preencherRealName(realname);
        managerUsersPage.preencherEmail(email);
        managerUsersPage.preencherLevel(level);
        managerUsersPage.clicarCadastrar();

        Assert.assertEquals(msgCadastroSucesso, managerUsersPage.returnMsgSucessoTexto());

    }

    @Test
    public void cadastrarAdministradorUser() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerUsersPage = new ManagerUsersPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String username = "ad" + id;
        String realname = "administrator" + id;
        String email = "ad" + id + "@base2.com.br";
        String level = "administrador";
        String msgCadastroSucesso = "Usuário " + username + " criado com um nível de acesso de " + level;

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerUsersTab();
        managerUsersPage.clickButtonCreateUser();
        managerUsersPage.preencherUserName(username);
        managerUsersPage.preencherRealName(realname);
        managerUsersPage.preencherEmail(email);
        managerUsersPage.preencherLevel(level);
        managerUsersPage.clicarCadastrar();

        Assert.assertEquals(msgCadastroSucesso, managerUsersPage.returnMsgSucessoTexto());

    }

    @Test
    public void cadastroDeUserNameRepetido() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerUsersPage = new ManagerUsersPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String username1 = "user1" + id;
        String realname1 = "user1" + id;
        String email1 = "user1" + id + "@base2.com.br";
        String level1 = "relator";

        //Test cadastro primeiro usuario
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerUsersTab();
        managerUsersPage.clickButtonCreateUser();
        managerUsersPage.preencherUserName(username1);
        managerUsersPage.preencherRealName(realname1);
        managerUsersPage.preencherEmail(email1);
        managerUsersPage.preencherLevel(level1);
        managerUsersPage.clicarCadastrar();

        String realname2 = "user2" + id;
        String email2 = "user2" + id + "@base2.com.br";
        String level2 = "relator";
        String msgErro800 = "APPLICATION ERROR #800";

        //Test cadastro usuario com nome repetido
        managerPage.clickManagerGeralInfoTab();//1@base2.com.br
        managerPage.clickManagerUsersTab();
        managerUsersPage.clickButtonCreateUser();
        managerUsersPage.preencherUserName(username1);
        managerUsersPage.preencherRealName(realname2);
        managerUsersPage.preencherEmail(email2);
        managerUsersPage.preencherLevel(level2);
        managerUsersPage.clicarCadastrar();

        Assert.assertEquals(msgErro800, managerUsersPage.returnMsgErro());
    }

    @Test
    public void cadastroDeUserEmailRepetido() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerUsersPage = new ManagerUsersPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String username1 = "userA" + id;
        String realname1 = "userA" + id;
        String email1 = "userA" + id + "@base2.com.br";
        String level1 = "relator";

        //Test cadastro primeiro usuario
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerUsersTab();
        managerUsersPage.clickButtonCreateUser();
        managerUsersPage.preencherUserName(username1);
        managerUsersPage.preencherRealName(realname1);
        managerUsersPage.preencherEmail(email1);
        managerUsersPage.preencherLevel(level1);
        managerUsersPage.clicarCadastrar();

        String username2 = "userB" + id;
        String realname2 = "userB" + id;
        String level2 = "relator";
        String msgErro813 = "APPLICATION ERROR #813";

        //Test cadastro usuario com nome repetido
        managerPage.clickManagerUsersTab();
        managerUsersPage.clickButtonCreateUser();
        managerUsersPage.preencherUserName(username2);
        managerUsersPage.preencherRealName(realname2);
        managerUsersPage.preencherEmail(email1);
        managerUsersPage.preencherLevel(level2);
        managerUsersPage.clicarCadastrar();

        Assert.assertEquals(msgErro813, managerUsersPage.returnMsgErro());
    }

    @Test
    public void redefinirSenha() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerUsersPage = new ManagerUsersPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String username = "user-teste" + id;
        String realname = "userTeste" + id;
        String email = "userteste.redefinirsenha" + id + "@base2.com.br";
        String level = "administrador";
        String msgRedefinirSenha = "Uma solicitação de confirmação foi enviada ao endereço de e-mail do usuário selecionado. Através deste, o usuário será capaz de alterar sua senha.";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerUsersTab();
        managerUsersPage.clickButtonCreateUser();
        managerUsersPage.preencherUserName(username);
        managerUsersPage.preencherRealName(realname);
        managerUsersPage.preencherEmail(email);
        managerUsersPage.preencherLevel(level);
        managerUsersPage.clicarCadastrar();
        managerUsersPage.clicarRedefinirSenha();

        Assert.assertEquals(msgRedefinirSenha, managerUsersPage.returnMsgSucessoTexto());

    }

    @Ignore
    @Test
    public void validarSenhaAtualizadaComSucessoPeloDB() {
        //Objects instances
        loginFlows = new LoginFlows();
        managerPage = new ManagerPage();
        managerUsersPage = new ManagerUsersPage();

        //Parameteres
        String usuario = "administrator";
        String senha = "mantisbt";
        String id = Utils.gerarNumerosAleatorios();

        String username = "re" + id;
        String realname = "relator" + id;
        String email = "re" + id + "@base2.com.br";
        String level = "relator";

        //Test
        loginFlows.efetuarLogin(usuario, senha);
        managerPage.clickManagerGeralInfoTab();
        managerPage.clickManagerUsersTab();
        managerUsersPage.clickButtonCreateUser();
        managerUsersPage.preencherUserName(username);
        managerUsersPage.preencherRealName(realname);
        managerUsersPage.preencherEmail(email);
        managerUsersPage.preencherLevel(level);
        managerUsersPage.clicarCadastrar();

        String senhaPadrao = "27e7a36bcf13fb4fdc9994adc0f366d3";
        UsuariosDBSteps.atualizaSenhaDeUmUsuarioDB(username);
        String senhaNova = UsuariosDBSteps.retornaSenhaDoUsuarioDB(username);

        Assert.assertEquals(senhaNova, senhaPadrao);
    }
}
