<?php
/*------------------------------------------------------------------------
# Customer Reviews
# ------------------------------------------------------------------------
# The Krotek
# Copyright (C) 2011-2016 The Krotek. All Rights Reserved.
# @license - http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
# Website: http://thekrotek.com
# Support: support@thekrotek.com
-------------------------------------------------------------------------*/

class ControllerModuleReviews extends Controller
{
	private $module = true;
	private $type = "module";
	private $extension = "reviews";
	private $path = '';
	private $error = array();
	private $options = array(
		'customer_groups' => 'checkbox',
		'tax_class' => 'select',
		'geo_zone' => 'select',
		'status' => 'select',
		'sort_order' => 'input');
	
	public function index()
	{
		$data['extension'] = $this->extension;
		$data['type'] = $this->type;
		$data['token'] = $this->session->data['token'];
		
		if (version_compare(VERSION, '2.3', '>=')) $this->path = 'extension/';
		
		$data['path'] = $this->path;
				
		$this->language->load($this->type.'/'.$this->extension);	
		
		$data['heading_title'] = $this->language->get('heading_title');
		
		$this->document->setTitle($data['heading_title']);
		
		$this->load->model('setting/setting');
		
		if ($this->module) {
			$this->load->model('extension/module');
			$module_id = isset($this->request->get['module_id']) ? $this->request->get['module_id'] : 0;
		}
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {			
			if ($this->module) {
				$this->request->post['name'] = $this->request->post[$this->extension.'_name'];
				$this->request->post['status'] = $this->request->post[$this->extension.'_status'];
					
				if (!empty($module_id)) {
					$this->model_extension_module->editModule($module_id, $this->request->post);
				} else {
					$this->model_extension_module->addModule($this->extension, $this->request->post);
					
					$query = $this->db->query("SELECT MAX(module_id) AS id FROM `".DB_PREFIX."module` WHERE code = '".$this->extension."'");
					$module_id = $query->row['id'];
				}
			} else {
				$this->model_setting_setting->editSetting($this->extension, $this->request->post);
			}
			
			$this->session->data['success'] = sprintf($this->language->get('message_success'), $data['heading_title']);
			
			if ($this->request->post['apply']) {
				$this->response->redirect($this->url->link($this->path.$this->type.'/'.$this->extension, 'token='.$data['token'].(!empty($module_id) ? '&module_id='.$module_id : ''), 'SSL'));
			} else {
				if (version_compare(VERSION, '2.3', '<')) {
					$this->response->redirect($this->url->link('extension/'.$this->type, 'token='.$data['token'], 'SSL'));
				}  else {
					$this->response->redirect($this->url->link('extension/extension', 'token='.$data['token'].'&type='.$this->type, 'SSL'));
				}
			}
		}
		
		if (isset($this->session->data['success'])) $data['success'] = $this->session->data['success'];
		else $data['success'] = "";
		
		$this->session->data['success'] = "";
		
		if (ini_get('allow_url_fopen')) {
			if (@simplexml_load_file('http://500sales.ru/updates.xml')) {
				$xml = simplexml_load_file('http://500sales.ru/updates.xml');
				$latest = $xml->{$this->extension}->version;
				$current = $this->language->get('heading_version');
				
				if (version_compare($current, $latest, '=')) {
					$version = sprintf($this->language->get('heading_latest'), $latest);
					$class = "latest";
					$icon = "check-circle";
				} elseif (version_compare($current, $latest, '>')) {
					$version = sprintf($this->language->get('heading_future'), $current);
					$class = "future";
					$icon = "rocket";
				} else {
					$version = sprintf($this->language->get('heading_update'), $latest);
					$class = "update";
					$icon = "exclamation-circle";
				}
			} else {
				$version = $this->language->get('error_version');
				$class = "error";
				$icon = "exclamation-triangle";
			}
		} else {
			$version = $this->language->get('error_fopen');
			$class = "error";
			$icon = "exclamation-triangle";
		}
		
		$data['version'] = "<span class='version ".$class."'><i class='fa fa-".$icon."'> </i> ".$version."</span>";
		
		$data['text_edit'] = sprintf($this->language->get('text_edit_title'), $this->language->get('heading_title'));
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_select_all'] = $this->language->get('text_select_all');
		$data['text_unselect_all'] = $this->language->get('text_unselect_all');
		$data['text_remove_all'] = $this->language->get('text_remove_all');		
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_apply'] = $this->language->get('button_apply');
		$data['button_help'] = $this->language->get('button_help');		
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['breadcrumbs'] = array();
		
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token='.$data['token'], 'SSL'));
		
		if (version_compare(VERSION, '2.3', '<')) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_'.$this->type),
				'href' => $this->url->link('extension/'.$this->type, 'token='.$data['token'], 'SSL'));

