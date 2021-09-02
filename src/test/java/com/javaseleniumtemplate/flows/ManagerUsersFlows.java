package com.javaseleniumtemplate.flows;

import com.javaseleniumtemplate.pages.ManagerUsersPage;

public class ManagerUsersFlows {
    //Objects and constructor
    ManagerUsersPage managerUsersPage;

    public ManagerUsersFlows() {
        managerUsersPage = new ManagerUsersPage();
    }

    //Flows
    public void cadastrarUsuario(String username, String realname, String email, String level) {
        managerUsersPage.clickButtonCreateUser();
        managerUsersPage.preencherUserName(username);
        managerUsersPage.preencherRealName(realname);
        managerUsersPage.preencherEmail(email);
        managerUsersPage.preencherLevel(level);
        managerUsersPage.clicarCadastrar();
    }
}
