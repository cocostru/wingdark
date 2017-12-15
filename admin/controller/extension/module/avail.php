<?php
    class ControllerExtensionModuleAvail extends Controller {
        private $error = array();
		
		public function install() {
			$this->load->model('extension/module/avail');
			$this->model_extension_module_avail->install();
		}

        public function index() {
            $this->load->language('extension/module/avail');
			$this->load->model('extension/module/avail');
			$this->load->model('localisation/language');
            $this->document->setTitle($this->language->get('heading_title1'));			

            $this->load->model('setting/setting');           

			if(isset($this->request->post['license'])) {			
				$this->model_extension_module_avail->addLicense($this->request->post['license']);
			}
			
			
			$result = $this->model_extension_module_avail->getAvailabilities();
	
			
			$data['action'] = $this->url->link('extension/module/avail', '&token=' . $this->session->data['token'], 'SSL');
		
			if (!is_array($result)){
		         		 
					$data['entry_license'] = $this->language->get('entry_license');
					$data['text_license'] = $this->language->get('text_license');
					$data['text_edit'] = $this->language->get('text_edit');
					$data['button_submit'] = $this->language->get('button_submit');
					$data['token'] = $this->session->data['token'];
					$data['heading_title'] = $this->language->get('heading_title');    
					$data['text_varsion'] = $this->language->get('text_varsion'); 
					$data['button_send'] = $this->language->get('button_send');
					$data['button_save'] = $this->language->get('button_save');
					$data['button_cancel'] = $this->language->get('button_cancel');	
					$data['entry_status'] = $this->language->get('entry_status');		
					
					$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');					
					$data['breadcrumbs'] = array();

					$data['breadcrumbs'][] = array(
						'text'      => $this->language->get('text_home'),
						'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
						'separator' => false
					);

					$data['breadcrumbs'][] = array(
						'text'      => $this->language->get('text_module'),
						'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
						'separator' => ' :: '
					);

					$data['breadcrumbs'][] = array(
						'text'      => $this->language->get('heading_title'),
						'href'      => $this->url->link('extension/module/avail', 'token=' . $this->session->data['token'], 'SSL'),
						'separator' => ' :: '
					);
					
					
					$data['header'] = $this->load->controller('common/header');
					$data['column_left'] = $this->load->controller('common/column_left');
					$data['footer'] = $this->load->controller('common/footer');

					$this->response->setOutput($this->load->view('extension/module/availabilitylicense', $data));			
				
			} else {
			if (!empty($this->request->post['avail_email'])){
				if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
					$this->model_setting_setting->editSetting('avail', $this->request->post);

					$this->session->data['success'] = $this->language->get('text_success_avail');

					$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'));
				}
			}
			
            $data['heading_title'] = $this->language->get('heading_title');            
            $data['text_varsion'] = $this->language->get('text_varsion');            
			$data['button_copy'] = $this->language->get('button_copy');
            $data['button_insert'] = $this->language->get('button_insert');
            $data['button_delete'] = $this->language->get('button_delete');
            $data['button_filter'] = $this->language->get('button_filter');
            $data['text_get_availabilitylist'] = $this->language->get('text_get_availabilitylist');
            $data['text_prefix'] = $this->language->get('text_prefix');
            $data['text_mail_on'] = $this->language->get('text_mail_on');			
			$data['text_mail'] = $this->language->get('text_mail');
            $data['text_view_notices'] = $this->language->get('text_view_notices');
            $data['entry_name'] = $this->language->get('entry_name');
            $data['text_enabled'] = $this->language->get('text_enabled');
            $data['text_disabled'] = $this->language->get('text_disabled');
            $data['entry_status'] = $this->language->get('entry_status');
			$data['text_capcha'] = $this->language->get('text_capcha');
			$data['text_general'] = $this->language->get('text_general');
			$data['text_settings_mail'] = $this->language->get('text_settings_mail');
			$data['text_settings_appearance'] = $this->language->get('text_settings_appearance');
			$data['text_show_img'] = $this->language->get('text_show_img');
			$data['text_settings_appearance'] = $this->language->get('text_settings_appearance');
			$data['text_product_page'] = $this->language->get('text_product_page');
			$data['text_ather_page'] = $this->language->get('text_ather_page');
			$data['text_google_captcha'] = $this->language->get('text_google_captcha');
			$data['text_global_settings'] = $this->language->get('text_global_settings');
			$data['text_mail_defoult'] = $this->config->get('config_email');
			$data['text_config_booton'] = $this->language->get('text_config_booton');
			$data['text_config_mail'] = $this->language->get('text_config_mail');
			
			
			
			$data['entry_google_captcha_public'] = $this->language->get('entry_google_captcha_public');
			$data['config_google_captcha_public'] = $this->language->get('config_google_captcha_public');
			$data['entry_google_captcha_secret'] = $this->language->get('entry_google_captcha_secret');
			$data['config_google_captcha_secret'] = $this->language->get('config_google_captcha_secret');
			$data['entry_capcha_status'] = $this->language->get('entry_capcha_status');			
			$data['entry_capcha_status'] = $this->language->get('entry_capcha_status');
			$data['entry_config_product_edit'] = $this->language->get('entry_config_product_edit');
			$data['entry_avail_text_button_avail'] = $this->language->get('entry_avail_text_button_avail');
			$data['entry_avail_sender'] = $this->language->get('entry_avail_sender');
			$data['entry_notification_sender'] = $this->language->get('entry_notification_sender');
			$data['mail_notification_sender'] = $this->config->get('config_name');
			
			
					
			$data['text_cron'] = $this->language->get('text_cron');
            $data['text_shortcode_option_type'] = $this->language->get('text_shortcode_option_type');
			$data['text_shortcode_option_name'] = $this->language->get('text_shortcode_option_name');
			$data['hint'] = $this->language->get('hint');
			$data['text_options_status'] = $this->language->get('text_options_status');
			$data['text_button_cart_productpage'] = $this->language->get('text_button_cart_productpage');
			$data['text_button_other_productpage'] = $this->language->get('text_button_other_productpage');
			$data['text_block_option_productpage'] = $this->language->get('text_block_option_productpage');
			$data['text_shortcode_option_name'] = $this->language->get('text_shortcode_option_name');
			
			$data['shortcodes'] = $this->language->get('shortcodes');
			$data['text_shortcode_name'] = $this->language->get('text_shortcode_name');
			$data['text_shortcode_product_name'] = $this->language->get('text_shortcode_product_name');
			$data['text_shortcode_price'] = $this->language->get('text_shortcode_price');
			$data['text_shortcode_link'] = $this->language->get('text_shortcode_link');
			$data['text_shortcode_option_type'] = $this->language->get('text_shortcode_option_type');
			$data['text_button_cart_other'] = $this->language->get('text_button_cart_other');
			$data['text_button_them'] = $this->language->get('text_button_them');
			$data['text_yes'] = $this->language->get('text_yes');
			$data['text_no'] = $this->language->get('text_no');
			$data['text_block_product'] = $this->language->get('text_block_product');
			$data['text_show_comment'] = $this->language->get('text_show_comment');
			
			$data['mail_notification_title'] = $this->language->get('mail_notification_title');
			$data['mail_client_title'] = $this->language->get('mail_client_title');
			$data['mail_admin_title'] = $this->language->get('mail_admin_title');
			
			
			$data['entry_notification_message'] = $this->language->get('entry_notification_message');
			$data['entry_client_message'] = $this->language->get('entry_client_message');
			$data['entry_admin_message'] = $this->language->get('entry_admin_message');
			$data['entry_notification_title'] = $this->language->get('entry_notification_title');
			$data['entry_client_title'] = $this->language->get('entry_client_title');
			$data['entry_admin_title'] = $this->language->get('entry_admin_title');
			
            $data['button_save'] = $this->language->get('button_save');
            $data['button_cancel'] = $this->language->get('button_cancel');			
			$data['cron_link'] = 'wget -q -O - ' . HTTP_CATALOG . 'cron/avail_cron.php';
			$data['languages'] = $this->model_localisation_language->getLanguages();			

			//help
		
			$data['help_google_captcha'] = $this->language->get('help_google_captcha');
			$data['text_button_other_help'] = $this->language->get('text_button_other_help');
			$data['text_block_option_productpage_help'] = $this->language->get('text_block_option_productpage_help');
			$data['text_button_product_help'] = $this->language->get('text_button_product_help');
			$data['text_button_other_product_help'] = $this->language->get('text_button_other_product_help');
			$data['text_mail_help'] = $this->language->get('text_mail_help');
			$data['entry_avail_text_button_avail_help'] = $this->language->get('entry_avail_text_button_avail_help');
			$data['entry_capcha_status_help'] = $this->language->get('entry_capcha_status_help');
			$data['entry_config_product_edit_help'] = $this->language->get('entry_config_product_edit_help');
			$data['text_block_product_help'] = $this->language->get('text_block_product_help');
			
			
			
            if (isset($this->error['warning'])) {
                $data['error_warning'] = $this->error['warning'];
            } else {
                $data['error_warning'] = '';
            }
           
			if (isset($this->error['email'])) {
                $data['error_email'] = $this->error['email'];
            } else {
                $data['error_email'] = '';
            }
			if (isset($this->error['error_button_cart_productpage'])) {
                $data['error_button_cart_productpage'] = $this->error['error_button_cart_productpage'];
            } else {
                $data['error_button_cart_productpage'] = '';
            }
			if (isset($this->error['error_button_other_productpage'])) {
                $data['error_button_other_productpage'] = $this->error['error_button_othert_productpage'];
            } else {
                $data['error_button_other_productpage'] = '';
            }
			if (isset($this->error['error_block_option_productpage'])) {
                $data['error_block_option_productpage'] = $this->error['error_block_option_productpage'];
            } else {
                $data['error_block_option_productpage'] = '';
            }
			if (isset($this->error['error_button_cart_other'])) {
                $data['error_button_cart_other'] = $this->error['error_button_cart_other'];
            } else {
                $data['error_button_cart_other'] = '';
            }
			if (isset($this->error['error_block_product'])) {
                $data['error_block_product'] = $this->error['error_block_product'];
            } else {
                $data['error_block_product'] = '';
            }
			if (isset($this->error['error_mail_send'])) {
                $data['error_mail_send'] = $this->error['error_mail_send'];
            } else {
                $data['error_mail_send'] = '';
            }
			if (isset($this->error['error_avail_google_captcha_public'])) {
				$data['error_avail_google_captcha_public'] = $this->error['error_avail_google_captcha_public'];
			} else {
				$data['error_avail_google_captcha_public'] = '';
			}
			if (isset($this->error['error_avail_google_captcha_secret'])) {
				$data['error_avail_google_captcha_secret'] = $this->error['error_avail_google_captcha_secret'];
			} else {
				$data['error_avail_google_captcha_secret'] = '';
			}
			
            $data['breadcrumbs'] = array();

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_home'),
                'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
            );

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_module'),
                'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
            );

            if (!isset($this->request->get['module_id'])) {
                $data['breadcrumbs'][] = array(
                    'text' => $this->language->get('heading_title'),
                    'href' => $this->url->link('extension/module/avail', 'token=' . $this->session->data['token'], 'SSL')
                );
            } else {
                $data['breadcrumbs'][] = array(
                    'text' => $this->language->get('heading_title'),
                    'href' => $this->url->link('extension/module/avail', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
                );
            }
            if (!isset($this->request->get['module_id'])) {
                $data['action'] = $this->url->link('extension/module/avail', 'token=' . $this->session->data['token'], 'SSL');
            } else {
                $data['action'] = $this->url->link('extension/module/avail', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
            }
			
			 if (!isset($this->request->get['module_id'])) {
                $data['getAvailabilityList'] = $this->url->link('extension/module/avail/getAvailabilityList', 'token=' . $this->session->data['token'], 'SSL');
            } else {
                $data['getAvailabilityList'] = $this->url->link('extension/module/avail/getAvailabilityList', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
            }

            $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

            if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
                $module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
            }

            $data['token'] = $this->session->data['token'];
            
            if (isset($this->request->post['avail_status'])) {
                $data['avail_status'] = $this->request->post['avail_status'];
            } elseif ($this->config->get('avail_status')){
                $data['avail_status'] = $this->config->get('avail_status');
            } else {
				$data['avail_status'] = '';
			}	
			
			if (isset($this->request->post['avail_show_img'])) {
                $data['avail_show_img'] = $this->request->post['avail_show_img'];
            } elseif ($this->config->get('avail_show_img') == '0'){
                $data['avail_show_img'] = $this->config->get('avail_show_img');
            } else{
				$data['avail_show_img'] = '1';				
			}
			if (isset($this->request->post['avail_show_comment'])) {
                $data['avail_show_comment'] = $this->request->post['avail_show_comment'];
            } elseif ($this->config->get('avail_show_comment') == '0'){
                $data['avail_show_comment'] = $this->config->get('avail_show_comment');
            } else{
				$data['avail_show_comment'] = '0';				
			}
			if (isset($this->request->post['avail_options_status'])) {
                $data['avail_options_status'] = $this->request->post['avail_options_status'];
            } elseif ($this->config->get('avail_options_status')) {
				$data['avail_options_status'] = $this->config->get('avail_options_status');
			} else {
                $data['avail_options_status'] = '';
            }
			
			if (isset($this->request->post['avail_default'])) {
                $data['avail_default'] = $this->request->post['avail_default'];
            } elseif($this->config->get('avail_default') !== null) {			
				$data['avail_default'] = $this->config->get('avail_default');
			} else {
                $data['avail_default'] = '';
            }			
            if (isset($this->request->post['avail_block_option_productpage'])) {
                $data['block_option_productpage'] = $this->request->post['avail_block_option_productpage'];
            } elseif ($this->config->get('avail_block_option_productpage')) {
                $data['block_option_productpage'] = $this->config->get('avail_block_option_productpage');
            } else {
				$data['block_option_productpage'] = '';
			}  
			if (isset($this->request->post['avail_button_cart_productpage'])) {
                $data['button_cart_productpage'] = $this->request->post['avail_button_cart_productpage'];
            } elseif ($this->config->get('avail_button_cart_productpage')) {
                $data['button_cart_productpage'] = $this->config->get('avail_button_cart_productpage');
            } else {
				$data['button_cart_productpage'] = '';
			} 
			if (isset($this->request->post['avail_button_other_productpage'])) {
                $data['button_other_productpage'] = $this->request->post['avail_button_other_productpage'];
            } elseif ($this->config->get('avail_button_other_productpage')) {
                $data['button_other_productpage'] = $this->config->get('avail_button_other_productpage');
            } else {
				$data['button_other_productpage'] = '';
			} 
			if (isset($this->request->post['avail_button_cart_other'])) {
                $data['button_cart_other'] = $this->request->post['avail_button_cart_other'];
            } elseif ($this->config->get('avail_button_cart_other')) {
                $data['button_cart_other'] = $this->config->get('avail_button_cart_other');
            } else {
				$data['button_cart_other'] = '';
			} 
			if (isset($this->request->post['avail_block_product'])) {
                $data['avail_block_product'] = $this->request->post['avail_block_product'];
            } elseif ($this->config->get('avail_block_product')) {
                $data['avail_block_product'] = $this->config->get('avail_block_product');
            } else {
				$data['avail_block_product'] = '';
			}  
			if (isset($this->request->post['avail_email'])) {
                $data['avail_email'] = $this->request->post['avail_email'];
            } elseif ($this->config->get('avail_email')) {
                $data['avail_email'] = $this->config->get('avail_email');
            } else {
				$data['avail_email'] = '';
			}
			
			if (isset($this->request->post['avail_config_google_captcha_status'])) {
                $data['avail_config_google_captcha_status'] = $this->request->post['avail_config_google_captcha_status'];
            } elseif ($this->config->get('avail_config_google_captcha_status')) {
                $data['avail_config_google_captcha_status'] = $this->config->get('avail_config_google_captcha_status');
            } else {
				$data['avail_config_google_captcha_status'] = '';
			}
			if (isset($this->request->post['avail_config_product_edit'])) {
                $data['avail_config_product_edit'] = $this->request->post['avail_config_product_edit'];
            } elseif ($this->config->get('avail_config_product_edit')) {
                $data['avail_config_product_edit'] = $this->config->get('avail_config_product_edit');
            } else {
				$data['avail_config_product_edit'] = '';
			}
			
            if (isset($this->request->post['avail_config_google_captcha_public'])) {
                $data['avail_config_google_captcha_public'] = $this->request->post['avail_config_google_captcha_public'];
            } elseif ($this->config->get('avail_config_google_captcha_public')) {
				$data['avail_config_google_captcha_public'] = $this->config->get('avail_config_google_captcha_public');
			} else {
                $data['avail_config_google_captcha_public'] = '';
            }

			if (isset($this->request->post['avail_config_google_captcha_secret'])) {
                $data['avail_config_google_captcha_secret'] = $this->request->post['avail_config_google_captcha_secret'];
            } elseif ($this->config->get('avail_config_google_captcha_secret')) {
				$data['avail_config_google_captcha_secret'] = $this->config->get('avail_config_google_captcha_secret');
			} else {
                $data['avail_config_google_captcha_secret'] = '';
            }           
			
			if (isset($this->request->post['avail'])) {
			$data['message'] = $this->request->post['avail'];
			} elseif ($this->config->get('avail')) {
				$data['message'] = $this->config->get('avail');
			} else {
				$data['message'] = array();
			}
			if (isset($this->request->post['avail_text'])) {
			$data['avail_text'] = $this->request->post['avail_text'];
			} elseif ($this->config->get('avail_text')) {
				$data['avail_text'] = $this->config->get('avail_text');
			} else {
				$data['avail_text'] = array();
			}
			if (isset($this->request->post['avail_text_button_avail'])) {
			$data['avail_text_button_avail'] = $this->request->post['avail_text_button_avail'];
			} elseif ($this->config->get('avail_text_button_avail')) {
				$data['avail_text_button_avail'] = $this->config->get('avail_text_button_avail');
			} else {
				$data['avail_text_button_avail'] = array();
			}
            
            $data['header'] = $this->load->controller('common/header');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['footer'] = $this->load->controller('common/footer');

            $this->response->setOutput($this->load->view('extension/module/avail', $data));
        }
	}
        protected function validate() {
            if (!$this->user->hasPermission('modify', 'extension/module/avail')) {
                $this->error['warning'] = $this->language->get('error_permission');
            }            
			if (!preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['avail_email'])) {
			 $this->error['email'] = $this->language->get('error_email');
			}
			if ( $this->request->post['avail_config_google_captcha_secret'] == '1') {
				if (empty($this->request->post['avail_config_google_captcha_secret'] )) {
					$this->error['error_avail_google_captcha_public'] = $this->language->get('error_google_captcha_public');
				}
				if (empty($this->request->post['config_google_captcha_secret'] )) {
					$this->error['error_avail_google_captcha_secret'] = $this->language->get('error_google_captcha_secret');
				}
			}
			
			
			
			if($this->request->post['avail']){		
				foreach ($this->request->post['avail'] as $avail){
					if(isset($avail['notification_message'])) {
					
						$notification_message =  strip_tags(html_entity_decode($avail['notification_message']));
					
						if(strlen($notification_message) <= 20 && strlen($notification_message) >= 1){
						$this->error['error_mail_send'] = $this->language->get('error_mail_send');
						}
					}
					if(isset($avail['client_message'])) {
						$client_message =  strip_tags(html_entity_decode($avail['client_message']));
						if(strlen($client_message) <= 20 && strlen($client_message) >= 1){
						$this->error['error_mail_send'] = $this->language->get('error_mail_send');
						}
					}		  
				  
				}
			}
			
			

            return !$this->error;
        }
		public function getAvailabilityList(){
			$this->load->language('extension/module/avail');
			$this->load->model('extension/module/avail');
			$this->load->model('catalog/product');
			
			$data['heading_title'] = $this->language->get('heading_title');
			$data['text_varsion'] = $this->language->get('text_varsion');
            $data['text_yes'] = $this->language->get('text_yes');
            $data['text_no'] = $this->language->get('text_no');
			$data['text_time'] = $this->language->get('text_time');
			$data['text_product'] = $this->language->get('text_product');
			$data['text_price'] = $this->language->get('text_price');
			$data['text_mail'] = $this->language->get('text_mail');
			$data['text_name'] = $this->language->get('text_name');
			$data['text_comment'] = $this->language->get('text_comment');
			$data['text_statuse'] = $this->language->get('text_statuse');
			$data['text_quantity'] = $this->language->get('text_quantity');
			$data['text_list'] = $this->language->get('text_list');
			$data['tab_active'] = $this->language->get('tab_active');
			$data['tab_closed'] = $this->language->get('tab_closed');
			$data['button_delete'] = $this->language->get('button_delete');
            $data['button_send'] = $this->language->get('button_send');
			$data['button_save'] = $this->language->get('button_save');
            $data['button_cancel'] = $this->language->get('button_cancel');
			$data['id'] = "№";
			$data['reload'] = $this->language->get('reload');
			
			/*filter*/
			$data['entry_name'] = $this->language->get('text_entry_name');	
			$data['entry_email'] = $this->language->get('text_entry_email');	
			$data['entry_date_start'] = $this->language->get('text_date_start');	
			$data['entry_date_end'] = $this->language->get('text_date_end');	
			$data['entry_status'] = $this->language->get('entry_status');	
			$data['text_enabled'] = $this->language->get('text_enabled');	
			$data['text_disabled'] = $this->language->get('text_disabled');			
			$data['button_filter'] = $this->language->get('button_filter');
			
			$url = '';
			
			if (isset($this->request->get['filter_name_close'])) {
				$filter_name_close = $this->request->get['filter_name_close'];
			} else {
				$filter_name_close = null;
			}
			if (isset($this->request->get['filter_email_close'])) {
				$filter_email_close = $this->request->get['filter_email_close'];
			} else {
				$filter_email_close = null;
			}
			if (isset($this->request->get['filter_date_start_close'])) {
				$filter_date_start_close = $this->request->get['filter_date_start_close'];
			} else {
				$filter_date_start_close = null;
			}
			if (isset($this->request->get['filter_date_end_close'])) {
				$filter_date_end_close = $this->request->get['filter_date_end_close'];
			} else {
				$filter_date_end_close = null;
			}
			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = null;
			}
			if (isset($this->request->get['filter_email'])) {
				$filter_email = $this->request->get['filter_email'];
			} else {
				$filter_email = null;
			}
			if (isset($this->request->get['filter_date_start'])) {
				$filter_date_start = $this->request->get['filter_date_start'];
			} else {
				$filter_date_start = null;
			}
			if (isset($this->request->get['filter_date_end'])) {
				$filter_date_end = $this->request->get['filter_date_end'];
			} else {
				$filter_date_end = null;
			}
			if (isset($this->request->get['filter_status'])) {
				$filter_status = $this->request->get['filter_status'];
			} else {
				$filter_status = null;
			}
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}
			
			$filter_data = array(
			'filter_name'	 	  => $filter_name,	
			'filter_email'	  	  => $filter_email,	
			'filter_date_start'	  => $filter_date_start,	
			'filter_date_end'	  => $filter_date_end,			
			'filter_status'	 	  => $filter_status,			
			'start'          	  => ($page - 1) * 10 /*$this->config->get('config_limit_admin')*/,
			'limit'         	  => 10 /*$this->config->get('config_limit_admin')*/
			);
			$filter_data_close = array(			
			'filter_name_close'	  => $filter_name_close,	
			'filter_email_close'	  => $filter_email_close,	
			'filter_date_start_close'	  => $filter_date_start_close,	
			'filter_date_end_close'	  => $filter_date_end_close,	
			'start'           => ($page - 1) * 10 /*$this->config->get('config_limit_admin')*/,
			'limit'           => 10 /*$this->config->get('config_limit_admin')*/
			);
			
			$data['filter_name'] = $filter_name;
			$data['filter_email'] = $filter_email;
			$data['filter_date_start'] = $filter_date_start;
			$data['filter_date_end'] = $filter_date_end;
			$data['filter_status'] = $filter_status;
			$data['filter_name_close'] = $filter_name_close;
			$data['filter_email_close'] = $filter_email_close;
			$data['filter_date_start_close'] = $filter_date_start_close;
			$data['filter_date_end_close'] = $filter_date_end_close;
			$data['filter_date_end_close'] = $filter_date_end_close;
		
			/*end filter*/
						
			$availability = array();
			$availability  = $this->model_extension_module_avail->getAvailabilities($filter_data);
			if (isset($availability)) {	
				foreach ($availability as $availabilities) {
					$data['availabilities'][] = array (
						'id' => $availabilities['id'],
						'time'=>  $availabilities['time'],
						'product' => $availabilities['product'],
						'product_id' => $availabilities['product_id'],
						'edit'       => $this->url->link('catalog/product/edit', 'token=' . $this->session->data['token'] . '&product_id=' . $availabilities['product_id'] . $url, true),
						'price' => $availabilities['price'],
						'email' => $availabilities['email'],
						'name' => $availabilities['name'],
						'status' =>$availabilities['status'],
						'quantity' =>$availabilities['quantity'],
						'comment' =>  mb_strlen($availabilities['comment'])> 50 ? substr($availabilities['comment'],0,50) : $availabilities['comment'],
						'full_comment' => mb_strlen($availabilities['comment'])> 50 ? $availabilities['comment'] : '',
						'options' => $availabilities['option']						
					);
				}
			}
			
			$processed = array();
			$processed  = $this->model_extension_module_avail->getProcessed($filter_data_close);		
			if(isset($processed)) {
			    foreach ($processed as $proces) {
					$data['processed'][] = array (
						'id' => $proces['id'],
						'time'=>  $proces['time'],
						'product' => $proces['product'],
						'price' => $proces['price'],
						'email' => $proces['email'],
						'name' => $proces['name'],
						'status' =>$proces['status'],
						'quantity' =>$proces['quantity'],
						'comment' =>  mb_strlen($proces['comment'])> 50 ? substr($proces['comment'],0,50) : $proces['comment'],
						'full_comment' => mb_strlen($proces['comment'])> 50 ? $proces['comment'] : '',
						'options' => $proces['option']						
						);
				}				
			}
			
			
			
			$data['breadcrumbs'] = array();

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_home'),
                'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
            );

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_module'),
                'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
            );

            if (!isset($this->request->get['module_id'])) {
                $data['breadcrumbs'][] = array(
                    'text' => $this->language->get('heading_title'),
                    'href' => $this->url->link('extension/module/avail', 'token=' . $this->session->data['token'], 'SSL')
                );
            } else {
                $data['breadcrumbs'][] = array(
                    'text' => $this->language->get('heading_title'),
                    'href' => $this->url->link('extension/module/avail', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
                );
            }
			if (!isset($this->request->get['module_id'])) {
				$data['breadcrumbs'][] = array(
					'text' => $this->language->get('text_list'),
					'href' => $this->url->link('extension/module/avail/getAvailabilityList', 'token=' . $this->session->data['token'], 'SSL')
				);
			} else {
				$data['breadcrumbs'][] = array(
					'text' => $this->language->get('text_list'),
					'href' => $this->url->link('extension/module/avail/getAvailabilityList', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
				);
			}
			//$this->document->addStyle('view/avail/stylesheet/avail.css');
            $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');            

            $data['token'] = $this->session->data['token'];
			
			$data['statuses'] = array(
				'0' => $this->language->get('text_status_processed'),
				'1' => $this->language->get('text_status_notprocessed')
			);
			
			
			$data['header'] = $this->load->controller('common/header');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['footer'] = $this->load->controller('common/footer');

            $this->response->setOutput($this->load->view('extension/module/availist', $data));
			
		}        

        public function changeMailStatus(){            
            $this->load->model('extension/module/avail');
			$data['token'] = $this->session->data['token'];
            $id = $this->request->post['id'];
            $status = $this->request->post['status'];			
            if($this->model_extension_module_avail->changeMailStatus($id, $status)){
                echo 'ok';
            } else {
                echo 'error';
            }
        }
		public function notify() {
			$store = HTTP_CATALOG;
            $this->load->model('extension/module/avail');
			$this->load->model('catalog/product');
			$this->language->load('extension/module/avail');
			
			$success = '';
			$success_options = '';
			
			
			$result = $this->model_extension_module_avail->notifyOption();
			/*получаем список заявок по продуктам с опциями*/
			$result_options = $this->model_extension_module_avail->ProductWithOption();
			$messages = $this->config->get('avail');
			$product = Array();
			
			$data['token'] = $this->session->data['token'];
						
			if(!empty($result)){			
				foreach ($result as $info ) {
					
					
					
					$product = $this->model_catalog_product->getProduct($info['product_id']);
					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($product['price'], $this->config->get('config_currency'));
					} else {
					$price = false;
					}	
					//$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
					
					
					$message = strip_tags(html_entity_decode($messages[$info['language_id']]['client_message']));
					
					$link = HTTP_CATALOG . 'index.php?route=product/product&product_id='. $info['product_id'];
					
					$search_data = array('%name%', '%product_name%', '%price%', '%link%','%option_type%','%option_name%');
					$replace_data = array($info['name'], $info['product'], $price, "<a href=" . $link . ">" . $info['product'] . "</a>",'','');
					
					if (strlen($message) > 1) {						
						if(!empty($messages[$info['language_id']]['notification_message']))
						$mail_text = htmlspecialchars_decode($messages[$info['language_id']]['notification_message']);
						$mail_text = str_replace($search_data, $replace_data, $mail_text);
					} else {
						$mail_text = "<!DOCTYPE html><html><head><meta charset=\"UTF-8\"><title>Document</title></head><body>";
						$mail_text .= "<p>" . html_entity_decode($info['name'].', '.$this->language->get('text_mail_send'). "</p>");
						$mail_text .= "<p>" . $this->language->get('text_product') .': ' . $info['product'] . "</p>";
						$mail_text .= "<p>" . $this->language->get('text_link_page') . ": " . " <a href=" . $link . ">" . $info['product'] . "</a></p>";
						$mail_text .= "<p>" . $this->language->get('text_price') . ': ' . $price . "</p></body></html>";
					}					
					
					if ($this->config->get('config_mail')){
					$mail = new Mail($this->config->get('config_mail'));
					} else {
					$mail = new Mail();
					$mail->protocol = $this->config->get('config_mail_protocol');
					$mail->parameter = $this->config->get('config_mail_parameter');
					$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
					$mail->smtp_username = $this->config->get('config_mail_smtp_username');
					$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
					$mail->smtp_port = $this->config->get('config_mail_smtp_port');
					$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
					}
					
					$mail->setTo($info['email']);
					$mail->setFrom($this->config->get('config_email'));
					$mail->setSender($messages[$info['language_id']]['sender']);
					$mail->setSubject(html_entity_decode($messages[$info['language_id']]['notification_title']));				

					$mail->setHtml($mail_text);
					$mail->send();
					$this->model_extension_module_avail->changeMailStatus($info['id'], 1);
				}				
				$success = $this->language->get('success');
			}
					
			if (!empty($result_options)){
				$option_types = '';
				$option_names = '';				
			    foreach ($result_options as $info ) {	
					$product = $this->model_catalog_product->getProduct($info['product_id']);
				
					$price = $this->currency->format($product['price'], $this->config->get('config_currency'));
					
					'$price = '.$price;			
					$flag = 0;	
					$link = HTTP_CATALOG . 'index.php?route=product/product&product_id='. $info['product_id'];
			        /*масив данными по товаре и его опциях по заявке*/
					$options_notify = $this->model_extension_module_avail->OptionBuyProduct($info['product_id'], $info['id']);
					
					$info['options'] = array();
					array_push($info['options'], $options_notify);
					
				   if ($this->config->get('avail_options_status') == 1){
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
					$replace_data = array($info['name'], $info['product'], $price, "<a href=" . $link . ">" . $info['product'] . "</a>", '' , $option_names);
					$message = strip_tags(html_entity_decode($messages[$info['language_id']]['notification_message']));					
						if (strlen($message) > 1) {
							
								$mail_text = htmlspecialchars_decode($messages[$info['language_id']]['notification_message']);
								$mail_text = str_replace($search_data, $replace_data, $mail_text);						
														
						} else {
							$mail_text = "<!DOCTYPE html><html><head><meta charset=\"UTF-8\"><title>Document</title></head><body>";
							$mail_text .="<p>" . html_entity_decode($info['name'].', '.$this->language->get('text_mail_send'). "</p>");
							$mail_text .= "<p>" . $this->language->get('text_product') .': ' . $info['product'] . "</p>";
							$mail_text .= "<p>" . $this->language->get('text_link_page') . ": " . " <a href=" . $link . ">" . $info['product'] . "</a></p>";
							$mail_text .= "<p>" . $this->language->get('text_price') . ': ' . $price . "</p>";
							foreach($info['options'] as $index => $arr ) {
								foreach($arr as $option) {
									$mail_text .= "<p>" . $option['option_type'] . ' - ' . $option['option_name'] . "</p>";
								}								
							}	
							$mail_text .= "</body></html>";
						}
							if ($this->config->get('config_mail')){
							$mail = new Mail($this->config->get('config_mail'));
							} else {
							$mail = new Mail();
							$mail->protocol = $this->config->get('config_mail_protocol');
							$mail->parameter = $this->config->get('config_mail_parameter');
							$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
							$mail->smtp_username = $this->config->get('config_mail_smtp_username');
							$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
							$mail->smtp_port = $this->config->get('config_mail_smtp_port');
							$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
							}
										
							$mail->setTo($info['email']);
							$mail->setFrom($this->config->get('config_email'));
							$mail->setSender($messages[$info['language_id']]['sender']);
							$mail->setSubject(html_entity_decode($messages[$info['language_id']]['notification_title']));				
							
							$mail->setHtml($mail_text);
								
							$mail->send();
							//$this->model_module_avail->changeMailStatus($info['id'], 1);
						$success_options = $this->language->get('success');	
					}
									
				}			
				
			} 
			if(!empty($success) || !empty($success_options)) {				
				$json['success'] = $this->language->get('success');
				$this->response->setOutput(json_encode($json));
			} else {
				$json['error'] = $this->language->get('error');
                $this->response->setOutput(json_encode($json));
			}
		}
       
		public function deleteNotifications() {
			$this->load->model('extension/module/avail');
			$data['token'] = $this->session->data['token'];
			$selected = $this->request->post['idArray'];
			
			foreach ($selected as $value ) {
				$this->model_extension_module_avail->deleteNotifications($value);
			}		
		}
		
    }