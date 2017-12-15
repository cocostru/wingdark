<?php
class ControllerAccountSubscribe extends Controller {


	public function index() {







		$this->load->model('account/customer');




			// Clear any previous login attempts for unregistered accounts.


		$data['action'] = $this->url->link('account/subscribe', '', 'SSL');






		if (isset($this->request->post['firstname'])) {
			$data['firstname'] = $this->request->post['email'];
		} else {
			$data['firstname'] = '';
		}

		if (isset($this->request->post['lastname'])) {
			$data['lastname'] = $this->request->post['lastname'];
		} else {
			$data['lastname'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}

		;
















			$data['password'] = '123456';





			$data['newsletter'] = '1';




$customer_id=$this->model_account_customer->addSubscriber($data);


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
