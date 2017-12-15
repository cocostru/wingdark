<?php
class ControllerExtensionModuleAvail extends Controller {
	private $error = array();
	
	public function index() {					
			$this->document->addStyle('catalog/view/avail/stylesheet/availability.css');
			$this->document->addScript('catalog/view/avail/javascript/avail.js');
			
	}
	public function getConfig(){
		$json = array();
		$cinfig = $this->config->get('avail_text');
		$config_language_id = $this->config->get('config_language_id');
		$buttom_name = $cinfig[$config_language_id]['button_avail'];
		$button_avail_help = $cinfig[$config_language_id]['button_avail_help'];
		$avail_button_cart_productpage = $this->config->get('avail_button_cart_productpage');
		$avail_options_status = $this->config->get('avail_options_status');
		$avail_block_option_productpage = $this->config->get('avail_block_option_productpage');
		
		$json = Array(
			'all_button_id' => $this->config->get('avail_button_cart_other'),
			'block_product' => $this->config->get('avail_block_product'),	// блок продукта Миниатюра	
			'button' => $this->config->get('avail_status'), // включен модуль
			'avail_default' => $this->config->get('avail_default'),
			'text' => $buttom_name,
			'button_avail_help' => $button_avail_help,
			'avail_block_option_productpage' => $avail_block_option_productpage,
			'avail_button_cart_productpage' => $avail_button_cart_productpage,
			'avail_options_status' => $avail_options_status,
			'avail_button_other_productpage' => $this->config->get('avail_button_other_productpage'),
			
		);
		
		$this->response->setOutput(json_encode($json));
	}
	public function ValidOption(){
		
		    $json = array();
			$this->language->load('extension/module/avail');
			$this->load->model('catalog/product');	
			
			if (isset($_POST['option'])) {
					$option = array_filter($_POST['option']);
			} else {
					$option = array();	
			}
			// получаем информацию о опциях
			$product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);
            // если опция обязательна и не выбрана
			foreach ($product_options as $product_option) {
				if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
					$json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
				}
			}

			if (isset($this->request->post['recurring_id'])) {
				$recurring_id = $this->request->post['recurring_id'];
			} else {
				$recurring_id = 0;
			}

			$recurrings = $this->model_catalog_product->getProfiles($this->request->post['product_id']);

			if ($recurrings) {
				$recurring_ids = array();

				foreach ($recurrings as $recurring) {
					$recurring_ids[] = $recurring['recurring_id'];
				}

				if (!in_array($recurring_id, $recurring_ids)) {
					$json['error']['recurring'] = $this->language->get('error_recurring_required');
				}
			}
			
			if(!$json) { //опции нету или не обязательны
			 $json['success'] = '1'; 
				$this->response->setOutput(json_encode($json));
			} else { // опции есть и оязательны для заполненния		
	   
		    	$this->response->setOutput(json_encode($json));
			}
	}
	public function openForm() {

		$this->language->load('extension/module/avail');
		$this->load->model('extension/module/avail');			
		$this->load->model('catalog/product');		
		$this->load->model('tool/image');
		
		$data['heading_title'] = $this->language->get('heading_title');
		$data['entry_enquiry'] = $this->language->get('entry_enquiry');
		$data['entry_product'] = $this->language->get('entry_product');
		$data['entry_price'] = $this->language->get('entry_price');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_mail'] = $this->language->get('entry_mail');
		$data['entry_admin_mail'] = $this->language->get('entry_admin_mail');
		$data['entry_captcha'] = $this->language->get('entry_captcha');			
		$data['button_send'] = $this->language->get('button_send');
		
		$data['avail_config_google_captcha_status'] = $this->config->get('avail_config_google_captcha_status');
		$data['avail_config_google_captcha_public'] = $this->config->get('avail_config_google_captcha_public');
		$data['avail_config_google_captcha_secret'] = $this->config->get('avail_config_google_captcha_secret');
		
		$data['admin_email'] = $this->config->get('email');
		$data['captcha_status'] = $this->config->get('config_captcha_status');
		$data['avail_show_img'] = $this->config->get('avail_show_img');
		$data['avail_show_comment'] = $this->config->get('avail_show_comment');
		
		$data['product_id'] = $this->request->post['product_id'];
		$data['logged'] = $this->customer->isLogged();
		$data['first_name'] = $this->customer->isLogged()?$this->customer->getFirstName():'';
		$data['mail'] = $this->customer->getEmail()?$this->customer->getEmail():'';
		$data['logged_id'] = $this->customer->getId()?$this->customer->getId():'';
		$product_info = $this->model_catalog_product->getProduct($this->request->post['product_id']);
		
		$data['product_name'] = htmlspecialchars_decode($product_info['name']);	
		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$data['price'] = false;
				}
		//$data['price'] = htmlspecialchars_decode($product_info['price']);
		$data['language_id'] = $this->config->get('config_language_id');
		$data['image_src'] = $this->model_tool_image->resize($product_info['image'], 150,150);
				//получаем опции выбранные на товаре
		$product_options = isset($this->request->post['option']) ? $this->request->post['option'] : array();
		// parse_str($this->request->post['option'],$product_options);

		
		
		$data['optionsId'] = array();
		// добавляем в масив с опциями Тип рпции 
		foreach ($product_options as $product_option_id => $product_option_value_id ) {
				if(!empty($product_option_value_id)) {
					if(!is_array($product_option_value_id)) {
						array_push($data['optionsId'],$this->model_extension_module_avail->getOptionsId($product_option_id, $product_option_value_id));
					} else {
						foreach($product_option_value_id as $index => $value ) {
							array_push($data['optionsId'],$this->model_extension_module_avail->getOptionsId($product_option_id, $value));
						}
					}
				}					
		}				
					
		$data['optionsNames'] = array();
				// добавляем в масив с опциями название опции 	
		foreach($data['optionsId'] as $value) {
			array_push($data['optionsNames'], $this->model_extension_module_avail->getOptionsNames($value['option_id'], $value['option_value_id'],$value['product_option_value_id']));				
		}
					
				
		$data['captcha'] = '';
				
		
		$data = $this->load->view('extension/module/avail', $data);
		return $this->response->setOutput($data);
				
	}
	public function getoptionsquantity() {
			$this->load->model('extension/module/avail');			
			$response = array();
			$optionsInfo = array();
				foreach ($this->request->post['option'] as $product_option_id => $product_option_value_id ) {
					if(!empty($product_option_value_id)) {
						if(!is_array($product_option_value_id)) {
						
						
							array_push($optionsInfo,$this->model_extension_module_avail->getOptionsId($product_option_id, $product_option_value_id));
						} else {
							foreach($product_option_value_id as $index => $value ) {
								array_push($optionsInfo,$this->model_extension_module_avail->getOptionsId($product_option_id, $value));
							}
						}
					}					
				}
				
			foreach($optionsInfo as $info) {				
				if (isset($info['quantity']) && $info['quantity'] <= 0 ) {					
					$response = false;
					break;				
				} else {
					$response = true;
				}
			}
			$this->response->setOutput(json_encode($response));
		}
	public function save() {
			$this->load->model('catalog/product');
			$this->load->model('extension/module/avail');
			$this->language->load('extension/module/avail');
			
			$json = array();		
			$message = '';
			
			$option_val = array();
			if(!empty($this->request->post['option_type']) && !empty($this->request->post['option_name'])) {
			$option_val = array_combine($this->request->post['option_type'],$this->request->post['option_name']);
			
			$option_val = http_build_query($option_val,'',', ');
			$option_val = urldecode($option_val);
			
			}			
			if ( ($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate() ) {
				$link = $this->url->link('product/product', '&product_id=' . $this->request->post['product_id']);
				$info = array(
                    'product' => $this->request->post['product'],
					'product_id' => $this->request->post['product_id'],
					'admin_email' => $this->config->get('avail_email'),
                    'href' => $link,
                    'price' => $this->request->post['price'],
                    'name' => $this->request->post['name'],
                    'email' => $this->request->post['email'],
					'logged_id' => $this->request->post['logged_id']?$this->request->post['logged_id']:'',
                    'comment' => $this->request->post['enquiry'],
					'language_id' => $this->request->post['language_id'],
					'option_name' => $option_val ? $option_val : '',
                    'status' => 0
                 );			 
				
				$search_data = array('%name%', '%product_name%', '%price%', '%link%', '%option_type%', '%option_name%');
				$replace_data = array($info['name'], $info['product'], $info['price'], "<a href=" . $link . ">" . $info['product'] . "</a>",'',$info['option_name']);
				
				$messages = $this->config->get('avail');
				$message = strip_tags(html_entity_decode($messages[$this->request->post['language_id']]['client_message']));

				if(strlen($message) > 1) {
				
						$message = htmlspecialchars_decode($messages[$this->request->post['language_id']]['client_message']);
						$message = str_replace($search_data, $replace_data, $message);
				} else {
				
					$message = "
						<!DOCTYPE html>
						<html> 
							<head> 
								<title>" . $this->language->get('heading_title') . "</title> 
							</head> 
							<body>
								<p>" . $this->language->get('mail_notify') . "</p>
								<p>" . html_entity_decode($info['name'] .", " . $this->language->get('text_mail_send')) . "</p>
								<p>" . $this->language->get('text_product') . " " . $info['product'] . "</p>
								<p>" .$this->language->get('info_product') . " " . " <a href=" . $info['href'] . ">" . $info['product'] . "</a></p>
								<p>" . $this->language->get('text_price') . " " . $info['price'] . "</p>";	
				}
				$mail = new Mail();				
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
				
				 $mail->setTo($info['email']);				 
				 $mail->setFrom($this->config->get('config_email'));
				 $mail->setSender($messages[$info['language_id']]['sender']);
				 $mail->setSubject(html_entity_decode($messages[$info['language_id']]['client_title']));		
				
				$this->model_extension_module_avail->addMail($info);				
				$lastId = $this->model_extension_module_avail->getLastId();
				if(isset($this->request->post['option_id'])) {
				
					$option_id = $this->request->post['option_id'];
					$option_quantity = $this->request->post['option_quantity'];
					$option_name = $this->request->post['option_name'];
					$option_type = $this->request->post['option_type'];
					
					$product_option_value_id = $this->request->post['product_option_value_id'];
					
							for ( $i = 0; $i < count($option_id); $i++ ) {						
							$option_info = array(
								'main_id' => $lastId,
								'product_id' => $this->request->post['product_id'],
								'option_value_id' => $option_id[$i],
								'option_quantity' => $option_quantity[$i],
								'option_name' => $option_name[$i],
								'option_type' => $option_type[$i],
								'product_option_value_id' => $product_option_value_id[$i]
							);
							$this->model_extension_module_avail->addOption($option_info);
							
							$messagesopt = $this->config->get('avail');
							$messageopt = strip_tags(html_entity_decode($messagesopt[$this->request->post['language_id']]['client_message']));
			
								if(strlen($messageopt) > 1) {								
									$messageopt = htmlspecialchars_decode($messagesopt[$info['language_id']]['client_message']);
									$messageopt = str_replace($search_data, $replace_data, $messageopt);
								} else {
									$message .= "<p>" . $option_type[$i] . " - " . $option_name[$i] . "</p>";
								}
							}
					
									
				}
				
				$message .= "</body></html>";
				
				$mail->setHtml($message);
				$mail->send();
				
			/*	$admin_email = new Mail();
				$admin_email->protocol = $this->config->get('config_mail_protocol');
				$admin_email->parameter = $this->config->get('config_mail_parameter');
				$admin_email->hostname = $this->config->get('config_smtp_host');
				$admin_email->username = $this->config->get('config_smtp_username');
				$admin_email->password = html_entity_decode($this->config->get('config_smtp_password'), ENT_QUOTES, 'UTF-8');
				$admin_email->port = $this->config->get('config_smtp_port');
				$admin_email->timeout = $this->config->get('config_smtp_timeout');			
				
				$admin_email->setTo($info['admin_email']);				
				$admin_email->setFrom($info['email']);				
				$admin_email->setSender($this->language->get('admin_mail_title'));
				$admin_email->setSubject(html_entity_decode(sprintf('From: ', $this->request->post['name'], ENT_QUOTES,'UTF-8')));
				*/
				
				$admin_email = new Mail();				
				$admin_email->protocol = $this->config->get('config_mail_protocol');
				$admin_email->parameter = $this->config->get('config_mail_parameter');
				$admin_email->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$admin_email->smtp_username = $this->config->get('config_mail_smtp_username');
				$admin_email->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$admin_email->smtp_port = $this->config->get('config_mail_smtp_port');
				$admin_email->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
				
				 $admin_email->setTo($info['admin_email']);				 
				 $admin_email->setFrom($this->config->get('config_email'));
				 $admin_email->setSender($messages[$info['language_id']]['sender']);
				 $admin_email->setSubject(html_entity_decode($messages[$info['language_id']]['admin_title']));
				
				$messages = $this->config->get('avail');
				$message = strip_tags(html_entity_decode($messages[$this->request->post['language_id']]['admin_message']));
				
				if(strlen($message) > 1) {					
						$admin_message = htmlspecialchars_decode($messages[$this->request->post['language_id']]['admin_message']);
						$admin_message = str_replace($search_data, $replace_data, $admin_message);	
				} else {
					$admin_message = "
						<!DOCTYPE html>
							<html>
								<body>
									<p>" . $this->config->get('config_owner') . ", " . $this->language->get('admin_mail_notify') .  "</p>
								</body>
							</html>
						";
				}
				
				$admin_email->setHtml($admin_message);
				$admin_email->send();			
				
				$json['success'] = $this->language->get('success');
				$this->response->setOutput(json_encode($json));
			}
			if (isset($this->error['name'])) {
					$json['error_name'] = $this->error['name'];
				} else {
					$json['error_name'] = '';
				}
				 if (isset($this->error['email'])) {
					 $json['error_email'] = $this->error['email'];
				 } else {
					 $json['error_email'] = '';
				 }
				if (isset($this->error['price'])) {
					$json['error_price'] = $this->error['price'];
				} else {
					$json['error_price'] = '';
				}
				if (isset($this->error['product'])) {
					$json['error_product'] = $this->error['product'];
				} else {
					$json['error_product'] = '';
				}
				if (isset($this->error['captcha'])) {
					$json['error_captcha'] = $this->error['captcha'];
				} else {
					$json['error_captcha'] = '';
				}
			$this->response->setOutput(json_encode($json));
		}
		public function validate() {
			 $this->language->load('extension/module/avail');
    
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
				$this->error['name'] = $this->language->get('error_name');
			}
			 if (!preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
			 $this->error['email'] = $this->language->get('error_email');
			 }
			 if ((utf8_strlen($this->request->post['product']) < 2)) {
                 $this->error['product'] = $this->language->get('error_product');
             }
			 if ((utf8_strlen($this->request->post['price']) < 2) || (utf8_strlen($this->request->post['price']) > 32)) {
                 $this->error['price'] = $this->language->get('error_price');
             }
			 if (isset($this->request->post['captcha_status']) && $this->request->post['captcha_status'] == '1') {
				$recaptcha = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret=' . urlencode($this->request->post['avail_config_google_captcha_secret']) . '&response=' . $this->request->post['g-recaptcha-response'] . '&remoteip=' . $this->request->server['REMOTE_ADDR']);

				$recaptcha = json_decode($recaptcha, true);
				if (!$recaptcha['success']) {
					$this->error['captcha'] = $this->language->get('error_captcha');
				}
			 }
			 
			if (!$this->error) {
				return true;
			} else {
				return false;
			}
		}
		
		public function getProductById() {
			$this->load->model('extension/module/avail');	
			$json = array();
			$json = $this->model_extension_module_avail->getProductId($this->request->post['product_id']);
					
			if ($json) {
				$this->response->setOutput(json_encode($json));
			} else {
				return false;
			}
		
		}		
}
?>