<?php
class ModelModuleNewsletters extends Model {
	public function installModule()
	{
		$sql = " SHOW TABLES LIKE '".DB_PREFIX."newsletters'";
		$query = $this->db->query( $sql );

		$sql = "
				CREATE TABLE IF NOT EXISTS `".DB_PREFIX."newsletters` (
				  `newsletter_id` int(11) NOT NULL AUTO_INCREMENT,
				  `nome` varchar(64) DEFAULT NULL,
				  `email` varchar(64) DEFAULT NULL,
				  PRIMARY KEY (`newsletter_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
		";
		
		return true;
		
	}

	public function insert( $nome, $email )
	{
		$res = $this->db->query("select * from ". DB_PREFIX ."newsletters where email='".$email."'");
		if($res->num_rows >= 1)
		{
			return false;
		}
		else
		{
		
			if($this->db->query("INSERT INTO " . DB_PREFIX . "newsletters(nome,email) values ('".$nome."','".$email."')"))
			{
				$json = 'success';
				return true;
			}
			else
			{
				$json = 'fail';
				return false;
			}
		}
	}
		
}