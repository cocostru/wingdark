<?php
class ControllerExtensionModuleTelegramNotification extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/telegram_notification');
		
		$this->load->model("extension/module/telegram_notification");

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			if ( (isset($this->request->post['telegram_notification_orders_chat_ids'])) && ($this->request->post['telegram_notification_orders_chat_ids'] == 'last') ) {
				$this->request->post['telegram_notification_orders_chat_ids'] = 
					$this->model_extension_module_telegram_notification->GetLastMessageChatID( 
						(isset($this->request->post['telegram_notification_botid'])) ? $this->request->post['telegram_notification_botid'] : '' 
					);
			}
			if ( (isset($this->request->post['telegram_notification_reviews_chat_ids'])) && ($this->request->post['telegram_notification_reviews_chat_ids'] == 'last') ) {
				$this->request->post['telegram_notification_reviews_chat_ids'] = 
					$this->model_extension_module_telegram_notification->GetLastMessageChatID(
						(isset($this->request->post['telegram_notification_botid'])) ? $this->request->post['telegram_notification_botid'] : '' 
					);
			}
			if ( (isset($this->request->post['telegram_notification_contact_chat_ids'])) && ($this->request->post['telegram_notification_contact_chat_ids'] == 'last') ) {
				$this->request->post['telegram_notification_contact_chat_ids'] = 
					$this->model_extension_module_telegram_notification->GetLastMessageChatID(
						(isset($this->request->post['telegram_notification_botid'])) ? $this->request->post['telegram_notification_botid'] : '' 
					);
			}
			
			$this->model_setting_setting->editSetting('telegram_notification', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_about'] = $this->language->get('text_about');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_default_order_message_header_format'] = $this->language->get('text_default_order_message_header_format');
		$data['text_default_order_message_item_format'] = $this->language->get('text_default_order_message_item_format');
                $data['text_default_order_message_options_format'] = $this->language->get('text_default_order_message_options_format');
		$data['text_default_review_message_format'] = $this->language->get('text_default_review_message_format');
                $data['text_default_contact_message_format'] = $this->language->get('text_default_contact_message_format');
		$data['entry_botid'] = $this->language->get('entry_botid');
		$data['entry_orders_chat_ids'] = $this->language->get('entry_orders_chat_ids');
		$data['entry_orders_message_header_format'] = $this->language->get('entry_orders_message_header_format');
		$data['entry_orders_message_item_format'] = $this->language->get('entry_orders_message_item_format');
                $data['entry_orders_message_options_format'] = $this->language->get('entry_orders_message_options_format');
		$data['entry_reviews_message_format'] = $this->language->get('entry_reviews_message_format');
		$data['entry_reviews_chat_ids'] = $this->language->get('entry_reviews_chat_ids');
                $data['entry_contact_message_format'] = $this->language->get('entry_contact_message_format');
		$data['entry_contact_chat_ids'] = $this->language->get('entry_contact_chat_ids');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], true),
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/telegram_notification', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/telegram_notification', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['telegram_notification_botid'])) {
			$data['telegram_notification_botid'] = $this->request->post['telegram_notification_botid'];
		} else {
			$data['telegram_notification_botid'] = $this->config->get('telegram_notification_botid');
		}

		if (isset($this->request->post['telegram_notification_orders_chat_ids'])) {
			$data['telegram_notification_orders_chat_ids'] = $this->request->post['telegram_notification_orders_chat_ids'];
		} else {
			$data['telegram_notification_orders_chat_ids'] = $this->config->get('telegram_notification_orders_chat_ids');
		}
		
		if (isset($this->request->post['telegram_notification_orders_message_header_format'])) {
			$data['telegram_notification_orders_message_header_format'] = $this->request->post['telegram_notification_orders_message_header_format'];
		} elseif ( ($this->config->has('telegram_notification_orders_message_header_format')) && (strlen($this->config->get('telegram_notification_orders_message_header_format') ) > 0 ) ) {
			$data['telegram_notification_orders_message_header_format'] = $this->config->get('telegram_notification_orders_message_header_format');
		} else {
			$data['telegram_notification_orders_message_header_format'] = $data['text_default_order_message_header_format'];
		}
		
		if (isset($this->request->post['telegram_notification_orders_message_item_format'])) {
			$data['telegram_notification_orders_message_item_format'] = $this->request->post['telegram_notification_orders_message_item_format'];
		} elseif ( ($this->config->has('telegram_notification_orders_message_item_format')) && (strlen($this->config->get('telegram_notification_orders_message_item_format') ) > 0 ) ) {
			$data['telegram_notification_orders_message_item_format'] = $this->config->get('telegram_notification_orders_message_item_format');
		} else {
			$data['telegram_notification_orders_message_item_format'] = $data['text_default_order_message_item_format'];
		}
                
		if (isset($this->request->post['telegram_notification_orders_message_options_format'])) {
			$data['telegram_notification_orders_message_options_format'] = $this->request->post['telegram_notification_orders_message_options_format'];
		} elseif ( ($this->config->has('telegram_notification_orders_message_options_format')) && (strlen($this->config->get('telegram_notification_orders_message_options_format') ) > 0 ) ) {
			$data['telegram_notification_orders_message_options_format'] = $this->config->get('telegram_notification_orders_message_options_format');
		} else {
			$data['telegram_notification_orders_message_options_format'] = $data['text_default_order_message_options_format'];
		}
		
		if (isset($this->request->post['telegram_notification_reviews_chat_ids'])) {
			$data['telegram_notification_reviews_chat_ids'] = $this->request->post['telegram_notification_reviews_chat_ids'];
		} else {
			$data['telegram_notification_reviews_chat_ids'] = $this->config->get('telegram_notification_reviews_chat_ids');
		}
		
		if (isset($this->request->post['telegram_notification_reviews_message_format'])) {
			$data['telegram_notification_reviews_message_format'] = $this->request->post['telegram_notification_reviews_message_format'];
		} elseif ( ($this->config->has('telegram_notification_reviews_message_format')) && (strlen($this->config->get('telegram_notification_reviews_message_format') ) > 0 ) ) {
			$data['telegram_notification_reviews_message_format'] = $this->config->get('telegram_notification_reviews_message_format');
		} else {
			$data['telegram_notification_reviews_message_format'] = $data['text_default_review_message_format'];
		}
		                
		if (isset($this->request->post['telegram_notification_contact_chat_ids'])) {
			$data['telegram_notification_contact_chat_ids'] = $this->request->post['telegram_notification_contact_chat_ids'];
		} else {
			$data['telegram_notification_contact_chat_ids'] = $this->config->get('telegram_notification_contact_chat_ids');
		}
		
		if (isset($this->request->post['telegram_notification_contact_message_format'])) {
			$data['telegram_notification_contact_message_format'] = $this->request->post['telegram_notification_contact_message_format'];
		} elseif ( ($this->config->has('telegram_notification_contact_message_format')) && (strlen($this->config->get('telegram_notification_contact_message_format') ) > 0 ) ) {
			$data['telegram_notification_contact_message_format'] = $this->config->get('telegram_notification_contact_message_format');
		} else {
			$data['telegram_notification_contact_message_format'] = $data['text_default_contact_message_format'];
		}
                
		if (isset($this->request->post['telegram_notification_status'])) {
			$data['telegram_notification_status'] = $this->request->post['telegram_notification_status'];
		} else {
			$data['telegram_notification_status'] = $this->config->get('telegram_notification_status');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/telegram_notification', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/telegram_notification')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}