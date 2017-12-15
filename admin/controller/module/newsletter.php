<?php
class ControllerModuleNewsletter extends Controller {
	private $error = array();

	public function add() 
	{
		/* Check if data has been posted back. */
		$this->load->language('module/newsletter');

		$this->load->model('setting/setting');
		$this->load->model('module/newsletter');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$json = array(
				'status' 		=> json_encode($this->model_module_newsletter->insert( $_POST['nome'], $_POST['email'] )),
				'assinantes' 	=> json_encode($this->model_module_newsletter->getAllNewsletter()->rows)
			);

			$this->response->setOutput(json_encode($json));
		}
	}

	public function remove()
	{
		/* Check if data has been posted back. */
		$this->load->language('module/newsletter');

		$this->load->model('setting/setting');
		$this->load->model('module/newsletter');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$json = array(
				'status' 		=> json_encode($this->model_module_newsletter->deleteAssinante( $_POST['id'] )),
				'assinantes' 	=> json_encode($this->model_module_newsletter->getAllNewsletter()->rows)
			);

			$this->response->setOutput(json_encode($json));
		}
	}

	public function index() 
	{
		/* Load language file. */
		$this->load->language('module/newsletter');

		$this->load->model('setting/setting');
		$this->load->model('module/newsletter');

		$this->model_module_newsletter->installModule();

		$this->document->setTitle($this->language->get('heading_title'));

		/* Load language strings. */
		$data['text_edit'] 		= $this->language->get('text_edit');
		$data['text_module'] 	= $this->language->get('text_module');
		$data['text_enabled'] 	= $this->language->get('text_enabled');
		$data['text_disabled'] 	= $this->language->get('text_disabled');

		$data['heading_title'] 	= $this->language->get('heading_title');

		$data['entry_title'] 	= $this->language->get('entry_title');
		$data['entry_text'] 	= $this->language->get('entry_text');
		$data['entry_status'] 	= $this->language->get('entry_status');

		$data['button_save'] 	= $this->language->get('button_save');
		$data['button_cancel'] 	= $this->language->get('button_cancel');

		/* Loading up some URLS. */
		$data['cancel'] 		= $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$data['form_action'] 	= $this->url->link('module/newsletter/add', 'token=' . $this->session->data['token'], 'SSL');
		$data['exportar'] 	= $this->url->link('module/newsletter/exportar', 'token=' . $this->session->data['token'], 'SSL');
		$data['token'] 			= $this->session->data['token'];
		$data['action_add'] 	= $this->url->link('module/newsletter/add', 'SSL');
		/* Present error messages to users. */
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['newsletter'] = $this->url->link('module/order_export', 'token=' . $this->session->data['token'], 'SSL');

		/* Breadcrumb. */
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);
		
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);
		
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/newsletter', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['assinantes'] = array();

		$assinantes = $this->model_module_newsletter->getAllNewsletter()->rows;
		foreach ($assinantes as $key => $value) {

			if(isset($value['nome'])){
				$data['assinantes'][] = $value;
			}
		}

		/* Render some output. */
		$data['header'] 		= $this->load->controller('common/header');
		$data['column_left'] 	= $this->load->controller('common/column_left');
		$data['footer'] 		= $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/newsletter.tpl', $data));
	}

	/* Check user input. */
	private function validate() {
		// var_dump($this->request->post);
		// if (strlen($this->request->post['nome']) || strlen($this->request->post['id']) <= 3) {
		// 	$this->error['warning'] = $this->language->get('error_title');
		// }

		if ($this->error) {
			return false;
		} else {
			return true;
		}
	}

	public function exportar()
	{
		$this->load->model('module/newsletter');

		// output headers so that the file is downloaded rather than displayed
		header('Content-Type: text/csv; charset=utf-8');
		header('Content-Disposition: attachment; filename=assinantes.csv');

		// create a file pointer connected to the output stream
		$output = fopen('php://output', 'w');

		$lista = $this->model_module_newsletter->getAllNewsletter()->rows;
		$emails = array();

		foreach ($lista as $linha) {
	    	$emails[] = $linha['email'];
		}

		fputcsv($output, $emails);
	}
}