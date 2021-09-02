package com.javaseleniumtemplate.dbsteps;

import com.javaseleniumtemplate.utils.DBUtils;
import com.javaseleniumtemplate.utils.Utils;

public class UsuariosDBSteps {

    private static final String queriesPath = "src/test/java/com/javaseleniumtemplate/queries/usuariosqueries/";

    public static String retornaSenhaDoUsuarioDB(String usuario) {
        String query = Utils.getFileContent(queriesPath + "retornaSenhaDoUsuario.sql").replace("$usuario", usuario);
        DBUtils.executeQuery(query);

        return DBUtils.getQueryResult(query).get(0);
    }

    public static void atualizaSenhaDeTodosUsuariosDB() {
        DBUtils.executeQuery(Utils.getFileContent(queriesPath + "atualizaSenhaDeTodosUsuariosDB.sql"));
    }

    public static void atualizaSenhaDeUmUsuarioDB(String usuario) {
        DBUtils.executeQuery(Utils.getFileContent(queriesPath + "atualizaSenhaDeUmUsuarioDB.sql").replace("$usuario", usuario));
    }
}
