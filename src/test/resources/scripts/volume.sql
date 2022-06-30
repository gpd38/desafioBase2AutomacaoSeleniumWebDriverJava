-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.5.4-MariaDB-1:10.5.4+maria~focal - mariadb.org binary distribution
-- OS do Servidor:               debian-linux-gnu
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- ######################
-- ##### bugtracker #####
-- ######################

-- Copiando estrutura do banco de dados para bugtracker
DROP DATABASE IF EXISTS `bugtracker`;
CREATE DATABASE IF NOT EXISTS `bugtracker` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bugtracker`;

-- Copiando estrutura para tabela bugtracker.mantis_api_token_table
DROP TABLE IF EXISTS `mantis_api_token_table`;
CREATE TABLE IF NOT EXISTS `mantis_api_token_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL,
  `hash` varchar(128) NOT NULL,
  `date_created` int(10) unsigned NOT NULL DEFAULT 1,
  `date_used` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id_name` (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_bugnote_table
DROP TABLE IF EXISTS `mantis_bugnote_table`;
CREATE TABLE IF NOT EXISTS `mantis_bugnote_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT 0,
  `reporter_id` int(10) unsigned NOT NULL DEFAULT 0,
  `bugnote_text_id` int(10) unsigned NOT NULL DEFAULT 0,
  `view_state` smallint(6) NOT NULL DEFAULT 10,
  `note_type` int(11) DEFAULT 0,
  `note_attr` varchar(250) DEFAULT '',
  `time_tracking` int(10) unsigned NOT NULL DEFAULT 0,
  `last_modified` int(10) unsigned NOT NULL DEFAULT 1,
  `date_submitted` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_bug` (`bug_id`),
  KEY `idx_last_mod` (`last_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_bugnote_text_table
DROP TABLE IF EXISTS `mantis_bugnote_text_table`;
CREATE TABLE IF NOT EXISTS `mantis_bugnote_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_bug_file_table
DROP TABLE IF EXISTS `mantis_bug_file_table`;
CREATE TABLE IF NOT EXISTS `mantis_bug_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT 0,
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `content` longblob DEFAULT NULL,
  `date_added` int(10) unsigned NOT NULL DEFAULT 1,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_bug_file_bug_id` (`bug_id`),
  KEY `idx_diskfile` (`diskfile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_bug_history_table
DROP TABLE IF EXISTS `mantis_bug_history_table`;
CREATE TABLE IF NOT EXISTS `mantis_bug_history_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `bug_id` int(10) unsigned NOT NULL DEFAULT 0,
  `field_name` varchar(64) NOT NULL,
  `old_value` varchar(255) NOT NULL,
  `new_value` varchar(255) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `date_modified` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_bug_history_bug_id` (`bug_id`),
  KEY `idx_history_user_id` (`user_id`),
  KEY `idx_bug_history_date_modified` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_bug_monitor_table
