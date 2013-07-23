
-- 
-- 表的结构 `server`
-- 

DROP TABLE IF EXISTS `server`;
CREATE TABLE `server` (
  `id` int(11) unsigned NOT NULL default '0' COMMENT 'id',
  `ip` varchar(50) NOT NULL default '' COMMENT 'ip地址',
  `port` int(11) unsigned NOT NULL default '0' COMMENT '端口号',
  `node` varchar(50) NOT NULL default '' COMMENT '节点',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务器列表\0\0\0\0\0';

-- --------------------------------------------------------

-- 
-- 表的结构 `standard_position_template`,用于存放球员位置标准模板
-- 

DROP TABLE IF EXISTS `standard_position_template`;
CREATE TABLE `standard_position_template` (
  `id` int(16) unsigned NOT NULL auto_increment COMMENT 'id',
  `template_id` int(16) unsigned NOT NULL default '0' COMMENT '战术模板id',
  `in_defense` int(16) unsigned NOT NULL default '0' COMMENT '内防',
  `out_defense` int(16) unsigned NOT NULL default '0' COMMENT '外防',
  `fast_break` int(16) unsigned NOT NULL default '0' COMMENT '快攻',
  `outlet_pass` int(16) unsigned NOT NULL default '0' COMMENT '快传',
  `off_reb` int(16) unsigned NOT NULL default '0' COMMENT '攻击权重',
  `def_reb` int(16) unsigned NOT NULL default '0' COMMENT '防守权重',
  `steal` int(16) unsigned NOT NULL default '0' COMMENT '盖帽',
  `rej` int(16) unsigned NOT NULL default '0' COMMENT '抢断',
  `inside_attack` int(16) unsigned NOT NULL default '0' COMMENT '内线进攻',
  `break_attack` int(16) unsigned NOT NULL default '0' COMMENT '突破进攻',
  `middle_shot` int(16) unsigned NOT NULL default '0' COMMENT '中投',
  `three_point` int(16) unsigned NOT NULL default '0' COMMENT '三分',
  `inside_attack_hit` int(16) unsigned NOT NULL default '0' COMMENT '内线进攻命中率',
  `break_attack_hit` int(16) unsigned NOT NULL default '0' COMMENT '突破进攻命中率',
  `middle_shot_hit` int(16) unsigned NOT NULL default '0' COMMENT '中投命中率',
  `three_point_hit` int(16) unsigned NOT NULL default '0' COMMENT '三分命中率',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='球员位置标准模板\0\0\0\0\0';

-- --------------------------------------------------------

-- 
-- 表的结构 `standard_attr`,球员通用属性模板
-- 

DROP TABLE IF EXISTS `standard_attr`;
CREATE TABLE `standard_attr` (
  `id` int(16) unsigned NOT NULL auto_increment COMMENT 'id',
  `attack_max` int(16) unsigned NOT NULL default '0' COMMENT '攻上限',
  `defense_max` int(16) unsigned NOT NULL default '0' COMMENT '防上限',
  `assist_max` int(16) unsigned NOT NULL default '0' COMMENT '助上限',
  `skill_num` int(16) unsigned NOT NULL default '0' COMMENT '技能数',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='球员标准属性模板\0\0\0\0\0';

-- --------------------------------------------------------

-- 
-- 表的结构 `standard_player`,球员标准属性模板
-- 

DROP TABLE IF EXISTS `standard_player`;
CREATE TABLE `standard_player` (
  `id` int(16) unsigned NOT NULL auto_increment COMMENT 'id',
  `name` varchar(80) NOT NULL default '' COMMENT '球员名字',
  `primary_pos` int(16) unsigned NOT NULL default '0' COMMENT '主位置',
  `secondary_pos` int(16) unsigned NOT NULL default '0' COMMENT '副位置',
  `attack_r` int(16) unsigned NOT NULL default '0' COMMENT '进攻比重',
  `defense_r` int(16) unsigned NOT NULL default '0' COMMENT '防守比重',
  `assist_r` int(16) unsigned NOT NULL default '0' COMMENT '助攻比重',
  `stamina` int(16) unsigned NOT NULL default '0' COMMENT '体能',
  `penalty_shot` int(16) unsigned NOT NULL default '0' COMMENT '罚球命中率',
  `skill1` int(16) unsigned NOT NULL default '0' COMMENT '助攻比重',
  `skill2` int(16) unsigned NOT NULL default '0' COMMENT '助攻比重',
  `skill3` int(16) unsigned NOT NULL default '0' COMMENT '助攻比重',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='球员标准属性模板\0\0\0\0\0';

-- --------------------------------------------------------

-- 
-- 表的结构 `skill`,技能表
-- 

DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill` (
  `id` int(16) unsigned NOT NULL auto_increment COMMENT 'id',
  `name` varchar(80) NOT NULL default '' COMMENT '技能名',
  `quality` int(16)  NOT NULL default '0' COMMENT '品质',
  `substitute` int(16)  NOT NULL default '0' COMMENT '替补上场时间',
  `make_foul` int(16)  NOT NULL default '0' COMMENT '制造犯规概率',
  `attack` int(16)  NOT NULL default '0' COMMENT '进攻概率',
  `assist` int(16)  NOT NULL default '0' COMMENT '助攻概率',
  `in_defense` int(16)  NOT NULL default '0' COMMENT '内线协防权重',
  `out_defense` int(16)  NOT NULL default '0' COMMENT '外线协防权重',
  `fast_break` int(16)  NOT NULL default '0' COMMENT '快攻概率',
  `outlet_pass` int(16)  NOT NULL default '0' COMMENT '发动快攻概率',
  `off_reb` int(16)  NOT NULL default '0' COMMENT '攻击权重',
  `def_reb` int(16)  NOT NULL default '0' COMMENT '防守权重',
  `steal` int(16)  NOT NULL default '0' COMMENT '盖帽',
  `rej` int(16)  NOT NULL default '0' COMMENT '抢断',
  `inside_attack` int(16)  NOT NULL default '0' COMMENT '内线进攻',
  `break_attack` int(16)  NOT NULL default '0' COMMENT '突破进攻',
  `middle_shot` int(16)  NOT NULL default '0' COMMENT '中投',
  `three_point` int(16)  NOT NULL default '0' COMMENT '三分',
  `inside_attack_hit` int(16)  NOT NULL default '0' COMMENT '内线进攻命中率',
  `break_attack_hit` int(16)  NOT NULL default '0' COMMENT '突破进攻命中率',
  `middle_shot_hit` int(16)  NOT NULL default '0' COMMENT '中投命中率',
  `three_point_hit` int(16)  NOT NULL default '0' COMMENT '三分命中率',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='球员标准属性模板\0\0\0\0\0';

-- --------------------------------------------------------

