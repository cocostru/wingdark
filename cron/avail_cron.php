<?php
if (is_file('../admin/config.php')) {
	require_once('../admin/config.php');		
}

// Startup
require_once(DIR_SYSTEM . 'startup.php');
//require_once(DIR_SYSTEM . 'library/avail.php'); // +

// Registry
$registry = new Registry();

// Config
$config = new Config();
$registry->set('config', $config);



// Database
$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
$registry->set('db', $db);
//Currency
$cur = new Currency($registry);
//$registry->set('currency', $currency); // +
// Settings
$query = $db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '0'");

foreach ($query->rows as $setting) {
	if (!$setting['serialized']) {
		$config->set($setting['key'], $setting['value']);
	} else {
		$config->set($setting['key'], $setting['value']);
	}
}

// Loader
$loader = new Loader($registry);
$registry->set('load', $loader);

// Front Controller
//$controller = new Front($registry);

// Url
$url = new Url(HTTP_SERVER, $config->get('config_secure') ? HTTPS_SERVER : HTTP_SERVER);
$registry->set('url', $url);
		
// SEO URL's
if (!$seo_type = $config->get('config_seo_url_type')) {
	$seo_type = 'seo_url';
}
$controller->addPreAction(new Action('common/' . $seo_type));

// Language
$languages = array();

$query = $db->query("SELECT * FROM `" . DB_PREFIX . "language`");

foreach ($query->rows as $result) {
	$languages[$result['code']] = $result;
}

$config->set('config_language_id', $languages[$config->get('config_admin_language')]['language_id']);

// Language
$language = new Language($languages[$config->get('config_admin_language')]['directory']);
$language->load($languages[$config->get('config_admin_language')]['directory']);
$registry->set('language', $language);

