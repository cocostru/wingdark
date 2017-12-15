<?php
class ControllerExtensionModuleSeparateProducts extends Controller {
	private $error = array();

	public function index() {
		$this->load->language( 'extension/module/separate_products');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('extension/module');
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_license'] = $this->language->get('text_license');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['text_edit'] = $this->language->get('text_edit');
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link(
                'common/home', 'token=' . $this->session->data['token'], true
            ),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link(
				'extension/module', 'token=' . $this->session->data['token'], true
			),
      		'separator' => ' :: '
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link(
				 'extension/module/separate_products', 'token=' . $this->session->data['token'], true
			),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link(
			 'extension/module/separate_products', 
			'token=' . $this->session->data['token'], 
			true
		);
		
		$data['cancel'] = $this->url->link(
			'extension/module', 'token=' . $this->session->data['token'], true
		);

		if (isset($this->request->post['separate_products'])) {
			$modules = explode(',', $this->request->post['separate_products']);
		} elseif ($this->config->get('separate_products') != '') { 
			$modules = explode(',', $this->config->get('separate_products'));
		} else {
			$modules = array();
		}		
		
		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['modules'] = $modules;
		
		if (isset($this->request->post['separate_products'])) {
			$data['separate_products'] = $this->request->post['separate_products'];
		} else {
			$data['separate_products'] = $this->config->get('separate_products');
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('extension/module/separate_products.tpl', $data));

		
	}
	
	
	public function install() { 
//Create ALTER user_id in tabele product
		//$col = @$this->db->query("SELECT user_id FROM ". DB_PREFIX . "product");
		//"SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'my_table' AND COLUMN_NAME = 'my_column'";
		
		$query = $this->db->query("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = '" . DB_PREFIX . "product' AND COLUMN_NAME = 'user_id'");
		if ($query->num_rows < 1) {
				$this->db->query("ALTER TABLE ". DB_PREFIX ."product ADD user_id INT NOT NULL DEFAULT 0 ");
				$this->db->query("UPDATE " . DB_PREFIX . "product SET user_id = '" . 1 . "'");
		}	
      		
//Create ALTER commission in tabele user
		//$col = @$this->db->query("SELECT commission FROM ". DB_PREFIX . "user");
		$query = $this->db->query("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = '" . DB_PREFIX . "user' AND COLUMN_NAME = 'commission'");
		if ($query->num_rows < 1) {
				$this->db->query("ALTER TABLE ". DB_PREFIX ."user ADD commission DECIMAL(5,2) NOT NULL DEFAULT 0 ");
		}
//Create ALTER bank in tabele user
		//$col = @$this->db->query("SELECT bank FROM ". DB_PREFIX . "user");
		$query = $this->db->query("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = '" . DB_PREFIX . "user' AND COLUMN_NAME = 'bank'");
		if ($query->num_rows < 1) {
				$this->db->query("ALTER TABLE ". DB_PREFIX ."user ADD bank VARCHAR(255) NOT NULL DEFAULT '' ");
		}
//Create ALTER add_code in tabele user
		//$col = @$this->db->query("SELECT bank FROM ". DB_PREFIX . "user");
		$query = $this->db->query("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = '" . DB_PREFIX . "user' AND COLUMN_NAME = 'add_code'");
		if ($query->num_rows < 1) {
				$this->db->query("ALTER TABLE ". DB_PREFIX ."user ADD add_code TEXT NOT NULL DEFAULT '' ");
		}	
//Create ALTER user_text in tabele user
		//$col = @$this->db->query("SELECT bank FROM ". DB_PREFIX . "user");
		$query = $this->db->query("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = '" . DB_PREFIX . "user' AND COLUMN_NAME = 'user_text'");
		if ($query->num_rows < 1) {
				$this->db->query("ALTER TABLE ". DB_PREFIX ."user ADD user_text VARCHAR(256) NOT NULL DEFAULT '' ");
		}
//Create ALTER user_text in tabele user
		//$col = @$this->db->query("SELECT bank FROM ". DB_PREFIX . "user");
		$query = $this->db->query("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = '" . DB_PREFIX . "user' AND COLUMN_NAME = 'email_question'");
		if ($query->num_rows < 1) {
				$this->db->query("ALTER TABLE ". DB_PREFIX ."user ADD email_question tinyint(1) NOT NULL DEFAULT 1 ");
		}
//Create ALTER badge in tabele user
		//$col = @$this->db->query("SELECT bank FROM ". DB_PREFIX . "user");
		$query = $this->db->query("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = '" . DB_PREFIX . "user' AND COLUMN_NAME = 'badge1'");
		if ($query->num_rows < 1) {
				$this->db->query("ALTER TABLE ". DB_PREFIX ."user ADD badge1 VARCHAR(128) NOT NULL DEFAULT '' ");
		}
//Create ALTER badge in tabele user
		//$col = @$this->db->query("SELECT bank FROM ". DB_PREFIX . "user");
		$query = $this->db->query("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = '" . DB_PREFIX . "user' AND COLUMN_NAME = 'badge2'");
		if ($query->num_rows < 1) {
				$this->db->query("ALTER TABLE ". DB_PREFIX ."user ADD badge2 VARCHAR(128) NOT NULL DEFAULT '' ");
		}
//Create ALTER badge in tabele user
		//$col = @$this->db->query("SELECT bank FROM ". DB_PREFIX . "user");
		$query = $this->db->query("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = '" . DB_PREFIX . "user' AND COLUMN_NAME = 'badge3'");
		if ($query->num_rows < 1) {
				$this->db->query("ALTER TABLE ". DB_PREFIX ."user ADD badge3 VARCHAR(128) NOT NULL DEFAULT '' ");
		}
//Create ALTER badge in tabele user
		//$col = @$this->db->query("SELECT bank FROM ". DB_PREFIX . "user");
		$query = $this->db->query("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = '" . DB_PREFIX . "user' AND COLUMN_NAME = 'badge4'");
		if ($query->num_rows < 1) {
				$this->db->query("ALTER TABLE ". DB_PREFIX ."user ADD badge4 VARCHAR(128) NOT NULL DEFAULT '' ");
		}
//Create ALTER badge in tabele user
		//$col = @$this->db->query("SELECT bank FROM ". DB_PREFIX . "user");
		$query = $this->db->query("SELECT * FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" . DB_DATABASE . "' AND TABLE_NAME = '" . DB_PREFIX . "user' AND COLUMN_NAME = 'badge5'");
		if ($query->num_rows < 1) {
				$this->db->query("ALTER TABLE ". DB_PREFIX ."user ADD badge5 VARCHAR(128) NOT NULL DEFAULT '' ");		
		}
		
//ADD admin Permission
		$this->model_user_user_group->addPermission(1, 'access',  'extension/module/separate_products');
		$this->model_user_user_group->addPermission(1, 'modify',  'extension/module/separate_products');

//Separate Products - Admin Users		
		//Create Group Separate Products - Admin Users and get user_group_id		
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."user_group WHERE name='Separate Products - Admin Users' ");
		if ($query->num_rows <= 0) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "user_group (name) VALUES ('Separate Products - Admin Users')" );
		}
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."user_group WHERE name='Separate Products - Admin Users' ");
		foreach ($query->rows as $result) {
			$user_group_id = $result['user_group_id'];
		}
    	
		//Separate product User group Permission
		//access
		$this->model_user_user_group->addPermission($user_group_id, 'access',  'extension/module/separate_products');
		//$this->model_user_user_group->addPermission($user_group_id, 'modify',  'extension/module/separate_products');
		
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/attribute');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/attribute_group');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/category');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/download');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/filter');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/manufacturer');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/option');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/product');
				
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'common/filemanager');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'extension/openbay');
		
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'user/api');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'user/user');
		
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'sale/order');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'sale/recurring');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'sale/return');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'sale/voucher');
		
		//modify
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'catalog/attribute');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'catalog/attribute_group');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'catalog/category');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'catalog/download');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'catalog/filter');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'catalog/manufacturer');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'catalog/option');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'catalog/product');
				
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'common/filemanager');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'extension/openbay');
		
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'user/api');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'user/user');
		
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'sale/order');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'sale/recurring');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'sale/return');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'sale/voucher');
		
		
//Separate Products - External Users		
		//Create Group Separate Products - External Users and get user_group_id		
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."user_group WHERE name='Separate Products - External Users' ");
		if ($query->num_rows <= 0) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "user_group (name) VALUES ('Separate Products - External Users')" );
		}
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."user_group WHERE name='Separate Products - External Users' ");
		foreach ($query->rows as $result) {
			$user_group_id = $result['user_group_id'];
		}
    	
		//Separate product User group Permission
		//access
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/attribute');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/attribute_group');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/category');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/download');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/filter');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/manufacturer');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/option');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/product');
		
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'common/filemanager');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'sale/order');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'extension/openbay');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'user/api');
		//modify
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'catalog/product');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'common/filemanager');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'sale/order');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'user/api');

