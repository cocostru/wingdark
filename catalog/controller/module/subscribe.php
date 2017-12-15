<?php
class ControllerModuleSubscribe extends Controller {
public function index($setting) {
	$this->document->addScript('catalog/view/javascript/bootstrap/js/bootstrap.min.js');
	$this->document->addStyle('catalog/view/javascript/bootstrap/css/bootstrap.min.css');

			//	$data['button_title'] = $this->language->get('button_title');
 
			//$data['module_title'] =  $setting['module_title'];
			$data['latter_text'] =   html_entity_decode($setting['latter_text']);
			$data['styles'] =   html_entity_decode($setting['styles']);
			$data['button_title'] =  $setting['sub_button_text'];
			$data['sub_placeholder_text'] =  $setting['sub_placeholder_text'];
			$data['latter_text'] =   html_entity_decode($setting['latter_text']);
			$data['sub_button_text'] =  $setting['sub_button_text'];
			$data['sub_title_text'] =   html_entity_decode($setting['sub_title_text']);
			$data['sub_thankth_text'] =   html_entity_decode($setting['sub_thankth_text']);
			$data['sub_thankth_title'] =  html_entity_decode( $setting['sub_thankth_title']);
			$data['subscribe_result_styles'] =   html_entity_decode($setting['subscribe_result_styles']);
			$data['subscribe_block_styles'] =   html_entity_decode($setting['subscribe_block_styles']);
			$data['input_styles'] =   html_entity_decode($setting['input_styles']);
			$data['btn_styles'] =   html_entity_decode($setting['btn_styles']);
			$data['header_styles'] =   html_entity_decode($setting['header_styles']);


			$data['thankth'] = $this->language->get('thankth');
   	$data['action'] = $this->url->link('module/subscribe/addSubscriber', '', 'SSL');
	if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . 'module/subscribe.tpl')) {
		return $this->load->view($this->config->get('config_template') . 'module/subscribe.tpl', $data);
	} else {
		return $this->load->view('module/subscribe.tpl', $data);
	}

}

	public function addSubscriber() {







		$this->load->model('module/subscribe');




			// Clear any previous login attempts for unregistered accounts.


		$data['action'] = $this->url->link('module/subscribe/addSubscriber', '', 'SSL');




		if (isset($this->request->post['latter_text'])) {
			$data['latter_text'] = $this->request->post['latter_text'];
		} else {
			$data['latter_text'] = 'Thank you for subscribe in our online shop. Now you can login with help of your email and  password.
                  Password - 123456';
		}

		if (isset($this->request->post['firstname'])) {
			$data['firstname'] = $this->request->post['email'];
		} else {
			$data['firstname'] = 'Subscriber';
		}

		if (isset($this->request->post['lastname'])) {
			$data['lastname'] = $this->request->post['lastname'];
		} else {
			$data['lastname'] = '';
		}
	if ((isset($this->request->post['email']))&&(utf8_strlen($this->request->post['email']) < 96)) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}

		;
















			$data['password'] = '123456';





			$data['newsletter'] = '1';




$customer_id=$this->model_module_subscribe->addSubscriber($data);


		if( ($customer_id>0)|($customer_id!=''))
		{



		}

	}

	private function validate() {


		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match($this->config->get('config_mail_regexp'), $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}


		return !$this->error;
	}


}
