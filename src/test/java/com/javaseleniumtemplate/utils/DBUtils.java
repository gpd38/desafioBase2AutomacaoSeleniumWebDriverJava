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

    public static void executeUpdate(String query) {
        Connection connection = null;

        try {
            Class.forName(GlobalParameters.DB_DRIVER);
            Statement stmt = null;
            connection = DriverManager.getConnection(GlobalParameters.DB_URL, GlobalParameters.DB_USER, GlobalParameters.DB_PASSWORD);

            stmt = connection.createStatement();
            stmt.executeUpdate(query);

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

    public static void bancoTabelaPorTabela() {
//        String queryMantisApiTokenTable = System.getProperty("user.dir") + "/src/test/resources/scripts/query.sql";
//        DBUtils.executeQuery(queryMantisApiTokenTable);
//        String mantis_bugnote_table = "TRUNCATE TABLE bugtracker.mantis_bugnote_table;";
//        DBUtils.executeQuery(mantis_bugnote_table);
//        String mantis_bugnote_text_table = "TRUNCATE TABLE bugtracker.mantis_bugnote_text_table;";
//        DBUtils.executeQuery(mantis_bugnote_text_table);
//        String mantis_bug_file_table = "TRUNCATE TABLE bugtracker.mantis_bug_file_table;";
//        DBUtils.executeQuery(mantis_bug_file_table);
//        String mantis_bug_history_table = "TRUNCATE TABLE bugtracker.mantis_bug_history_table;";
//        DBUtils.executeQuery(mantis_bug_history_table);
//        String mantis_bug_monitor_table = "TRUNCATE TABLE bugtracker.mantis_bug_monitor_table;";
//        DBUtils.executeQuery(mantis_bug_monitor_table);
//        String mantis_bug_relationship_table = "TRUNCATE TABLE bugtracker.mantis_bug_relationship_table;";
//        DBUtils.executeQuery(mantis_bug_relationship_table);
//        String mantis_bug_revision_table = "TRUNCATE TABLE bugtracker.mantis_bug_revision_table;";
//        DBUtils.executeQuery(mantis_bug_revision_table);
//        String mantis_bug_table = "TRUNCATE TABLE bugtracker.mantis_bug_table;";
//        DBUtils.executeQuery(mantis_bug_table);
//        String mantis_bug_tag_table = "TRUNCATE TABLE bugtracker.mantis_bug_tag_table;";
//        DBUtils.executeQuery(mantis_bug_tag_table);
//        String mantis_bug_text_table = "TRUNCATE TABLE bugtracker.mantis_bug_text_table;";
//        DBUtils.executeQuery(mantis_bug_text_table);
//        String mantis_category_table = "TRUNCATE TABLE bugtracker.mantis_category_table;";
//        DBUtils.executeQuery(mantis_category_table);
//        String mantis_config_table = "TRUNCATE TABLE bugtracker.mantis_config_table;";
//        DBUtils.executeQuery(mantis_config_table);
//        String mantis_custom_field_project_table = "TRUNCATE TABLE bugtracker.mantis_custom_field_project_table;";
//        DBUtils.executeQuery(mantis_custom_field_project_table);
//        String mantis_custom_field_string_table = "TRUNCATE TABLE bugtracker.mantis_custom_field_string_table;";
//        DBUtils.executeQuery(mantis_custom_field_string_table);
//        String mantis_custom_field_table = "TRUNCATE TABLE bugtracker.mantis_custom_field_table;";
//        DBUtils.executeQuery(mantis_custom_field_table);
//        String mantis_email_table = "TRUNCATE TABLE bugtracker.mantis_email_table;";
//        DBUtils.executeQuery(mantis_email_table);
//        String mantis_filters_table = "TRUNCATE TABLE bugtracker.mantis_filters_table;";
//        DBUtils.executeQuery(mantis_filters_table);
//        String mantis_news_table = "TRUNCATE TABLE bugtracker.mantis_news_table;";
//        DBUtils.executeQuery(mantis_news_table);
//        String mantis_plugin_table = "TRUNCATE TABLE bugtracker.mantis_plugin_table;";
//        DBUtils.executeQuery(mantis_plugin_table);
//        String mantis_project_file_table = "TRUNCATE TABLE bugtracker.mantis_project_file_table;";
//        DBUtils.executeQuery(mantis_project_file_table);
//        String mantis_project_hierarchy_table = "TRUNCATE TABLE bugtracker.mantis_project_hierarchy_table;";
//        DBUtils.executeQuery(mantis_project_hierarchy_table);
//        String mantis_project_table = "TRUNCATE TABLE bugtracker.mantis_project_table;";
//        DBUtils.executeQuery(mantis_project_table);
//        String mantis_project_user_list_table = "TRUNCATE TABLE bugtracker.mantis_project_user_list_table;";
//        DBUtils.executeQuery(mantis_project_user_list_table);
//        String mantis_project_version_table = "TRUNCATE TABLE bugtracker.mantis_project_version_table;";
//        DBUtils.executeQuery(mantis_project_version_table);
//        String mantis_sponsorship_table = "TRUNCATE TABLE bugtracker.mantis_sponsorship_table;";
//        DBUtils.executeQuery(mantis_sponsorship_table);
//        String mantis_tag_table = "TRUNCATE TABLE bugtracker.mantis_tag_table;";
//        DBUtils.executeQuery(mantis_tag_table);
//        String mantis_tokens_table = "TRUNCATE TABLE bugtracker.mantis_tokens_table;";
//        DBUtils.executeQuery(mantis_tokens_table);
//        String mantis_user_pref_table = "TRUNCATE TABLE bugtracker.mantis_user_pref_table;";
//        DBUtils.executeQuery(mantis_user_pref_table);
//        String mantis_user_print_pref_table = "TRUNCATE TABLE bugtracker.mantis_user_print_pref_table;";
//        DBUtils.executeQuery(mantis_user_print_pref_table);
//        String mantis_user_profile_table = "TRUNCATE TABLE bugtracker.mantis_user_profile_table;";
//        DBUtils.executeQuery(mantis_user_profile_table);
//        String mantis_user_table = "TRUNCATE TABLE bugtracker.mantis_user_table;";
//        DBUtils.executeQuery(mantis_user_table);
    }
}