//Separate Products - Internal Users		
		//Create Group Separate Products - Internal Users and get user_group_id		
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."user_group WHERE name='Separate Products - Internal Users' ");
		if ($query->num_rows <= 0) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "user_group (name) VALUES ('Separate Products - Internal Users')" );
		}
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."user_group WHERE name='Separate Products - Internal Users' ");
		foreach ($query->rows as $result) {
			$user_group_id = $result['user_group_id'];
		}
    	
		//Separate product Admin User group Permission
		//access
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/attribute');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/attribute_group');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/category');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/download');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/filter');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/manufacturer');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/option');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/product');
		
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'common/filemanager');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'sale/order');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'extension/openbay');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'user/api');
		
		//modify
		$this->model_user_user_group->addPermission($user_group_id, 'modify',  'extension/module/separate_products');
		
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'catalog/product');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'common/filemanager');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'sale/order');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'user/api');
		
//Separate Products - Internal Users - Only Products 		
		//Create Group Separate Products - Internal Users and get user_group_id		
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."user_group WHERE name='Separate Products - Internal Users - Only Products' ");
		if ($query->num_rows <= 0) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "user_group (name) VALUES ('Separate Products - Internal Users - Only Products')" );
		}
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."user_group WHERE name='Separate Products - Internal Users - Only Products' ");
		foreach ($query->rows as $result) {
			$user_group_id = $result['user_group_id'];
		}
    	
		//Separate product Admin User group Permission
		//access
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/attribute');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/attribute_group');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/category');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/download');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/filter');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/manufacturer');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/option');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/product');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'user/api');
		
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'common/filemanager');
		//$this->model_user_user_group->addPermission($user_group_id, 'access', 'sale/order');
		//$this->model_user_user_group->addPermission($user_group_id, 'access', 'extension/openbay');
		
		//modify
		$this->model_user_user_group->addPermission($user_group_id, 'modify',  'extension/module/separate_products');
		
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'catalog/product');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'common/filemanager');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'user/api');
		//$this->model_user_user_group->addPermission($user_group_id, 'modify', 'sale/order');