//echo 'rrr = ' . $currency->format(123);
//availability
		function changeMailStatus($db, $id, $status) {
			if ($db->query("UPDATE " . DB_PREFIX . "avail SET status = '" . (int) $status . "' WHERE id = '" . (int) $id . "'")) {
				return true;            
			} else {
				return false;
			}
		}
	
		function optionbuyproduct($db, $product_id, $notify_id = "") {
                 
				 $sql3 = "SELECT pov.quantity as option_quantity, ao.option_type, ao.option_name  
					 FROM " . DB_PREFIX . "avail_options ao, " . DB_PREFIX . "product_option_value pov ";				
				 $sql3 .= "WHERE ao.product_id = " . $product_id . "
					 AND ao.product_option_value_id = pov.product_option_value_id
					 AND pov.product_id = " .$product_id . "";
				 if(!empty($notify_id)) {
				 $sql3 .= " AND ao.main_id = " . $notify_id . "";
				 }	
         $query1 = $db->query($sql3);
		
         return $query1->rows;
		 }
	
		
		$notify = $db->query("select * from " . DB_PREFIX . "product p, " . DB_PREFIX. "avail a where p.quantity > 0 AND p.product_id = a.product_id AND a.status = 0");
	
		$notify = $notify->rows;
		$lang = $loader->language('extension/module/avail');
		$mod = $loader->model('extension/module/avail');
		$messages = json_decode($config->get('avail'));
		$messages =  get_object_vars($messages);
		
		$sql1 = "select distinct(a.id), a.name, a.language_id, a.product, p.quantity, a.price, a.product_id, 
				a.email
					from " . DB_PREFIX . "product p, " . DB_PREFIX . "avail a		
					where a.id not in (SELECT  distinct(main_id) FROM " . DB_PREFIX . "avail_options ao)
					AND p.quantity > 0 
					AND p.product_id = a.product_id AND a.status = 0 group by a.id";
					
		        $query1 = $db->query($sql1);

       $result = $query1->rows;
		
		$sql = "SELECT DISTINCT (
						a.id
						), a.product, a.language_id, a.name, a.email, p.quantity, a.price,a.product_id 
						FROM " . DB_PREFIX . "product p, " . DB_PREFIX . "avail a, " . DB_PREFIX . "avail_options ao
						WHERE a.id = ao.main_id
						AND p.product_id = a.product_id AND a.status = 0";

        $query = $db->query($sql);
		
        $result_options =  $query->rows;
		
				
					
					
		if(!empty($result)){			
				foreach ($result as $info ) {
					
					
					$messages = get_object_vars($messages[$info['language_id']]);
					
					
					$link = HTTP_CATALOG . 'index.php?route=product/product&product_id='. $info['product_id'];
					$message = strip_tags(html_entity_decode($messages['notification_message']));
					
					$search_data = array('%name%', '%product_name%', '%price%', '%link%','%option_type%','%option_name%');
					$replace_data = array($info['name'], $info['product'], $info['price'], "<a href=" . $link . ">" . $info['product'] . "</a>",'','');
					
					if (strlen($message) > 1) {		
			
						if(!empty($messages['notification_message']))
						$mail_text = htmlspecialchars_decode($messages['notification_message']);
					
						$mail_text = str_replace($search_data, $replace_data, $mail_text);
					
					} else {
						$mail_text = "<!DOCTYPE html><html><head><meta charset=\"UTF-8\"><title>Document</title></head><body>";
						$mail_text .= "<p>" . html_entity_decode($info['name'].', '.$lang['text_mail_send']. "</p>");
						$mail_text .= "<p>" . $lang['text_product'] .': ' . $info['product'] . "</p>";
						$mail_text .= "<p>" . $lang['text_link_page'] . ": " . " <a href=" . $link . ">" . $info['product'] . "</a></p>";
						$mail_text .= "<p>" . $lang['text_price'] . ': ' . $info['price'] . "</p></body></html>";
					}					
					
					$mail = new Mail();
					$mail->protocol = $config->get('config_mail_protocol');
					$mail->parameter = $config->get('config_mail_parameter');
					$mail->hostname = $config->get('config_smtp_host');
					$mail->username = $config->get('config_smtp_username');
					$mail->password = html_entity_decode($config->get('config_smtp_password'), ENT_QUOTES, 'UTF-8');
					$mail->port = $config->get('config_smtp_port');
					$mail->timeout = $config->get('config_smtp_timeout');
					
					$mail->setTo($info['email']);
					$mail->setFrom($config->get('config_email'));
					$mail->setSender($messages['sender']);
					$mail->setSubject(html_entity_decode($messages['notification_title']));						

					$mail->setHtml($mail_text);
					$mail->send();
					changeMailStatus($db,$info['id'],1);
				}				
				
			}
					
			if (!empty($result_options)){
				
				
				
							
			    foreach ($result_options as $info ) {	
				$option_types = '';
				$option_names = '';	

				
			
					$flag = 0;	
					$link = HTTP_CATALOG . 'index.php?route=product/product&product_id='. $info['product_id'];
			        /*масив данными по товаре и его опциях по заявке*/
					
					
					$options_notify = optionbuyproduct($db, $info['product_id'], $info['id']);
					
					$info['options'] = array();
					array_push($info['options'], $options_notify);
					
				
					
				   if ($config->get('avail_options_status') == 1){
						foreach ($info['options'] as $index => $arr ) {				
							foreach($arr as $option) {
								if($option['option_quantity'] <= 0) {
									$flag = 1;									
								}						
							}						
						}
					} else { 
						if ($info['quantity'] <= 0){
							$flag = 1;
					    }
					
					}
						
					if($flag == 0) {						
						foreach($info['options'] as $index => $arr ) {
							$i =0; 
							if($i == 0){ $mark = " ";}else{ $mark = " , ";}
							foreach($arr as $option) {
								//$option_types .= "<p>" . $option['option_type'] . "</p>";
								$option_names .=  $mark . "" . $option['option_type'] . " - ". $option['option_name'] ;
							$i++;}
						}
					
					
					$search_data = array('%name%', '%product_name%', '%price%', '%link%','%option_type%','%option_name%');
					$replace_data = array($info['name'], $info['product'], $info['price'], "<a href=" . $link . ">" . $info['product'] . "</a>", '' , $option_names);
					
					$messages_text = get_object_vars($messages[$info['language_id']]);
					//echo '-------'.$messages['notification_message'].'---------';
					$message = strip_tags(html_entity_decode($messages_text['notification_message']));	
					
						if (strlen($message) > 1) {
						//echo strlen($message);		
							if(!empty($messages_text['notification_message'])) {
								$mail_text_new = htmlspecialchars_decode($messages_text['notification_message']);
								$mail_text = str_replace($search_data, $replace_data, $mail_text_new);	
									
							}							
						} else {
							$mail_text = "<!DOCTYPE html><html><head><meta charset=\"UTF-8\"><title>Document</title></head><body>";
							$mail_text .="<p>" . html_entity_decode($info['name'].', '.$lang['text_mail_send']. "</p>");
							$mail_text .= "<p>" . $lang['text_product'] .': ' . $info['product'] . "</p>";
							$mail_text .= "<p>" . $lang['text_link_page'] . ": " . " <a href=" . $link . ">" . $info['product'] . "</a></p>";
							$mail_text .= "<p>" . $lang['text_price'] . ': ' . $info['price'] . "</p>";
							foreach($info['options'] as $index => $arr ) {
								foreach($arr as $option) {
									$mail_text .= "<p>" . $option['option_type'] . ' - ' . $option['option_name'] . "</p>";
								}								
							}	
							$mail_text .= "</body></html>";
							
						}
							$mail = new Mail();
							$mail->protocol = $config->get('config_mail_protocol');
							$mail->parameter = $config->get('config_mail_parameter');
							$mail->hostname = $config->get('config_smtp_host');
							$mail->username = $config->get('config_smtp_username');
							$mail->password = html_entity_decode($config->get('config_smtp_password'), ENT_QUOTES, 'UTF-8');
							$mail->port = $config->get('config_smtp_port');
							$mail->timeout = $config->get('config_smtp_timeout');
										
							$mail->setTo($info['email']);
							$mail->setFrom($config->get('config_email'));
							$mail->setSender($messages_text['sender']);
							$mail->setSubject(html_entity_decode($messages_text['notification_title']));				
							
							$mail->setHtml($mail_text);
								
							$mail->send();
							changeMailStatus($db,$info['id'],1);
						
						echo 'ok';
					}
									
				}			
				
			} 
 ?>