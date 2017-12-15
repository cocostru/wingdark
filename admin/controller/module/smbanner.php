<?php
class ControllerModuleSmbanner extends Controller {
	private $error = array();

	public function index() {
		if ($this->config->get('config_editor_default')) {
			$this->document->addScript('view/javascript/ckeditor/ckeditor.js');
			$this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
		}
		$this->load->language('module/smbanner');
		
		$this->load->model('tool/image');
		
		$this->document->setTitle($this->language->get('heading_title1'));

		$this->load->model('extension/module');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			
	
			if (!isset($this->request->get['module_id'])) {
			
				$this->model_extension_module->addModule('smbanner', $this->request->post);
			} else {
			
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/'.$this->type, 'token='.$data['token'], 'SSL'));


		}  
		
		
		$data['ckeditor'] = $this->config->get('config_editor_default');
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_contact_content'] = $this->language->get('text_contact_content');
		
		$data['width_full'] = $this->language->get('width_full');
		$data['width_1_2'] = $this->language->get('width_1_2');
		$data['width_1_3'] = $this->language->get('width_1_3');
		$data['width_1_4'] = $this->language->get('width_1_4');
		

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_product'] = $this->language->get('entry_product');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_value'] = $this->language->get('entry_value');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_value2'] = $this->language->get('entry_value2');
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);		
		
		$data['button_custom_field_value_add'] = $this->language->get('button_custom_field_value_add');
		$data['button_remove'] = $this->language->get('button_remove');
		
		$data['help_product'] = $this->language->get('help_product');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['entry_description'] = $this->language->get('entry_description');

		
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
				'href' => $this->url->link('module/smbanner', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/smbanner', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}
		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/smbanner', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/smbanner', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		

		$data['token'] = $this->session->data['token'];
		
		

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = ''; 
		}

		if (isset($this->error['image'])) {
			$data['error_image'] = $this->error['image'];
		} else {
			$data['error_image'] = '';
		}

		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
		}
		if (isset($this->error['error_image'])) {
			$data['error_image'] = $this->error['error_image'];
		} else {
			$data['error_image'] = '';
		}

		

		

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		
		
		
		$smheader_contact = array();	

//если идет пост запрос нажали сохранить и не прошел
		if (isset($this->request->post['smbanner_info'])) {
			
			foreach ($this->request->post['smbanner_info'] as $info){
				foreach ($info['header_page_top_description'] as $key => $image){
					if($info['select_content'] == 'image'){
						$thumb = $this->model_tool_image->resize($image['image'], 200, 100);								
						$image = $image['image'];
					} else{
						$thumb = '';								
						$image = $image['image'];
					}
					$contact_image[$key] = array(						
							'thumb' => $thumb,
							'image' => $image 
						);
				}
				if($info['width'] == 'col-lg-12'){
					$text_width_select = $this->language->get('width_full');
				} elseif($info['width'] == 'col-lg-6'){
					$text_width_select = $this->language->get('width_1_2');
				} elseif($info['width'] == 'col-lg-4'){
					$text_width_select = $this->language->get('width_1_3');
				} elseif($info['width'] == 'col-lg-3'){
					$text_width_select = $this->language->get('width_1_4');
				} else {
					$text_width_select = ' - ';
				}				
				
				 $smheader_contact[] = array(
					 'header_page_top_description' => $contact_image,
					 'url' => (!empty($info['url']))?$info['url']:'',
					 'width' => $info['width'],
					 'sort_order' => $info['sort_order'],
					 'text_width_select' => $text_width_select,
					 'select_content' => $info['select_content']
					 );
			} 
		} else if(!empty($module_info['smbanner_info'])){
			
			foreach ($module_info['smbanner_info'] as $info){
				
				foreach ($info['header_page_top_description'] as $key => $image){
					if($info['select_content'] == 'image'){
						$thumb = $this->model_tool_image->resize($image['image'], 200, 100);								
						$image = $image['image'];
					} else{
						$thumb = '';								
						$image = $image['image'];
					}
					$contact_image[$key] = array(						
							'thumb' => $thumb,
							'image' => $image 
						);
				}
				if($info['width'] == 'col-lg-12'){
					$text_width_select = $this->language->get('width_full');
				} elseif($info['width'] == 'col-lg-6'){
					$text_width_select = $this->language->get('width_1_2');
				} elseif($info['width'] == 'col-lg-4'){
					$text_width_select = $this->language->get('width_1_3');
				} elseif($info['width'] == 'col-lg-3'){
					$text_width_select = $this->language->get('width_1_4');
				} else {
					$text_width_select = ' - ';
				}				
				
				 $smheader_contact[] = array(
					 'header_page_top_description' => $contact_image,
					 'url' => $info['url'],
					 'width' => $info['width'],
					 'sort_order' => $info['sort_order'],
					 'text_width_select' => $text_width_select,
					 'select_content' => $info['select_content']
					 );
			} 
		}	
		
		if (isset($this->request->post['smbanner_info'])) {
			$data['smbanner_info'] = $smheader_contact;
		} elseif (!empty($smheader_contact)) {
			$data['smbanner_info'] = $smheader_contact;
		} else {
			$data['smbanner_info'] = array();
		}
        
		

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/smbanner.tpl', $data));
		
	}

	protected function validate() {
	 
		
		if (!$this->user->hasPermission('modify', 'module/smbanner')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		if (isset($this->request->post['smbanner_info'])) {
			
			foreach ($this->request->post['smbanner_info'] as $banner_image_id => $banner_image) {
					
				foreach ($banner_image['header_page_top_description'] as $language_id => $banner_image_description) {
					
					if (empty($banner_image_description['image'])) {
						$error_image[$banner_image_id][$language_id] = Array('error_text' => $this->language->get('error_image_text'));
					} 
				}
			
			}
			
			
		}
		if($error_image){
		$this->error['error_image'] = $error_image;}
		
		echo '<pre>';
		print_r($error_image);
		echo '</pre>';

		// if (!$this->request->post['height']) {
			// $this->error['height'] = $this->language->get('error_height');
		// }

		return !$this->error;
	}
}