package com.javaseleniumtemplate.utils;

import com.javaseleniumtemplate.GlobalParameters;

import java.sql.*;
import java.util.ArrayList;

public class DBUtils {

    public static ArrayList<String> getQueryResult(String query) {
        ArrayList<String> arrayList = null;
        Connection connection = null;

        try {
            Class.forName(GlobalParameters.DB_DRIVER);
            Statement stmt = null;
            connection = DriverManager.getConnection(GlobalParameters.DB_URL, GlobalParameters.DB_USER, GlobalParameters.DB_PASSWORD);

            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            if (!rs.isBeforeFirst()) {
                return null;
            } else {
                int numberOfColumns;
                ResultSetMetaData metadata = null;

                arrayList = new ArrayList<String>();
                metadata = rs.getMetaData();
                numberOfColumns = metadata.getColumnCount();

                while (rs.next()) {
                    int i = 1;
                    while (i <= numberOfColumns) {
                        arrayList.add(rs.getString(i++));
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return arrayList;
    }

    public static void executeQuery(String query) {
        Connection connection = null;

        try {
            Class.forName(GlobalParameters.DB_DRIVER);
            Statement stmt = null;
            connection = DriverManager.getConnection(GlobalParameters.DB_URL, GlobalParameters.DB_USER, GlobalParameters.DB_PASSWORD);

            stmt = connection.createStatement();
            stmt.executeQuery(query);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void prepararDadosBanco() {
        String queriesPath = System.getProperty("user.dir") + "/src/test/resources/scripts/script_start_banco.sql";
        String query = Utils.getFileContent(queriesPath);
        DBUtils.executeQuery(query);
    }

    public static void limparDadosBanco() {
        //TODO Futuramente desmembrar o metodo "prepararDadosBanco" em limpar e criar os dados do banco
    }

    public static void criarDadosBanco() {
        //TODO Futuramente desmembrar o metodo "prepararDadosBanco" em limpar e criar os dados do banco
    }
}
