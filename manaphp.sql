# \ManaPHP\Task\Metadata\Adapter\Db\Model
CREATE TABLE `manaphp_task_metadata` (
  `id` char(32) NOT NULL,
  `key` char(128) NOT NULL,
  `value` varchar(4000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#\ManaPHP\Counter\Adapter\Db\Model
CREATE TABLE `manaphp_counter` (
  `hash` char(32) CHARACTER SET ascii NOT NULL,
  `type` varchar(255) NOT NULL,
  `id` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#ManaPHP\Cache\Adapter\Db\Model
CREATE TABLE `manaphp_cache` (
  `hash` char(32) CHARACTER SET ascii NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `expired_time` int(11) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#ManaPHP\Store\Adapter\Db\Model
CREATE TABLE `manaphp_store` (
  `hash` CHAR(32) CHARACTER SET ASCII NOT NULL,
  `key` VARCHAR(255) NOT NULL,
  `value` TEXT NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

#ManaPHP\Http\Session\Adapter\Db\Model
CREATE TABLE `manaphp_session` (
  `session_id` char(32) CHARACTER SET ascii NOT NULL,
  `data` text NOT NULL,
  `expired_time` int(11) NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#ManaPHP\Authorization\Rbac\Models\Role
CREATE TABLE `rbac_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` char(64) NOT NULL,
  `description` char(128) NOT NULL,
  `created_time` int(11) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#ManaPHP\Authorization\Rbac\Models\Permission
CREATE TABLE `rbac_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_type` tinyint(4) NOT NULL,
  `module` char(32) CHARACTER SET ascii NOT NULL,
  `controller` char(32) CHARACTER SET ascii NOT NULL,
  `action` char(32) CHARACTER SET ascii NOT NULL,
  `description` char(128) NOT NULL,
  `created_time` int(11) NOT NULL,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `module_controller_action` (`module`,`controller`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#ManaPHP\Authorization\Rbac\Models\RolePermission
CREATE TABLE `rbac_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_id_role_id` (`permission_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
 
#ManaPHP\Authorization\Rbac\Models\UserRole
CREATE TABLE `rbac_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_role_id` (`user_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#ManaPHP\Security\RateLimiter\Adapter\Db\Model
CREATE TABLE `manaphp_rate_limiter` (
  `hash` char(32) CHARACTER SET ascii NOT NULL,
  `id` char(32) NOT NULL,
  `resource` char(128) NOT NULL,
  `times` int(11) NOT NULL,
  `expired_time` int(11) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;