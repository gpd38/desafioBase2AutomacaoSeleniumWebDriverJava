
#################################################
## Limpando todas as tabelas do banco de dados ##
#################################################

DELETE FROM mantis_api_token_table;
DELETE FROM mantis_bugnote_table;
DELETE FROM mantis_bugnote_text_table;
DELETE FROM mantis_bug_file_table;

DELETE FROM bugtracker.mantis_bug_history_table;
DELETE FROM bugtracker.mantis_bug_monitor_table;
DELETE FROM bugtracker.mantis_bug_relationship_table;
DELETE FROM bugtracker.mantis_bug_revision_table;
DELETE FROM bugtracker.mantis_bug_table;

DELETE FROM bugtracker.mantis_bug_tag_table;
DELETE FROM bugtracker.mantis_bug_text_table;
DELETE FROM bugtracker.mantis_category_table;
DELETE FROM bugtracker.mantis_config_table;
DELETE FROM bugtracker.mantis_custom_field_project_table;

DELETE FROM bugtracker.mantis_custom_field_string_table;
DELETE FROM bugtracker.mantis_custom_field_table;
DELETE FROM bugtracker.mantis_email_table;
DELETE FROM bugtracker.mantis_filters_table;
DELETE FROM bugtracker.mantis_news_table;

DELETE FROM bugtracker.mantis_plugin_table;
DELETE FROM bugtracker.mantis_project_file_table;
DELETE FROM bugtracker.mantis_project_hierarchy_table;
DELETE FROM bugtracker.mantis_project_table;
DELETE FROM bugtracker.mantis_project_user_list_table;

DELETE FROM bugtracker.mantis_project_version_table;
DELETE FROM bugtracker.mantis_sponsorship_table;
DELETE FROM bugtracker.mantis_tag_table;
DELETE FROM bugtracker.mantis_tokens_table;
DELETE FROM bugtracker.mantis_user_pref_table;

DELETE FROM bugtracker.mantis_user_print_pref_table;
DELETE FROM bugtracker.mantis_user_profile_table;
DELETE FROM bugtracker.mantis_user_table;

##########################################################
## Preenchedo com informações iniciais o banco de dados ##
##########################################################

#Configurações
INSERT INTO bugtracker.mantis_config_table(`config_id`, `project_id`, `user_id`, `access_reqd`, `type`, `value`) VALUES ('database_version', 0, 0, 90, 1, '209');
INSERT INTO bugtracker.mantis_plugin_table(`basename`, `enabled`, `protected`, `priority`) VALUES ('MantisCoreFormatting', 1, 0, 3);
#Categoria
INSERT INTO bugtracker.mantis_category_table(`id`, `project_id`, `user_id`, `name`, `status`) VALUES (1, 0, 0, 'Categoria A', 0);
INSERT INTO bugtracker.mantis_category_table(`id`, `project_id`, `user_id`, `name`, `status`) VALUES (2, 0, 0, 'Categoria B', 0);
#Usuários
INSERT INTO bugtracker.mantis_user_table(`id`, `username`, `realname`, `email`, `password`, `enabled`, `protected`, `access_level`, `login_count`, `lost_password_request_count`, `failed_login_count`, `cookie_string`, `last_visit`, `date_created`) VALUES (1, 'administrator', 'administrador', 'root@localhost', '27e7a36bcf13fb4fdc9994adc0f366d3', 1, 0, 90, 6, 0, 0, 'lqrp_y262orNiix5seAwfjPjbmYwgvLYEPs4I-WO7WrI-SdbYmmm_reidlyHJXRj', 1594728550, 1594724194);
INSERT INTO bugtracker.mantis_user_table(`id`, `username`, `realname`, `email`, `password`, `enabled`, `protected`, `access_level`, `login_count`, `lost_password_request_count`, `failed_login_count`, `cookie_string`, `last_visit`, `date_created`) VALUES (2, 'desenvolvedor', 'Usuário Dev', 'usu.dev@base2.com.br', '27e7a36bcf13fb4fdc9994adc0f366d3', 1, 0, 55, 0, 0, 0, 'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiyUQY7f', 1629901236, 1629901236);
#Projeto
INSERT INTO bugtracker.mantis_project_table(`id`, `name`, `description`, `inherit_global`) VALUES ('1', 'Projeto Default A', 'Descrição projeto default A', '1');
INSERT INTO bugtracker.mantis_project_table(`id`, `name`, `description`, `inherit_global`) VALUES ('2', 'Projeto Default B', 'Descrição projeto default B', '1');
#Perfil/Profile
INSERT INTO bugtracker.mantis_user_profile_table(`id`, `platform`, `os`, `os_build`, `description`) VALUES ('1', 'Plataforma Default A', 'SO Default A', 'Versão Original A', 'Descrição sobre o sistema operacional default A');
INSERT INTO bugtracker.mantis_user_profile_table(`id`, `platform`, `os`, `os_build`, `description`) VALUES ('2', 'Plataforma Default B', 'SO Default B', 'Versão Original B', 'Descrição sobre o sistema operacional default B');
#Bug
INSERT INTO bugtracker.mantis_bug_text_table(`description`) VALUES ('Descrição default: Primeiro report');
INSERT INTO bugtracker.mantis_bug_table(`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','1','1','Resumo default: Primeiro report','1630271419','1630271419');
INSERT INTO bugtracker.mantis_bug_text_table(`description`) VALUES ('Descrição default2: Segundo report');
INSERT INTO bugtracker.mantis_bug_table(`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','1','2','Resumo default2: Segundo report','1630271419','1630271419');
#Tag
INSERT INTO `bugtracker`.`mantis_tag_table` (`user_id`, `name`, `description`) VALUES ('1', 'tag000000001', 'descrição tag 000000001');