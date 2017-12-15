<?php 
class ModelExtensionModuleAvail extends Model {

	public function getOptionsId($product_option_id, $product_option_value_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value WHERE product_option_id like " . $product_option_id . " and product_option_value_id = " . $product_option_value_id."");
		
		
		return $query->row;
	}
	public function getOptionsNames($option_id, $option_value_id, $product_option_value_id) {
		$query = $this->db->query("SELECT od.name, ovd.name as value_name, ". $product_option_value_id ." as product_option_value_id  FROM " . DB_PREFIX . "option_description od, " . DB_PREFIX . "option_value_description ovd WHERE od.option_id = " . $option_id . " and ovd.option_id = od.option_id and ovd.option_value_id in(" . $option_value_id . ")");
		
		return $query->row;
	}
	 public function addMail($data) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "avail SET email = '" .  $data['email'] . "', product = '" .  $data['product'] . "', logged_id = '" .  $data['logged_id'] . "', product_id = '" .  $data['product_id'] . "', price = '" .  $data['price'] . "', name = '" .  $data['name'] . "', comment = '" .  $data['comment'] . "', status = '" .  $data['status'] . "', admin_email = '" . $data['admin_email'] . "', link_page = '" . $data['href'] . "', language_id = '" . $data['language_id'] . "'");

    }
	public function getLastId() {
		$query = $this->db->query("SELECT max(id) FROM " . DB_PREFIX . "avail");
		
		return $query->row['max(id)'];
	}
	public function addOption($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "avail_options SET main_id ='" . $data['main_id'] . "', product_id = '" . $data['product_id'] . "', option_value_id = '" . $data['option_value_id'] . "', option_quantity = '" . $data['option_quantity'] . "', product_option_value_id = '" . $data['product_option_value_id'] . "', option_name = '" . $data['option_name'] . "', option_type = '" . $data['option_type'] . "'");
	}
	public function getProductId($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product WHERE product_id= ".$product_id."");
		
		return $query->row;
	}
	
}

?>