//Separate Products - Internal Users - Only Orders 		
		//Create Group Separate Products - Internal Users and get user_group_id		
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."user_group WHERE name='Separate Products - Internal Users - Only Orders' ");
		if ($query->num_rows <= 0) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "user_group (name) VALUES ('Separate Products - Internal Users - Only Orders')" );
		}
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."user_group WHERE name='Separate Products - Internal Users - Only Orders' ");
		foreach ($query->rows as $result) {
			$user_group_id = $result['user_group_id'];
		}
    	
		//Separate product Admin User group Permission
		//access
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/attribute');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/attribute_group');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/category');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/download');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/filter');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/manufacturer');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/option');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'catalog/product');
				
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'user/user');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'sale/order');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'extension/openbay');
		$this->model_user_user_group->addPermission($user_group_id, 'access', 'user/api');
		
		//modify
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'sale/order');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'localisation/order_status');
		$this->model_user_user_group->addPermission($user_group_id, 'modify', 'user/api');

		
    }
	
	public function uninstall() {  
		//$this->load->language( 'extension/module/separate_products');
		//$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('extension/module');
		$this->load->model('user/user_group');
				
//Delete Separate Products - External Users
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."user_group WHERE name='Separate Products - External Users' ");
		foreach ($query->rows as $result) {
			$user_group_id = $result['user_group_id'];
		}
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/attribute');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/attribute_group');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/category');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/download');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/filter');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/manufacturer');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/option');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/product');
		
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'common/filemanager');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'sale/order');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'extension/openbay');
		
		
		//modify
		$this->model_user_user_group->removePermission($user_group_id, 'modify', 'catalog/product');
		$this->model_user_user_group->removePermission($user_group_id, 'modify', 'common/filemanager');
		$this->model_user_user_group->removePermission($user_group_id, 'modify', 'sale/order');

