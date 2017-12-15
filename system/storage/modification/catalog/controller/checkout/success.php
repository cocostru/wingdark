<?php
class ControllerCheckoutSuccess extends Controller {
	public function index() {
		$this->load->language('checkout/success');

		if (isset($this->session->data['order_id'])) {
			$this->cart->clear();

			// Add to activity log
			if ($this->config->get('config_customer_activity')) {
				$this->load->model('account/activity');

				if ($this->customer->isLogged()) {
					$activity_data = array(
						'customer_id' => $this->customer->getId(),
						'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName(),
						'order_id'    => $this->session->data['order_id']
					);

					$this->model_account_activity->addActivity('order_account', $activity_data);
				} else {
					$activity_data = array(
						'name'     => $this->session->data['guest']['firstname'] . ' ' . $this->session->data['guest']['lastname'],
						'order_id' => $this->session->data['order_id']
					);

					$this->model_account_activity->addActivity('order_guest', $activity_data);
				}
			}


			$is_sendnotification = $this->config->get('telegram_notification_status');
			if($is_sendnotification == 1){
				$this->load->model('account/order');
				$products = $this->model_account_order->getOrderProducts($this->session->data['order_id']); 
				
				$order_chat_ids_string = $this->config->get('telegram_notification_orders_chat_ids');

				$orders_header_format = $this->config->get('telegram_notification_orders_message_header_format');
				$orders_item_format = $this->config->get('telegram_notification_orders_message_item_format');
				$orders_options_format = $this->config->get('telegram_notification_orders_message_options_format');
				
				if(strlen($order_chat_ids_string) > 0){
					$order_chat_ids_array = explode(",", $order_chat_ids_string);
					
					$guestcustomer_commands_to_replace = array(
						'#firstname'                => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), ($this->customer->isLogged()) ? $this->customer->getFirstName() : $this->session->data['guest']['firstname']),
						'#lastname'                 => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), ($this->customer->isLogged()) ? $this->customer->getLastName()  : $this->session->data['guest']['lastname']),
						'#email'                    => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), ($this->customer->isLogged()) ? $this->customer->getEmail()     : $this->session->data['guest']['email']),
						'#telephone'                => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), ($this->customer->isLogged()) ? $this->customer->getTelephone() : $this->session->data['guest']['telephone']),
						'#orderid'                  => $this->session->data['order_id'],
						'#paymentmethod'            => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), $this->session->data['payment_method']['title']),
						'#paymentaddressfirstname'  => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), $this->session->data['payment_address']['firstname']),
						'#paymentaddresslastname'   => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), $this->session->data['payment_address']['lastname']),
						'#paymentaddresscompany'    => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), $this->session->data['payment_address']['company']),
						'#paymentaddressaddress1'   => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), $this->session->data['payment_address']['address_1']),
						'#paymentaddressaddress2'   => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), $this->session->data['payment_address']['address_2']),
						'#paymentaddresspostcode'   => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), $this->session->data['payment_address']['postcode']),
						'#paymentaddresscity'       => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), $this->session->data['payment_address']['city']),
						'#paymentaddresscountry'    => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), $this->session->data['payment_address']['country']),
						'#paymentaddresszone'       => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), $this->session->data['payment_address']['zone']),
						'#shippingmethod'           => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), (isset($this->session->data['shipping_method']))  ? $this->session->data['shipping_method']['title']      : ''),
						'#shippingaddressfirstname' => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), (isset($this->session->data['shipping_address'])) ? $this->session->data['shipping_address']['firstname'] : ''),
						'#shippingaddresslastname'  => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), (isset($this->session->data['shipping_address'])) ? $this->session->data['shipping_address']['lastname']  : ''),
						'#shippingaddresscompany'   => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), (isset($this->session->data['shipping_address'])) ? $this->session->data['shipping_address']['company']   : ''),
						'#shippingaddressaddress1'  => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), (isset($this->session->data['shipping_address'])) ? $this->session->data['shipping_address']['address_1'] : ''),
						'#shippingaddressaddress2'  => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), (isset($this->session->data['shipping_address'])) ? $this->session->data['shipping_address']['address_2'] : ''),
						'#shippingaddresspostcode'  => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), (isset($this->session->data['shipping_address'])) ? $this->session->data['shipping_address']['postcode']  : ''),
						'#shippingaddresscity'      => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), (isset($this->session->data['shipping_address'])) ? $this->session->data['shipping_address']['city']      : ''),
						'#shippingaddresscountry'   => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), (isset($this->session->data['shipping_address'])) ? $this->session->data['shipping_address']['country']   : ''),
						'#shippingaddresszone'      => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), (isset($this->session->data['shipping_address'])) ? $this->session->data['shipping_address']['zone']      : ''),
						'$$'                        => PHP_EOL
					);
					
					$message = str_replace(array_keys($guestcustomer_commands_to_replace), array_values($guestcustomer_commands_to_replace), $orders_header_format) . PHP_EOL;   
					
					foreach ($products as $prod){
						$product_commands_to_replace = array(
							'#productid'       => $prod['product_id'],
							'#productname'     => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), $prod['name']),
							'#productmodel'    => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), $prod['model']),
							'#productquantity' => $prod['quantity'],
							'#productprice'    => (float)$prod['price'] + (float)$prod['tax'],
							'#producttotal'    => (float)$prod['total'] + (float)$prod['tax'] * (float)$prod['quantity'],
							'#producturl'      => $this->url->link('product/product', 'product_id=' . $prod['product_id']),
							'$$'               => PHP_EOL
						);
						
						$message .= str_replace(array_keys($product_commands_to_replace), array_values($product_commands_to_replace), $orders_item_format) . PHP_EOL; 
						
						$product_options = $this->model_account_order->getOrderOptions($prod['order_id'], $prod['order_product_id']); 
						foreach ($product_options as $option){
							$options_to_replace = array(
								'#optionname'  => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), $option['name']),
								'#optionvalue' => str_replace(array('*', '_', '`'), array('\*', '\_', '\`'), $option['value'])
							);
							$message .= str_replace(array_keys($options_to_replace), array_values($options_to_replace), $orders_options_format) . PHP_EOL; 
						}
					}
					
                                        $this->load->model("extension/module/telegram_notification");
                                        $this->model_extension_module_telegram_notification->SendMessage($order_chat_ids_array, $message);
				}
			}
			
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['guest']);
			unset($this->session->data['comment']);
			unset($this->session->data['order_id']);
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);
			unset($this->session->data['totals']);
		}

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_basket'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_checkout'),
			'href' => $this->url->link('checkout/checkout', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('checkout/success')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		if ($this->customer->isLogged()) {
			$data['text_message'] = sprintf($this->language->get('text_customer'), $this->url->link('account/account', '', true), $this->url->link('account/order', '', true), $this->url->link('account/download', '', true), $this->url->link('information/contact'));
		} else {
			$data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
		}

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/success', $data));
	}
}