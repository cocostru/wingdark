<?php
class ModelExtensionModuleSimilarProducts extends Model {

	public function getSimilarProducts($product_id,$limit) {

		$this->load->model('catalog/product');

		$product_data = array();

		if($product_id){
			$category = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" .$product_id. "'");
			$category_id = $category->row['category_id'];

			$query = $this->db->query("SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_category p2c  ON (p.product_id = p2c.product_id) WHERE p2c.category_id = '" . (int)$category_id . "' AND p.status = '1' AND p.date_available <= NOW() AND p.product_id > '" .(int)$product_id. "' ORDER BY p.product_id ASC LIMIT " .(int)$limit);

			foreach ($query->rows as $result) {
				$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
			}

			if(count($query->rows) < $limit){
				$limit = $limit - count($query->rows);
				$sql = $this->db->query("SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_category p2c  ON (p.product_id = p2c.product_id) WHERE p2c.category_id = '" . (int)$category_id . "' AND p.status = '1' AND p.date_available <= NOW() AND p.product_id <> '" .(int)$product_id. "' ORDER BY p.product_id ASC LIMIT " .(int)$limit);

					foreach ($sql->rows as $result) {
						$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
					}
			}
		}
		return $product_data;
	}
}