//Delete Separate Products - Internal Users		
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."user_group WHERE name='Separate Products - Internal Users' ");
		foreach ($query->rows as $result) {
			$user_group_id = $result['user_group_id'];
		}
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/attribute');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/attribute_group');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/category');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/download');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/filter');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/manufacturer');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/option');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/product');
		
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'common/filemanager');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'sale/order');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'extension/openbay');
		
		//modify
		$this->model_user_user_group->removePermission($user_group_id, 'modify',  'extension/module/separate_products');
		
		$this->model_user_user_group->removePermission($user_group_id, 'modify', 'catalog/product');
		$this->model_user_user_group->removePermission($user_group_id, 'modify', 'common/filemanager');
		$this->model_user_user_group->removePermission($user_group_id, 'modify', 'sale/order');
		
//Delete Separate Products - Internal Users	 - Only Products	
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."user_group WHERE name='Separate Products - Internal Users - Only Products' ");
		foreach ($query->rows as $result) {
			$user_group_id = $result['user_group_id'];
		}
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/attribute');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/attribute_group');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/category');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/download');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/filter');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/manufacturer');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/option');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/product');
		
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'common/filemanager');
		//$this->model_user_user_group->removePermission($user_group_id, 'access', 'sale/order');
		//$this->model_user_user_group->removePermission($user_group_id, 'access', 'extension/openbay');
		
		//modify
		$this->model_user_user_group->removePermission($user_group_id, 'modify',  'extension/module/separate_products');
		
		$this->model_user_user_group->removePermission($user_group_id, 'modify', 'catalog/product');
		$this->model_user_user_group->removePermission($user_group_id, 'modify', 'common/filemanager');
		//$this->model_user_user_group->removePermission($user_group_id, 'modify', 'sale/order');
		
//Delete Separate Products - Internal Users	 - Only Orders	
		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."user_group WHERE name='Separate Products - Internal Users - Only Orders' ");
		foreach ($query->rows as $result) {
			$user_group_id = $result['user_group_id'];
		}
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/attribute');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/attribute_group');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/category');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/download');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/filter');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/manufacturer');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/option');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'catalog/product');
		
		
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'user/user');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'sale/order');
		$this->model_user_user_group->removePermission($user_group_id, 'access', 'extension/openbay');
		
		//modify
		$this->model_user_user_group->removePermission($user_group_id, 'modify', 'sale/order');
		$this->model_user_user_group->removePermission($user_group_id, 'modify', 'localisation/order_status');
		
	
	
	} 
	
	public function delete() { 
        
		
		
    }
}