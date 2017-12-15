<?php
class ControllerModuleSubscribe extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/subscribe');

		$this->document->setTitle($this->language->get('heading_title'));

		/*$this->load->model('setting/setting');
//var_dump($this->request->post);exit;
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('subscribe', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}
*/


		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('subscribe', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['css_title'] = $this->language->get('css_title');
		$data['title_text'] = $this->language->get('title_text');
		$data['button_text'] = $this->language->get('button_text');
		$data['placeholder_text'] = $this->language->get('placeholder_text');
		$data['placeholder_title_field_name'] = $this->language->get('placeholder_title_field_name');
		
		$data['email_text'] = $this->language->get('email_text');
		$data['entry_name'] = $this->language->get('entry_name');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['subscribe_result_styles_field'] = $this->language->get('subscribe_result_styles_field');
		$data['header_styles_field'] = $this->language->get('header_styles_field');
		$data['btn_styles_field'] = $this->language->get('btn_styles_field');
		$data['input_styles_field'] = $this->language->get('input_styles_field');
		$data['subscribe_block_styles_field'] = $this->language->get('subscribe_block_styles_field');


		$data['entry_status'] = $this->language->get('entry_status');
		$data['sub_thankth_field_name'] = $this->language->get('sub_thankth_field_name');
		$data['sub_thankth_title_field_name'] = $this->language->get('sub_thankth_title_field_name');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/subscribe', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/subscribe', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}


		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/subscribe', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/subscribe', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}


		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}


		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['styles'])) {
			$data['styles'] = htmlentities($this->request->post['styles']);
		} elseif (!empty($module_info)) {
			$data['styles'] = html_entity_decode($module_info['styles']);
		} else {
			$data['styles'] = '

			.subscribe_block::-webkit-input-placeholder {color:#c0392b;}
.subscribe_block::-moz-placeholder          {color:#c0392b;}/* Firefox 19+ */
.subscribe_block:-moz-placeholder           {color:#c0392b;}/* Firefox 18- */
.subscribe_block:-ms-input-placeholder      {color:#c0392b;}
			';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		if (isset($this->request->post['latter_text'])) {
			$data['latter_text'] = htmlentities($this->request->post['latter_text']);
		} elseif (!empty($module_info)) {
			$data['latter_text'] = html_entity_decode( $module_info['latter_text']);
		} else {
			$data['latter_text'] = ' Thank you for subscribe in our online shop. Now you can login with help of your email and  password.
                  Password - 123456';
		}

		if (isset($this->request->post['subscribe_block_styles'])) {
			$data['subscribe_block_styles'] = htmlentities($this->request->post['subscribe_block_styles']);
		} elseif (!empty($module_info)) {
			$data['subscribe_block_styles'] = html_entity_decode( $module_info['latter_text']);
		} else {
			$data['subscribe_block_styles'] = ' padding: 10px 5px;';
		}

		if (isset($this->request->post['input_styles'])) {
			$data['input_styles'] = htmlentities($this->request->post['input_styles']);
		} elseif (!empty($module_info)) {
			$data['input_styles'] = html_entity_decode( $module_info['input_styles']);
		} else {
			$data['input_styles'] = '/*input style*/';
		}

		if (isset($this->request->post['btn_styles'])) {
			$data['btn_styles'] = htmlentities($this->request->post['btn_styles']);
		} elseif (!empty($module_info)) {
			$data['btn_styles'] = html_entity_decode( $module_info['btn_styles']);
		} else {
			$data['btn_styles'] = '/*btn*/';
		}

		if (isset($this->request->post['header_styles'])) {
			$data['header_styles'] = htmlentities($this->request->post['header_styles']);
		} elseif (!empty($module_info)) {
			$data['header_styles'] = html_entity_decode( $module_info['header_styles']);
		} else {
			$data['header_styles'] = '/*header*/';
		}

		if (isset($this->request->post['subscribe_result_styles'])) {
			$data['subscribe_result_styles'] = htmlentities($this->request->post['subscribe_result_styles']);
		} elseif (!empty($module_info)) {
			$data['subscribe_result_styles'] = html_entity_decode( $module_info['subscribe_result_styles']);
		} else {
			$data['subscribe_result_styles'] = '/*subdcribe*/';
		}

		if (isset($this->request->post['sub_button_text'])) {
			$data['sub_button_text'] = $this->request->post['sub_button_text'];
		} elseif (!empty($module_info)) {
			$data['sub_button_text'] = $module_info['sub_button_text'];
		} else {
			$data['sub_button_text'] = 'Subscribe';
		}
		if (isset($this->request->post['sub_title_text'])) {
			$data['sub_title_text'] =htmlentities( $this->request->post['sub_title_text']);
		} elseif (!empty($module_info)) {
			$data['sub_title_text'] =  html_entity_decode($module_info['sub_title_text']);
		} else {
			$data['sub_title_text'] = 'Subscribe for us';
		}

		if (isset($this->request->post['sub_placeholder_text'])) {
			$data['sub_placeholder_text'] = $this->request->post['sub_placeholder_text'];
		} elseif (!empty($module_info)) {
			$data['sub_placeholder_text'] = $module_info['sub_placeholder_text'];
		} else {
			$data['sub_placeholder_text'] = ' Your email';
		}
		if (isset($this->request->post['sub_thankth_title'])) {
			$data['sub_thankth_title'] =htmlentities( $this->request->post['sub_thankth_title']);
		} elseif (!empty($module_info)) {
			$data['sub_thankth_title'] =  html_entity_decode($module_info['sub_thankth_title']);
		} else {
			$data['sub_thankth_title'] = 'Subscribe successfully framed';
		}

		if (isset($this->request->post['sub_thankth_text'])) {
			$data['sub_thankth_text'] =htmlentities( $this->request->post['sub_thankth_text']);
		} elseif (!empty($module_info)) {
			$data['sub_thankth_text'] = html_entity_decode( $module_info['sub_thankth_text']);
		} else {
			$data['sub_thankth_text'] = 'Thank you for subscribe!';
		}


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/subscribe', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/subscribe')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}