DROP TABLE IF EXISTS `mantis_bug_monitor_table`;
CREATE TABLE IF NOT EXISTS `mantis_bug_monitor_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `bug_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`bug_id`),
  KEY `idx_bug_id` (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_bug_relationship_table
DROP TABLE IF EXISTS `mantis_bug_relationship_table`;
CREATE TABLE IF NOT EXISTS `mantis_bug_relationship_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_bug_id` int(10) unsigned NOT NULL DEFAULT 0,
  `destination_bug_id` int(10) unsigned NOT NULL DEFAULT 0,
  `relationship_type` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_relationship_source` (`source_bug_id`),
  KEY `idx_relationship_destination` (`destination_bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_bug_revision_table
DROP TABLE IF EXISTS `mantis_bug_revision_table`;
CREATE TABLE IF NOT EXISTS `mantis_bug_revision_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL,
  `bugnote_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_bug_rev_type` (`type`),
  KEY `idx_bug_rev_id_time` (`bug_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_bug_table
DROP TABLE IF EXISTS `mantis_bug_table`;
CREATE TABLE IF NOT EXISTS `mantis_bug_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `reporter_id` int(10) unsigned NOT NULL DEFAULT 0,
  `handler_id` int(10) unsigned NOT NULL DEFAULT 0,
  `duplicate_id` int(10) unsigned NOT NULL DEFAULT 0,
  `priority` smallint(6) NOT NULL DEFAULT 30,
  `severity` smallint(6) NOT NULL DEFAULT 50,
  `reproducibility` smallint(6) NOT NULL DEFAULT 10,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `resolution` smallint(6) NOT NULL DEFAULT 10,
  `projection` smallint(6) NOT NULL DEFAULT 10,
  `eta` smallint(6) NOT NULL DEFAULT 10,
  `bug_text_id` int(10) unsigned NOT NULL DEFAULT 0,
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '',
  `fixed_in_version` varchar(64) NOT NULL DEFAULT '',
  `build` varchar(32) NOT NULL DEFAULT '',
  `profile_id` int(10) unsigned NOT NULL DEFAULT 0,
  `view_state` smallint(6) NOT NULL DEFAULT 10,
  `summary` varchar(128) NOT NULL DEFAULT '',
  `sponsorship_total` int(11) NOT NULL DEFAULT 0,
  `sticky` tinyint(4) NOT NULL DEFAULT 0,
  `target_version` varchar(64) NOT NULL DEFAULT '',
  `category_id` int(10) unsigned NOT NULL DEFAULT 1,
  `date_submitted` int(10) unsigned NOT NULL DEFAULT 1,
  `due_date` int(10) unsigned NOT NULL DEFAULT 1,
  `last_updated` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_bug_sponsorship_total` (`sponsorship_total`),
  KEY `idx_bug_fixed_in_version` (`fixed_in_version`),
  KEY `idx_bug_status` (`status`),
  KEY `idx_project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_bug_tag_table
DROP TABLE IF EXISTS `mantis_bug_tag_table`;
CREATE TABLE IF NOT EXISTS `mantis_bug_tag_table` (
  `bug_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tag_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_attached` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`bug_id`,`tag_id`),
  KEY `idx_bug_tag_tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_bug_text_table
DROP TABLE IF EXISTS `mantis_bug_text_table`;
CREATE TABLE IF NOT EXISTS `mantis_bug_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `steps_to_reproduce` longtext NOT NULL,
  `additional_information` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_category_table
DROP TABLE IF EXISTS `mantis_category_table`;
CREATE TABLE IF NOT EXISTS `mantis_category_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category_project_name` (`project_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_config_table
DROP TABLE IF EXISTS `mantis_config_table`;
CREATE TABLE IF NOT EXISTS `mantis_config_table` (
  `config_id` varchar(64) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `access_reqd` int(11) DEFAULT 0,
  `type` int(11) DEFAULT 90,
  `value` longtext NOT NULL,
  PRIMARY KEY (`config_id`,`project_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_custom_field_project_table
DROP TABLE IF EXISTS `mantis_custom_field_project_table`;
CREATE TABLE IF NOT EXISTS `mantis_custom_field_project_table` (
  `field_id` int(11) NOT NULL DEFAULT 0,
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sequence` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`field_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_custom_field_string_table
DROP TABLE IF EXISTS `mantis_custom_field_string_table`;
CREATE TABLE IF NOT EXISTS `mantis_custom_field_string_table` (
  `field_id` int(11) NOT NULL DEFAULT 0,
  `bug_id` int(11) NOT NULL DEFAULT 0,
  `value` varchar(255) NOT NULL DEFAULT '',
  `text` longtext DEFAULT NULL,
  PRIMARY KEY (`field_id`,`bug_id`),
  KEY `idx_custom_field_bug` (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_custom_field_table
DROP TABLE IF EXISTS `mantis_custom_field_table`;
CREATE TABLE IF NOT EXISTS `mantis_custom_field_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT 0,
  `possible_values` text DEFAULT NULL,
  `default_value` varchar(255) NOT NULL DEFAULT '',
  `valid_regexp` varchar(255) NOT NULL DEFAULT '',
  `access_level_r` smallint(6) NOT NULL DEFAULT 0,
  `access_level_rw` smallint(6) NOT NULL DEFAULT 0,
  `length_min` int(11) NOT NULL DEFAULT 0,
  `length_max` int(11) NOT NULL DEFAULT 0,
  `require_report` tinyint(4) NOT NULL DEFAULT 0,
  `require_update` tinyint(4) NOT NULL DEFAULT 0,
  `display_report` tinyint(4) NOT NULL DEFAULT 0,
  `display_update` tinyint(4) NOT NULL DEFAULT 1,
  `require_resolved` tinyint(4) NOT NULL DEFAULT 0,
  `display_resolved` tinyint(4) NOT NULL DEFAULT 0,
  `display_closed` tinyint(4) NOT NULL DEFAULT 0,
  `require_closed` tinyint(4) NOT NULL DEFAULT 0,
  `filter_by` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_custom_field_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_email_table
DROP TABLE IF EXISTS `mantis_email_table`;
CREATE TABLE IF NOT EXISTS `mantis_email_table` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL DEFAULT '',
  `subject` varchar(250) NOT NULL DEFAULT '',
  `metadata` longtext NOT NULL,
  `body` longtext NOT NULL,
  `submitted` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_filters_table
DROP TABLE IF EXISTS `mantis_filters_table`;
CREATE TABLE IF NOT EXISTS `mantis_filters_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `is_public` tinyint(4) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `filter_string` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_news_table
DROP TABLE IF EXISTS `mantis_news_table`;
CREATE TABLE IF NOT EXISTS `mantis_news_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `poster_id` int(10) unsigned NOT NULL DEFAULT 0,
  `view_state` smallint(6) NOT NULL DEFAULT 10,
  `announcement` tinyint(4) NOT NULL DEFAULT 0,
  `headline` varchar(64) NOT NULL DEFAULT '',
  `body` longtext NOT NULL,
  `last_modified` int(10) unsigned NOT NULL DEFAULT 1,
  `date_posted` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_plugin_table
DROP TABLE IF EXISTS `mantis_plugin_table`;
CREATE TABLE IF NOT EXISTS `mantis_plugin_table` (
  `basename` varchar(40) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 0,
  `protected` tinyint(4) NOT NULL DEFAULT 0,
  `priority` int(10) unsigned NOT NULL DEFAULT 3,
  PRIMARY KEY (`basename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_project_file_table
DROP TABLE IF EXISTS `mantis_project_file_table`;
CREATE TABLE IF NOT EXISTS `mantis_project_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT 0,
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `content` longblob DEFAULT NULL,
  `date_added` int(10) unsigned NOT NULL DEFAULT 1,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_project_hierarchy_table
DROP TABLE IF EXISTS `mantis_project_hierarchy_table`;
CREATE TABLE IF NOT EXISTS `mantis_project_hierarchy_table` (
  `child_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `inherit_parent` tinyint(4) NOT NULL DEFAULT 0,
  UNIQUE KEY `idx_project_hierarchy` (`child_id`,`parent_id`),
  KEY `idx_project_hierarchy_child_id` (`child_id`),
  KEY `idx_project_hierarchy_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_project_table
DROP TABLE IF EXISTS `mantis_project_table`;
CREATE TABLE IF NOT EXISTS `mantis_project_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT 10,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `view_state` smallint(6) NOT NULL DEFAULT 10,
  `access_min` smallint(6) NOT NULL DEFAULT 10,
  `file_path` varchar(250) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT 1,
  `inherit_global` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_name` (`name`),
  KEY `idx_project_view` (`view_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_project_user_list_table
DROP TABLE IF EXISTS `mantis_project_user_list_table`;
CREATE TABLE IF NOT EXISTS `mantis_project_user_list_table` (
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `access_level` smallint(6) NOT NULL DEFAULT 10,
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `idx_project_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_project_version_table
DROP TABLE IF EXISTS `mantis_project_version_table`;
CREATE TABLE IF NOT EXISTS `mantis_project_version_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `version` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `released` tinyint(4) NOT NULL DEFAULT 1,
  `obsolete` tinyint(4) NOT NULL DEFAULT 0,
  `date_order` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_version` (`project_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_sponsorship_table
DROP TABLE IF EXISTS `mantis_sponsorship_table`;
CREATE TABLE IF NOT EXISTS `mantis_sponsorship_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `logo` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(128) NOT NULL DEFAULT '',
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `date_submitted` int(10) unsigned NOT NULL DEFAULT 1,
  `last_updated` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_sponsorship_bug_id` (`bug_id`),
  KEY `idx_sponsorship_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_tag_table
DROP TABLE IF EXISTS `mantis_tag_table`;
CREATE TABLE IF NOT EXISTS `mantis_tag_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `date_created` int(10) unsigned NOT NULL DEFAULT 1,
  `date_updated` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`,`name`),
  KEY `idx_tag_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_tokens_table
DROP TABLE IF EXISTS `mantis_tokens_table`;
CREATE TABLE IF NOT EXISTS `mantis_tokens_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `value` longtext NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 1,
  `expiry` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_typeowner` (`type`,`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_user_pref_table
DROP TABLE IF EXISTS `mantis_user_pref_table`;
CREATE TABLE IF NOT EXISTS `mantis_user_pref_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `project_id` int(10) unsigned NOT NULL DEFAULT 0,
  `default_profile` int(10) unsigned NOT NULL DEFAULT 0,
  `default_project` int(10) unsigned NOT NULL DEFAULT 0,
  `refresh_delay` int(11) NOT NULL DEFAULT 0,
  `redirect_delay` int(11) NOT NULL DEFAULT 0,
  `bugnote_order` varchar(4) NOT NULL DEFAULT 'ASC',
  `email_on_new` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_assigned` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_feedback` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_resolved` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_closed` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_reopened` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_bugnote` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_status` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_priority` tinyint(4) NOT NULL DEFAULT 0,
  `email_on_priority_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_status_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_bugnote_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_reopened_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_closed_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_resolved_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_feedback_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_assigned_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_on_new_min_severity` smallint(6) NOT NULL DEFAULT 10,
  `email_bugnote_limit` smallint(6) NOT NULL DEFAULT 0,
  `language` varchar(32) NOT NULL DEFAULT 'english',
  `timezone` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_user_print_pref_table
DROP TABLE IF EXISTS `mantis_user_print_pref_table`;
CREATE TABLE IF NOT EXISTS `mantis_user_print_pref_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `print_pref` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_user_profile_table
DROP TABLE IF EXISTS `mantis_user_profile_table`;
CREATE TABLE IF NOT EXISTS `mantis_user_profile_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `platform` varchar(32) NOT NULL DEFAULT '',
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bugtracker.mantis_user_table
DROP TABLE IF EXISTS `mantis_user_table`;
CREATE TABLE IF NOT EXISTS `mantis_user_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) NOT NULL DEFAULT '',
  `realname` varchar(191) NOT NULL DEFAULT '',
  `email` varchar(191) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `protected` tinyint(4) NOT NULL DEFAULT 0,
  `access_level` smallint(6) NOT NULL DEFAULT 10,
  `login_count` int(11) NOT NULL DEFAULT 0,
  `lost_password_request_count` smallint(6) NOT NULL DEFAULT 0,
  `failed_login_count` smallint(6) NOT NULL DEFAULT 0,
  `cookie_string` varchar(64) NOT NULL DEFAULT '',
  `last_visit` int(10) unsigned NOT NULL DEFAULT 1,
  `date_created` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_cookie_string` (`cookie_string`),
  UNIQUE KEY `idx_user_username` (`username`),
  KEY `idx_enable` (`enabled`),
  KEY `idx_access` (`access_level`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=UTF8;


-- ##########################################################
-- ## Preenchedo com informações iniciais o banco de dados ##
-- ##########################################################
#Configurações
INSERT INTO `mantis_config_table` (`config_id`, `project_id`, `user_id`, `access_reqd`, `type`, `value`) VALUES ('database_version', 0, 0, 90, 1, '209');
INSERT INTO `mantis_plugin_table` (`basename`, `enabled`, `protected`, `priority`) VALUES ('MantisCoreFormatting', 1, 0, 3);
#Categoria
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (101, 0, 0, 'Categoria A', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (102, 0, 0, 'Categoria B', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (1, 0, 0, 'Categoria_1', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (2, 0, 0, 'Categoria_2', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (3, 0, 0, 'Categoria_3', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (4, 0, 0, 'Categoria_4', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (5, 0, 0, 'Categoria_5', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (6, 0, 0, 'Categoria_6', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (7, 0, 0, 'Categoria_7', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (8, 0, 0, 'Categoria_8', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (9, 0, 0, 'Categoria_9', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (10, 0, 0, 'Categoria_10', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (11, 0, 0, 'Categoria_11', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (12, 0, 0, 'Categoria_12', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (13, 0, 0, 'Categoria_13', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (14, 0, 0, 'Categoria_14', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (15, 0, 0, 'Categoria_15', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (16, 0, 0, 'Categoria_16', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (17, 0, 0, 'Categoria_17', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (18, 0, 0, 'Categoria_18', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (19, 0, 0, 'Categoria_19', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (20, 0, 0, 'Categoria_20', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (21, 0, 0, 'Categoria_21', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (22, 0, 0, 'Categoria_22', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (23, 0, 0, 'Categoria_23', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (24, 0, 0, 'Categoria_24', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (25, 0, 0, 'Categoria_25', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (26, 0, 0, 'Categoria_26', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (27, 0, 0, 'Categoria_27', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (28, 0, 0, 'Categoria_28', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (29, 0, 0, 'Categoria_29', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (30, 0, 0, 'Categoria_30', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (31, 0, 0, 'Categoria_31', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (32, 0, 0, 'Categoria_32', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (33, 0, 0, 'Categoria_33', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (34, 0, 0, 'Categoria_34', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (35, 0, 0, 'Categoria_35', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (36, 0, 0, 'Categoria_36', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (37, 0, 0, 'Categoria_37', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (38, 0, 0, 'Categoria_38', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (39, 0, 0, 'Categoria_39', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (40, 0, 0, 'Categoria_40', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (41, 0, 0, 'Categoria_41', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (42, 0, 0, 'Categoria_42', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (43, 0, 0, 'Categoria_43', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (44, 0, 0, 'Categoria_44', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (45, 0, 0, 'Categoria_45', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (46, 0, 0, 'Categoria_46', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (47, 0, 0, 'Categoria_47', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (48, 0, 0, 'Categoria_48', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (49, 0, 0, 'Categoria_49', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (50, 0, 0, 'Categoria_50', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (51, 0, 0, 'Categoria_51', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (52, 0, 0, 'Categoria_52', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (53, 0, 0, 'Categoria_53', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (54, 0, 0, 'Categoria_54', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (55, 0, 0, 'Categoria_55', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (56, 0, 0, 'Categoria_56', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (57, 0, 0, 'Categoria_57', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (58, 0, 0, 'Categoria_58', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (59, 0, 0, 'Categoria_59', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (60, 0, 0, 'Categoria_60', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (61, 0, 0, 'Categoria_61', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (62, 0, 0, 'Categoria_62', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (63, 0, 0, 'Categoria_63', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (64, 0, 0, 'Categoria_64', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (65, 0, 0, 'Categoria_65', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (66, 0, 0, 'Categoria_66', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (67, 0, 0, 'Categoria_67', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (68, 0, 0, 'Categoria_68', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (69, 0, 0, 'Categoria_69', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (70, 0, 0, 'Categoria_70', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (71, 0, 0, 'Categoria_71', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (72, 0, 0, 'Categoria_72', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (73, 0, 0, 'Categoria_73', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (74, 0, 0, 'Categoria_74', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (75, 0, 0, 'Categoria_75', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (76, 0, 0, 'Categoria_76', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (77, 0, 0, 'Categoria_77', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (78, 0, 0, 'Categoria_78', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (79, 0, 0, 'Categoria_79', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (80, 0, 0, 'Categoria_80', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (81, 0, 0, 'Categoria_81', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (82, 0, 0, 'Categoria_82', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (83, 0, 0, 'Categoria_83', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (84, 0, 0, 'Categoria_84', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (85, 0, 0, 'Categoria_85', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (86, 0, 0, 'Categoria_86', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (87, 0, 0, 'Categoria_87', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (88, 0, 0, 'Categoria_88', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (89, 0, 0, 'Categoria_89', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (90, 0, 0, 'Categoria_90', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (91, 0, 0, 'Categoria_91', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (92, 0, 0, 'Categoria_92', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (93, 0, 0, 'Categoria_93', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (94, 0, 0, 'Categoria_94', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (95, 0, 0, 'Categoria_95', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (96, 0, 0, 'Categoria_96', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (97, 0, 0, 'Categoria_97', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (98, 0, 0, 'Categoria_98', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (99, 0, 0, 'Categoria_99', 0);
INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES (100, 0, 0, 'Categoria_100', 0);
#Usuários
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (1,'usuario_1','usuario_1','usuario_1_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiyUQ17f',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (2,'usuario_2','usuario_2','usuario_2_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXui2UQY7f',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (3,'usuario_3','usuario_3','usuario_3_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA36ZBRcXuiyUQY7f',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (4,'usuario_4','usuario_4','usuario_4_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2s486ZBRcXuiyUQY7f',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (5,'usuario_5','usuario_5','usuario_5_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR5sA86ZBRcXuiyUQY7f',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (6,'usuario_6','usuario_6','usuario_6_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD56aR2sA86ZBRcXuiyUQY7f',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (7,'usuario_7','usuario_7','usuario_7_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD75aR2sA86ZBRcXuiyUQY7f',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (8,'usuario_8','usuario_8','usuario_8_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiyUQ000',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (9,'usuario_9','usuario_9','usuario_9_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2s886ZBRcXuiyUQY7f',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (10,'usuario_10','usuario_10','usuario_10_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-W9PD55aR2sA86ZBRcXuiyUQY7f',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (11,'usuario_11','usuario_11','usuario_11_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-W0PD55aR2sA86ZBRcXuiyUQY7f',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (12,'usuario_12','usuario_12','usuario_12_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WR0D55aR2sA86ZBRcXuiyUQY7f',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (13,'usuario_13','usuario_13','usuario_13_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiyU001Q',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (14,'usuario_14','usuario_14','usuario_14_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiy002UQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (15,'usuario_15','usuario_15','usuario_15_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBR003cXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (16,'usuario_16','usuario_16','usuario_16_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRc004XuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (17,'usuario_17','usuario_17','usuario_17_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBR005cXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (18,'usuario_18','usuario_18','usuario_18_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRc006XuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (19,'usuario_19','usuario_19','usuario_19_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXu007iyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (20,'usuario_20','usuario_20','usuario_20_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiy008UQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (21,'usuario_21','usuario_21','usuario_21_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiy009UQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (22,'usuario_22','usuario_22','usuario_22_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXu010iyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (23,'usuario_23','usuario_23','usuario_23_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA01186ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (24,'usuario_24','usuario_24','usuario_24_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA01286ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (25,'usuario_25','usuario_25','usuario_25_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZB013RcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (26,'usuario_26','usuario_26','usuario_26_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR0142sA86ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (27,'usuario_27','usuario_27','usuario_27_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86Z105BRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (28,'usuario_28','usuario_28','usuario_28_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZB016RcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (29,'usuario_29','usuario_29','usuario_29_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86017ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (30,'usuario_30','usuario_30','usuario_30_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXui108yUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (31,'usuario_31','usuario_31','usuario_31_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA80196ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (32,'usuario_32','usuario_32','usuario_32_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZB020RcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (33,'usuario_33','usuario_33','usuario_33_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD50215aR2sA86ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (34,'usuario_34','usuario_34','usuario_34_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2022sA86ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (35,'usuario_35','usuario_35','usuario_35_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR0232sA86ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (36,'usuario_36','usuario_36','usuario_36_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRP024D55aR2sA86ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (37,'usuario_37','usuario_37','usuario_37_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRP025D55aR2sA86ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (38,'usuario_38','usuario_38','usuario_38_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86026ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (39,'usuario_39','usuario_39','usuario_39_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA02786ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (40,'usuario_40','usuario_40','usuario_40_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86028ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (41,'usuario_41','usuario_41','usuario_41_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA80296ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (42,'usuario_42','usuario_42','usuario_42_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA03086ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (43,'usuario_43','usuario_43','usuario_43_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86Z031BRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (44,'usuario_44','usuario_44','usuario_44_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA80326ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (45,'usuario_45','usuario_45','usuario_45_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA80336ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (46,'usuario_46','usuario_46','usuario_46_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZB034RcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (47,'usuario_47','usuario_47','usuario_47_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86Z035BRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (48,'usuario_48','usuario_48','usuario_48_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2036sA86ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (49,'usuario_49','usuario_49','usuario_49_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR0372sA86ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (50,'usuario_50','usuario_50','usuario_50_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXui038yUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (51,'usuario_51','usuario_51','usuario_51_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZB039RcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (52,'usuario_52','usuario_52','usuario_52_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86040ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (53,'usuario_53','usuario_53','usuario_53_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86Z041RcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (54,'usuario_54','usuario_54','usuario_54_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA80426ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (55,'usuario_55','usuario_55','usuario_55_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86Z043BRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (56,'usuario_56','usuario_56','usuario_56_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBR044cXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (57,'usuario_57','usuario_57','usuario_57_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBR045cXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (58,'usuario_58','usuario_58','usuario_58_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXu046iyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (59,'usuario_59','usuario_59','usuario_59_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86Z047BRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (60,'usuario_60','usuario_60','usuario_60_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55a048R2sA86ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (61,'usuario_61','usuario_61','usuario_61_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRc049XuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (62,'usuario_62','usuario_62','usuario_62_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcX050uiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (63,'usuario_63','usuario_63','usuario_63_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86Z052BRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (64,'usuario_64','usuario_64','usuario_64_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXui053yUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (65,'usuario_65','usuario_65','usuario_65_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcX054uiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (66,'usuario_66','usuario_66','usuario_66_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86055ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (67,'usuario_67','usuario_67','usuario_67_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZB056RcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (68,'usuario_68','usuario_68','usuario_68_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA05786ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (69,'usuario_69','usuario_69','usuario_69_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXui058yUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (70,'usuario_70','usuario_70','usuario_70_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXu059iyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (71,'usuario_71','usuario_71','usuario_71_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXu060iyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (72,'usuario_72','usuario_72','usuario_72_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXu061iyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (73,'usuario_73','usuario_73','usuario_73_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBR062cXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (74,'usuario_74','usuario_74','usuario_74_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86063ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (75,'usuario_75','usuario_75','usuario_75_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZB064RcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (76,'usuario_76','usuario_76','usuario_76_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXui065yUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (77,'usuario_77','usuario_77','usuario_77_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiyU066Q',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (78,'usuario_78','usuario_78','usuario_78_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRc067XuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (79,'usuario_79','usuario_79','usuario_79_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXui068yUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (80,'usuario_80','usuario_80','usuario_80_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXu069iyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (81,'usuario_81','usuario_81','usuario_81_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBR070cXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (82,'usuario_82','usuario_82','usuario_82_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRc071XuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (83,'usuario_83','usuario_83','usuario_83_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXu072iyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (84,'usuario_84','usuario_84','usuario_84_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXui073yUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (85,'usuario_85','usuario_85','usuario_85_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXui074yUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (86,'usuario_86','usuario_86','usuario_86_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiy075UQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (87,'usuario_87','usuario_87','usuario_87_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiy076UQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (88,'usuario_88','usuario_88','usuario_88_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiyU077Q',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (89,'usuario_89','usuario_89','usuario_89_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86Z078BRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (90,'usuario_90','usuario_90','usuario_90_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZB079RcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (91,'usuario_91','usuario_91','usuario_91_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcX080uiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (92,'usuario_92','usuario_92','usuario_92_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiy081UQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (93,'usuario_93','usuario_93','usuario_93_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiyU082Q',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (94,'usuario_94','usuario_94','usuario_94_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiyUQ083',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (95,'usuario_95','usuario_95','usuario_95_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiyUQ084',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (96,'usuario_96','usuario_96','usuario_96_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcXuiyU085Q',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (97,'usuario_97','usuario_97','usuario_97_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA86ZBRcX086uiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (98,'usuario_98','usuario_98','usuario_98_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2087sA86ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (99,'usuario_99','usuario_99','usuario_99_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2088sA86ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id` ,`username` ,`realname` ,`email` ,`password` ,`enabled` ,`protected` ,`access_level` ,`login_count` ,`lost_password_request_count` ,`failed_login_count` ,`cookie_string` ,`last_visit` ,`date_created`) VALUES (100,'usuario_100','usuario_100','usuario_100_email@base2.com.br','27e7a36bcf13fb4fdc9994adc0f366d3',1,0,55,0,0,0,'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2089sA86ZBRcXuiyUQ',1629901236,1629901236);
INSERT INTO `mantis_user_table` (`id`, `username`, `realname`, `email`, `password`, `enabled`, `protected`, `access_level`, `login_count`, `lost_password_request_count`, `failed_login_count`, `cookie_string`, `last_visit`, `date_created`) VALUES (101, 'administrator', 'administrador', 'root@localhost', '27e7a36bcf13fb4fdc9994adc0f366d3', 1, 0, 90, 6, 0, 0, 'lqrp_y262orNiix5seAwfjPjbmYwgvLYEPs4I-WO7WrI-SdbYmmm_reidlyHJXRj', 1594728550, 1594724194);
INSERT INTO `mantis_user_table` (`id`, `username`, `realname`, `email`, `password`, `enabled`, `protected`, `access_level`, `login_count`, `lost_password_request_count`, `failed_login_count`, `cookie_string`, `last_visit`, `date_created`) VALUES (102, 'usu1', 'usu1', 'usu1@base2.com.br', '27e7a36bcf13fb4fdc9994adc0f366d3', 1, 0, 55, 0, 0, 0, 'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2s090A86ZBRcXuiyUQ', 1629901236, 1629901236);
INSERT INTO `mantis_user_table` (`id`, `username`, `realname`, `email`, `password`, `enabled`, `protected`, `access_level`, `login_count`, `lost_password_request_count`, `failed_login_count`, `cookie_string`, `last_visit`, `date_created`) VALUES (103, 'usu2', 'usu2', 'usu2@base2.com.br', '27e7a36bcf13fb4fdc9994adc0f366d3', 1, 0, 55, 0, 0, 0, 'VrWhJdT03RlSCgJZWKrxV7DyvNKFD20TXWFkL-WRPD55aR2sA09186ZBRcXuiyUQ', 1629901236, 1629901236);
#Projeto
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('1', 'Projeto_1', 'Descrição projeto_1', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('2', 'Projeto_2', 'Descrição projeto_2', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('3', 'Projeto_3', 'Descrição projeto_3', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('4', 'Projeto_4', 'Descrição projeto_4', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('5', 'Projeto_5', 'Descrição projeto_5', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('6', 'Projeto_6', 'Descrição projeto_6', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('7', 'Projeto_7', 'Descrição projeto_7', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('8', 'Projeto_8', 'Descrição projeto_8', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('9', 'Projeto_9', 'Descrição projeto_9', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('10', 'Projeto_10', 'Descrição projeto_10', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('11', 'Projeto_11', 'Descrição projeto_11', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('12', 'Projeto_12', 'Descrição projeto_12', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('13', 'Projeto_13', 'Descrição projeto_13', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('14', 'Projeto_14', 'Descrição projeto_14', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('15', 'Projeto_15', 'Descrição projeto_15', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('16', 'Projeto_16', 'Descrição projeto_16', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('17', 'Projeto_17', 'Descrição projeto_17', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('18', 'Projeto_18', 'Descrição projeto_18', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('19', 'Projeto_19', 'Descrição projeto_19', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('20', 'Projeto_20', 'Descrição projeto_20', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('21', 'Projeto_21', 'Descrição projeto_21', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('22', 'Projeto_22', 'Descrição projeto_22', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('23', 'Projeto_23', 'Descrição projeto_23', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('24', 'Projeto_24', 'Descrição projeto_24', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('25', 'Projeto_25', 'Descrição projeto_25', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('26', 'Projeto_26', 'Descrição projeto_26', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('27', 'Projeto_27', 'Descrição projeto_27', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('28', 'Projeto_28', 'Descrição projeto_28', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('29', 'Projeto_29', 'Descrição projeto_29', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('30', 'Projeto_30', 'Descrição projeto_30', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('31', 'Projeto_31', 'Descrição projeto_31', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('32', 'Projeto_32', 'Descrição projeto_32', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('33', 'Projeto_33', 'Descrição projeto_33', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('34', 'Projeto_34', 'Descrição projeto_34', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('35', 'Projeto_35', 'Descrição projeto_35', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('36', 'Projeto_36', 'Descrição projeto_36', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('37', 'Projeto_37', 'Descrição projeto_37', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('38', 'Projeto_38', 'Descrição projeto_38', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('39', 'Projeto_39', 'Descrição projeto_39', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('40', 'Projeto_40', 'Descrição projeto_40', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('41', 'Projeto_41', 'Descrição projeto_41', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('42', 'Projeto_42', 'Descrição projeto_42', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('43', 'Projeto_43', 'Descrição projeto_43', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('44', 'Projeto_44', 'Descrição projeto_44', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('45', 'Projeto_45', 'Descrição projeto_45', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('46', 'Projeto_46', 'Descrição projeto_46', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('47', 'Projeto_47', 'Descrição projeto_47', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('48', 'Projeto_48', 'Descrição projeto_48', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('49', 'Projeto_49', 'Descrição projeto_49', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('50', 'Projeto_50', 'Descrição projeto_50', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('51', 'Projeto_51', 'Descrição projeto_51', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('52', 'Projeto_52', 'Descrição projeto_52', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('53', 'Projeto_53', 'Descrição projeto_53', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('54', 'Projeto_54', 'Descrição projeto_54', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('55', 'Projeto_55', 'Descrição projeto_55', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('56', 'Projeto_56', 'Descrição projeto_56', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('57', 'Projeto_57', 'Descrição projeto_57', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('58', 'Projeto_58', 'Descrição projeto_58', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('59', 'Projeto_59', 'Descrição projeto_59', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('60', 'Projeto_60', 'Descrição projeto_60', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('61', 'Projeto_61', 'Descrição projeto_61', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('62', 'Projeto_62', 'Descrição projeto_62', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('63', 'Projeto_63', 'Descrição projeto_63', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('64', 'Projeto_64', 'Descrição projeto_64', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('65', 'Projeto_65', 'Descrição projeto_65', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('66', 'Projeto_66', 'Descrição projeto_66', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('67', 'Projeto_67', 'Descrição projeto_67', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('68', 'Projeto_68', 'Descrição projeto_68', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('69', 'Projeto_69', 'Descrição projeto_69', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('70', 'Projeto_70', 'Descrição projeto_70', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('71', 'Projeto_71', 'Descrição projeto_71', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('72', 'Projeto_72', 'Descrição projeto_72', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('73', 'Projeto_73', 'Descrição projeto_73', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('74', 'Projeto_74', 'Descrição projeto_74', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('75', 'Projeto_75', 'Descrição projeto_75', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('76', 'Projeto_76', 'Descrição projeto_76', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('77', 'Projeto_77', 'Descrição projeto_77', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('78', 'Projeto_78', 'Descrição projeto_78', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('79', 'Projeto_79', 'Descrição projeto_79', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('80', 'Projeto_80', 'Descrição projeto_80', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('81', 'Projeto_81', 'Descrição projeto_81', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('82', 'Projeto_82', 'Descrição projeto_82', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('83', 'Projeto_83', 'Descrição projeto_83', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('84', 'Projeto_84', 'Descrição projeto_84', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('85', 'Projeto_85', 'Descrição projeto_85', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('86', 'Projeto_86', 'Descrição projeto_86', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('87', 'Projeto_87', 'Descrição projeto_87', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('88', 'Projeto_88', 'Descrição projeto_88', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('89', 'Projeto_89', 'Descrição projeto_89', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('90', 'Projeto_90', 'Descrição projeto_90', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('91', 'Projeto_91', 'Descrição projeto_91', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('92', 'Projeto_92', 'Descrição projeto_92', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('93', 'Projeto_93', 'Descrição projeto_93', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('94', 'Projeto_94', 'Descrição projeto_94', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('95', 'Projeto_95', 'Descrição projeto_95', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('96', 'Projeto_96', 'Descrição projeto_96', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('97', 'Projeto_97', 'Descrição projeto_97', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('98', 'Projeto_98', 'Descrição projeto_98', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('99', 'Projeto_99', 'Descrição projeto_99', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('100', 'Projeto_100', 'Descrição projeto_100', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('101', 'Projeto Default A', 'Descrição projeto default A', '1');
INSERT INTO `bugtracker`.`mantis_project_table` (`id`, `name`, `description`, `inherit_global`) VALUES ('102', 'Projeto Default B', 'Descrição projeto default B', '1');
#Perfil/Profile
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('101', 'Plataforma Default A', 'SO Default A', 'Versão Original A', 'Descrição sobre o sistema operacional default A');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('102', 'Plataforma Default B', 'SO Default B', 'Versão Original B', 'Descrição sobre o sistema operacional default B');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('1', 'Plataforma_1', 'SO_1', 'Versão_	1', 'Descrição_1');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('2', 'Plataforma_2', 'SO_2', 'Versão_	2', 'Descrição_2');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('3', 'Plataforma_3', 'SO_3', 'Versão_	3', 'Descrição_3');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('4', 'Plataforma_4', 'SO_4', 'Versão_	4', 'Descrição_4');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('5', 'Plataforma_5', 'SO_5', 'Versão_	5', 'Descrição_5');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('6', 'Plataforma_6', 'SO_6', 'Versão_	6', 'Descrição_6');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('7', 'Plataforma_7', 'SO_7', 'Versão_	7', 'Descrição_7');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('8', 'Plataforma_8', 'SO_8', 'Versão_	8', 'Descrição_8');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('9', 'Plataforma_9', 'SO_9', 'Versão_	9', 'Descrição_9');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('10', 'Plataforma_10', 'SO_10', 'Versão_	10', 'Descrição_10');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('11', 'Plataforma_11', 'SO_11', 'Versão_	11', 'Descrição_11');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('12', 'Plataforma_12', 'SO_12', 'Versão_	12', 'Descrição_12');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('13', 'Plataforma_13', 'SO_13', 'Versão_	13', 'Descrição_13');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('14', 'Plataforma_14', 'SO_14', 'Versão_	14', 'Descrição_14');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('15', 'Plataforma_15', 'SO_15', 'Versão_	15', 'Descrição_15');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('16', 'Plataforma_16', 'SO_16', 'Versão_	16', 'Descrição_16');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('17', 'Plataforma_17', 'SO_17', 'Versão_	17', 'Descrição_17');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('18', 'Plataforma_18', 'SO_18', 'Versão_	18', 'Descrição_18');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('19', 'Plataforma_19', 'SO_19', 'Versão_	19', 'Descrição_19');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('20', 'Plataforma_20', 'SO_20', 'Versão_	20', 'Descrição_20');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('21', 'Plataforma_21', 'SO_21', 'Versão_	21', 'Descrição_21');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('22', 'Plataforma_22', 'SO_22', 'Versão_	22', 'Descrição_22');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('23', 'Plataforma_23', 'SO_23', 'Versão_	23', 'Descrição_23');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('24', 'Plataforma_24', 'SO_24', 'Versão_	24', 'Descrição_24');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('25', 'Plataforma_25', 'SO_25', 'Versão_	25', 'Descrição_25');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('26', 'Plataforma_26', 'SO_26', 'Versão_	26', 'Descrição_26');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('27', 'Plataforma_27', 'SO_27', 'Versão_	27', 'Descrição_27');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('28', 'Plataforma_28', 'SO_28', 'Versão_	28', 'Descrição_28');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('29', 'Plataforma_29', 'SO_29', 'Versão_	29', 'Descrição_29');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('30', 'Plataforma_30', 'SO_30', 'Versão_	30', 'Descrição_30');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('31', 'Plataforma_31', 'SO_31', 'Versão_	31', 'Descrição_31');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('32', 'Plataforma_32', 'SO_32', 'Versão_	32', 'Descrição_32');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('33', 'Plataforma_33', 'SO_33', 'Versão_	33', 'Descrição_33');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('34', 'Plataforma_34', 'SO_34', 'Versão_	34', 'Descrição_34');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('35', 'Plataforma_35', 'SO_35', 'Versão_	35', 'Descrição_35');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('36', 'Plataforma_36', 'SO_36', 'Versão_	36', 'Descrição_36');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('37', 'Plataforma_37', 'SO_37', 'Versão_	37', 'Descrição_37');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('38', 'Plataforma_38', 'SO_38', 'Versão_	38', 'Descrição_38');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('39', 'Plataforma_39', 'SO_39', 'Versão_	39', 'Descrição_39');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('40', 'Plataforma_40', 'SO_40', 'Versão_	40', 'Descrição_40');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('41', 'Plataforma_41', 'SO_41', 'Versão_	41', 'Descrição_41');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('42', 'Plataforma_42', 'SO_42', 'Versão_	42', 'Descrição_42');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('43', 'Plataforma_43', 'SO_43', 'Versão_	43', 'Descrição_43');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('44', 'Plataforma_44', 'SO_44', 'Versão_	44', 'Descrição_44');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('45', 'Plataforma_45', 'SO_45', 'Versão_	45', 'Descrição_45');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('46', 'Plataforma_46', 'SO_46', 'Versão_	46', 'Descrição_46');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('47', 'Plataforma_47', 'SO_47', 'Versão_	47', 'Descrição_47');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('48', 'Plataforma_48', 'SO_48', 'Versão_	48', 'Descrição_48');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('49', 'Plataforma_49', 'SO_49', 'Versão_	49', 'Descrição_49');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('50', 'Plataforma_50', 'SO_50', 'Versão_	50', 'Descrição_50');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('51', 'Plataforma_51', 'SO_51', 'Versão_	51', 'Descrição_51');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('52', 'Plataforma_52', 'SO_52', 'Versão_	52', 'Descrição_52');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('53', 'Plataforma_53', 'SO_53', 'Versão_	53', 'Descrição_53');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('54', 'Plataforma_54', 'SO_54', 'Versão_	54', 'Descrição_54');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('55', 'Plataforma_55', 'SO_55', 'Versão_	55', 'Descrição_55');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('56', 'Plataforma_56', 'SO_56', 'Versão_	56', 'Descrição_56');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('57', 'Plataforma_57', 'SO_57', 'Versão_	57', 'Descrição_57');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('58', 'Plataforma_58', 'SO_58', 'Versão_	58', 'Descrição_58');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('59', 'Plataforma_59', 'SO_59', 'Versão_	59', 'Descrição_59');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('60', 'Plataforma_60', 'SO_60', 'Versão_	60', 'Descrição_60');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('61', 'Plataforma_61', 'SO_61', 'Versão_	61', 'Descrição_61');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('62', 'Plataforma_62', 'SO_62', 'Versão_	62', 'Descrição_62');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('63', 'Plataforma_63', 'SO_63', 'Versão_	63', 'Descrição_63');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('64', 'Plataforma_64', 'SO_64', 'Versão_	64', 'Descrição_64');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('65', 'Plataforma_65', 'SO_65', 'Versão_	65', 'Descrição_65');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('66', 'Plataforma_66', 'SO_66', 'Versão_	66', 'Descrição_66');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('67', 'Plataforma_67', 'SO_67', 'Versão_	67', 'Descrição_67');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('68', 'Plataforma_68', 'SO_68', 'Versão_	68', 'Descrição_68');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('69', 'Plataforma_69', 'SO_69', 'Versão_	69', 'Descrição_69');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('70', 'Plataforma_70', 'SO_70', 'Versão_	70', 'Descrição_70');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('71', 'Plataforma_71', 'SO_71', 'Versão_	71', 'Descrição_71');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('72', 'Plataforma_72', 'SO_72', 'Versão_	72', 'Descrição_72');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('73', 'Plataforma_73', 'SO_73', 'Versão_	73', 'Descrição_73');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('74', 'Plataforma_74', 'SO_74', 'Versão_	74', 'Descrição_74');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('75', 'Plataforma_75', 'SO_75', 'Versão_	75', 'Descrição_75');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('76', 'Plataforma_76', 'SO_76', 'Versão_	76', 'Descrição_76');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('77', 'Plataforma_77', 'SO_77', 'Versão_	77', 'Descrição_77');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('78', 'Plataforma_78', 'SO_78', 'Versão_	78', 'Descrição_78');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('79', 'Plataforma_79', 'SO_79', 'Versão_	79', 'Descrição_79');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('80', 'Plataforma_80', 'SO_80', 'Versão_	80', 'Descrição_80');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('81', 'Plataforma_81', 'SO_81', 'Versão_	81', 'Descrição_81');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('82', 'Plataforma_82', 'SO_82', 'Versão_	82', 'Descrição_82');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('83', 'Plataforma_83', 'SO_83', 'Versão_	83', 'Descrição_83');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('84', 'Plataforma_84', 'SO_84', 'Versão_	84', 'Descrição_84');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('85', 'Plataforma_85', 'SO_85', 'Versão_	85', 'Descrição_85');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('86', 'Plataforma_86', 'SO_86', 'Versão_	86', 'Descrição_86');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('87', 'Plataforma_87', 'SO_87', 'Versão_	87', 'Descrição_87');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('88', 'Plataforma_88', 'SO_88', 'Versão_	88', 'Descrição_88');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('89', 'Plataforma_89', 'SO_89', 'Versão_	89', 'Descrição_89');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('90', 'Plataforma_90', 'SO_90', 'Versão_	90', 'Descrição_90');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('91', 'Plataforma_91', 'SO_91', 'Versão_	91', 'Descrição_91');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('92', 'Plataforma_92', 'SO_92', 'Versão_	92', 'Descrição_92');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('93', 'Plataforma_93', 'SO_93', 'Versão_	93', 'Descrição_93');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('94', 'Plataforma_94', 'SO_94', 'Versão_	94', 'Descrição_94');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('95', 'Plataforma_95', 'SO_95', 'Versão_	95', 'Descrição_95');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('96', 'Plataforma_96', 'SO_96', 'Versão_	96', 'Descrição_96');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('97', 'Plataforma_97', 'SO_97', 'Versão_	97', 'Descrição_97');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('98', 'Plataforma_98', 'SO_98', 'Versão_	98', 'Descrição_98');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('99', 'Plataforma_99', 'SO_99', 'Versão_	99', 'Descrição_99');
INSERT INTO `mantis_user_profile_table` (`id`, `platform`, `os`, `os_build`, `description`) VALUES ('100', 'Plataforma_100', 'SO_100', 'Versão_	100', 'Descrição_100');
#Bug
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('1º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('2º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('3º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('4º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('5º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('6º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('7º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('8º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('9º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('10º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('11º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('12º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('13º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('14º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('15º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('16º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('17º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('18º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('19º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('20º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('21º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('22º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('23º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('24º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('25º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('26º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('27º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('28º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('29º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('30º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('31º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('32º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('33º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('34º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('35º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('36º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('37º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('38º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('39º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('40º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('41º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('42º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('43º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('44º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('45º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('46º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('47º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('48º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('49º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('50º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('51º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('52º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('53º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('54º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('55º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('56º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('57º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('58º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('59º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('60º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('61º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('62º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('63º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('64º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('65º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('66º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('67º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('68º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('69º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('70º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('71º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('72º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('73º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('74º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('75º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('76º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('77º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('78º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('79º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('80º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('81º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('82º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('83º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('84º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('85º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('86º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('87º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('88º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('89º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('90º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('91º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('92º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('93º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('94º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('95º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('96º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('97º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('98º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('99º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('100º_descrição report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('Descrição default: Primeiro report');
INSERT INTO `mantis_bug_text_table` (`description`) VALUES ('Descrição default2: Segundo report');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','1', '1','Resumo_1','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','2', '2','Resumo_2','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','3', '3','Resumo_3','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','4', '4','Resumo_4','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','5', '5','Resumo_5','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','6', '6','Resumo_6','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','7', '7','Resumo_7','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','8', '8','Resumo_8','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','9', '9','Resumo_9','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','10', '10','Resumo_10','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','11', '11','Resumo_11','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','12', '12','Resumo_12','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','13', '13','Resumo_13','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','14', '14','Resumo_14','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','15', '15','Resumo_15','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','16', '16','Resumo_16','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','17', '17','Resumo_17','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','18', '18','Resumo_18','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','19', '19','Resumo_19','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','20', '20','Resumo_20','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','21', '21','Resumo_21','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','22', '22','Resumo_22','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','23', '23','Resumo_23','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','24', '24','Resumo_24','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','25', '25','Resumo_25','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','26', '26','Resumo_26','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','27', '27','Resumo_27','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','28', '28','Resumo_28','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','29', '29','Resumo_29','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','30', '30','Resumo_30','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','31', '31','Resumo_31','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','32', '32','Resumo_32','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','33', '33','Resumo_33','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','34', '34','Resumo_34','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','35', '35','Resumo_35','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','36', '36','Resumo_36','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','37', '37','Resumo_37','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','38', '38','Resumo_38','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','39', '39','Resumo_39','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','40', '40','Resumo_40','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','41', '41','Resumo_41','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','42', '42','Resumo_42','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','43', '43','Resumo_43','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','44', '44','Resumo_44','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','45', '45','Resumo_45','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','46', '46','Resumo_46','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','47', '47','Resumo_47','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','48', '48','Resumo_48','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','49', '49','Resumo_49','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','50', '50','Resumo_50','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','51', '51','Resumo_51','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','52', '52','Resumo_52','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','53', '53','Resumo_53','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','54', '54','Resumo_54','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','55', '55','Resumo_55','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','56', '56','Resumo_56','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','57', '57','Resumo_57','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','58', '58','Resumo_58','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','59', '59','Resumo_59','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','60', '60','Resumo_60','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','61', '61','Resumo_61','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','62', '62','Resumo_62','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','63', '63','Resumo_63','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','64', '64','Resumo_64','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','65', '65','Resumo_65','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','66', '66','Resumo_66','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','67', '67','Resumo_67','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','68', '68','Resumo_68','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','69', '69','Resumo_69','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','70', '70','Resumo_70','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','71', '71','Resumo_71','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','72', '72','Resumo_72','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','73', '73','Resumo_73','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','74', '74','Resumo_74','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','75', '75','Resumo_75','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','76', '76','Resumo_76','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','77', '77','Resumo_77','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','78', '78','Resumo_78','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','79', '79','Resumo_79','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','80', '80','Resumo_80','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','81', '81','Resumo_81','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','82', '82','Resumo_82','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','83', '83','Resumo_83','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','84', '84','Resumo_84','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','85', '85','Resumo_85','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','86', '86','Resumo_86','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','87', '87','Resumo_87','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','88', '88','Resumo_88','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','89', '89','Resumo_89','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','90', '90','Resumo_90','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','91', '91','Resumo_91','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','92', '92','Resumo_92','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','93', '93','Resumo_93','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','94', '94','Resumo_94','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','95', '95','Resumo_95','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','96', '96','Resumo_96','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','97', '97','Resumo_97','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','98', '98','Resumo_98','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','99', '99','Resumo_99','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','100', '100','Resumo_100','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','101','101','Resumo default101: Primeiro report101','1630271419','1630271419');
INSERT INTO `mantis_bug_table` (`project_id`,`reporter_id`,`bug_text_id`,`summary`,`date_submitted`,`last_updated`) VALUES ('1','102','102','Resumo default102: Segundo report102','1630271419','1630271419');
#Tag
INSERT INTO `mantis_tag_table` (`user_id`, `name`, `description`) VALUES ('1', 'tag000000001', 'descrição tag 000000001');
INSERT INTO `mantis_tag_table` (`user_id`, `name`, `description`) VALUES ('2', 'tag000000002', 'descrição tag 000000002');