			$data['breadcrumbs'][] = array(
				'text' => $data['heading_title'],
				'href' => $this->url->link($this->type.'/'.$this->extension, 'token='.$data['token'].(!empty($module_id) ? '&module_id='.$module_id : ''), 'SSL'));
			
			$data['action'] = $this->url->link($this->type.'/'.$this->extension, 'token='.$data['token'].(!empty($module_id) ? '&module_id='.$module_id : ''), 'SSL');
			$data['cancel'] = $this->url->link('extension/'.$this->type, 'token='.$data['token'], 'SSL');
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_extension'),
				'href' => $this->url->link('extension/extension', 'token='.$this->session->data['token'].'&type='.$this->type, true));
						
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/'.$this->type.'/'.$this->extension, 'token='.$this->session->data['token'].(!empty($module_id) ? '&module_id='.$module_id : ''), true));
			
			$data['action'] = $this->url->link('extension/'.$this->type.'/'.$this->extension, 'token='.$this->session->data['token'].(!empty($module_id) ? '&module_id='.$module_id : ''), true);
			$data['cancel'] = $this->url->link('extension/extension', 'token='.$this->session->data['token'].'&type='.$this->type, true);
		}
		
		if (version_compare(VERSION, '2.1', '<')) {
			$this->load->model('sale/customer_group');
			$groupmodel = 'model_sale_customer_group';
		} else {
			$this->load->model('customer/customer_group');
			$groupmodel = 'model_customer_customer_group';
		}
		
		$customer_groups = $this->{$groupmodel}->getCustomerGroups();
		
		foreach ($customer_groups as $customer_group) {
			$data['customer_groups'][] = array($customer_group['customer_group_id'], $customer_group['name']);
		}
		
		$this->load->model('localisation/tax_class');
		$taxes = $this->model_localisation_tax_class->getTaxClasses();
		
		$data['tax_class'][] = array(0, $this->language->get('text_none'));
		
		foreach ($taxes as $tax) {
			$data['tax_class'][] = array($tax['tax_class_id'], $tax['title']);
		}
		
		$this->load->model('localisation/geo_zone');
		$geo_zones = $this->model_localisation_geo_zone->getGeoZones();
		
		$data['geo_zone'][] = array(0, $this->language->get('text_all_zones'));
		
		foreach ($geo_zones as $geo_zone) {
			$data['geo_zone'][] = array($geo_zone['geo_zone_id'], $geo_zone['name']);
		}
		
		$this->load->model('localisation/order_status');
        $statuses = $this->model_localisation_order_status->getOrderStatuses();
		
        $data['order_status'] = array();

        foreach ($statuses as $status) {
        	$data['order_status'][] = array($status['order_status_id'], $status['name']);
        }
		
		$data['status'] = array(
			array('0', $data['text_disabled']),
			array('1', $data['text_enabled']));
		
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();

		foreach ($data['languages'] as $key => $language) {
			if (version_compare(VERSION, '2.2', '<')) {
				$data['languages'][$key]['image'] = 'view/image/flags/'.$language['image'];
			} else {
				$data['languages'][$key]['image'] = 'language/'.$language['code'].'/'.$language['code'].'.png';
			}
		}

		$this->load->model('localisation/stock_status');
		$statuses = $this->model_localisation_stock_status->getStockStatuses();
		
        foreach ($statuses as $status) {
        	$data['stock_status'][] = array($status['stock_status_id'], $status['name']);
        }

		$data['date_short'] = $this->language->get('date_format_short');
		$data['date_long'] = $this->language->get('date_format_long');
		$data['stylesheet'] = $this->extension;
		
		/* Extension specific code */
		
		$data['help'] = "https://thekrotek.com/opencart-extensions/customer-reviews";

		$data['options'] = array_merge(array(
			'name' => 'input',
			'ordering' => 'select',
			'limit' => 'input',
			'characters' => 'input',
			'sensitive' => 'radio',
			'available' => 'radio',
			'shuffle' => 'radio',
			'total' => 'radio',
			'width' => 'input',
			'height' => 'input'), $this->options);
    	
    	unset($data['options']['tax_class']);
    	unset($data['options']['geo_zone']);
    	unset($data['options']['sort_order']);
  		
		$data['ordering'] = array(
			array('random', $this->language->get('ordering_random')),
			array('asc', $this->language->get('ordering_asc')),
			array('desc', $this->language->get('ordering_desc')));
		
		/* Generic code */

		if (!empty($module_id) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($module_id);
		}
		
		foreach ($data['options'] as $key => $type) {
			$data['entry_'.$key] = $this->language->get('entry_'.$key);
			$data['help_'.$key] = $this->language->get('help_'.$key);
			
			$from_post = (isset($this->request->post[$this->extension.'_'.$key]) ? $this->request->post[$this->extension.'_'.$key] : "");
			$from_config = (!empty($module_info) && isset($module_info[$this->extension.'_'.$key]) ? $module_info[$this->extension.'_'.$key] : $this->config->get($this->extension.'_'.$key));
			$default = ($type == 'checkbox' ? array() : "");
			
			if (!isset($data[$this->extension.'_'.$key])) {
				if (!empty($from_post)) $data[$this->extension.'_'.$key] = $from_post;
				elseif (isset($from_config)) $data[$this->extension.'_'.$key] = $from_config;
				else $data[$this->extension.'_'.$key] = $default;
			}
		}
		
		if (isset($this->session->data['errors'])) {
			foreach ($this->session->data['errors'] as $key => $text) {
				$this->error[$key] = $text;
			}
			
			unset($this->session->data['errors']);
		}
		
		if (!empty($this->error)) {
			$data['errors'] = $this->error;
		} else {
			$data['errors'] = '';
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view($this->type."/".$this->extension.(version_compare(VERSION, '2.2', '<') ? '.tpl' : ''), $data));
	}
	
	private function validate()
	{
		if (!$this->user->hasPermission('modify', $this->type.'/'.$this->extension)) {
			$this->error['warning'] = sprintf($this->language->get('error_permission'), $this->language->get('heading_title'));
		} else {
			$numerics = array('limit', 'characters', 'width', 'height');
			$percent = array();
			$date = array();
			$nonempty = array('name');
			
			$fields = array_unique(array_merge($numerics, array_merge($percent, $nonempty)));
			$post = $this->request->post;
			
			if ($fields) {
				foreach ($fields as $field) {
					if (isset($post[$this->extension.'_'.$field])) {
						$value = $post[$this->extension.'_'.$field];
						
						if (in_array($field, $nonempty) && !$value) {
							$this->error[] = sprintf($this->language->get('error_empty'), $this->language->get('entry_'.$field));
						} elseif (in_array($field, $date) && (strtotime($value) === false)) {
							$this->error[] = sprintf($this->language->get('error_date'), $this->language->get('entry_'.$field));
						} elseif (!is_array($value)) {
							$value = trim($value, "%");
							
							if (!empty($value) && !is_numeric($value)) {
								if (in_array($field, $numerics)) {
									$this->error[] = sprintf($this->language->get('error_numerical'), $this->language->get('entry_'.$field));
								} elseif (in_array($field, $percent)) {
									$this->error[] = sprintf($this->language->get('error_percent'), $this->language->get('entry_'.$field));
								}
							} elseif ($value < 0) {
								$this->error[] = sprintf($this->language->get('error_positive'), $this->language->get('entry_'.$field));
							}
						}
					} elseif (in_array($field, $nonempty)) {
						$this->error[] = sprintf($this->language->get('error_empty'), $this->language->get('entry_'.$field));
					}
				}
			}
		}
		
		if (!$this->error) return true;
		else return false;
	}
}

?>