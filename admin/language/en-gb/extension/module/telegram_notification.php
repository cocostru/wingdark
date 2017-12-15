<?php
// Heading
$_['heading_title']				= 'Telegram Notification';

// Text
$_['text_module']				= 'Modules';
$_['text_success']				= 'Success: You have modified module Telegram Notification!';
$_['text_edit']					= 'Edit Telegram Notification module';
$_['text_about'] 				= 'Telegram Notification module allows you to receive Telegram message notifications for new orders & reviews.';
$_['text_disabled']				= 'Disabled';
$_['text_enabled']				= 'Enabled';
$_['text_default_order_message_header_format']	= 'New order *#orderid*! $$*Name*: #firstname #lastname$$*Phone*: #telephone$$*Email*: #email$$*Shipping*: #shippingmethod$$*Address*: #shippingaddressfirstname #shippingaddresslastname, #shippingaddressaddress1, #shippingaddresscity, #shippingaddresszone, #shippingaddresscountry';
$_['text_default_order_message_item_format']	= '  - *#productquantity* x [#productname/#productmodel](#producturl) = *#producttotal*';
$_['text_default_order_message_options_format']	= '    - #optionname: #optionvalue';
$_['text_default_review_message_format']	= 'New review! $$*Name*: #name$$*Rating*: #rating/5$$*Comment*: #text';
$_['text_default_contact_message_format']	= 'New question! $$*Name*: #name$$*Email*: #email$$*Question*: #text';
$_['button_save']				= 'Save';
$_['button_cancel']				= 'Cancel';

// Entry
$_['entry_botid']				= 'Telegram bot-id';
$_['entry_orders_chat_ids']			= 'Chat ID(s) for new orders notification';
$_['entry_orders_message_header_format']	= 'Orders message headers format';
$_['entry_orders_message_item_format']		= 'Orders message items format';
$_['entry_orders_message_options_format']	= 'Orders message options format';
$_['entry_reviews_chat_ids']			= 'Chat ID(s) for new reviews notification';
$_['entry_reviews_message_format']		= 'Reviews message format';
$_['entry_contact_chat_ids']			= 'Chat ID(s) for Contact Us notification';
$_['entry_contact_message_format']		= 'Contact Us message format';
$_['entry_status']				= 'Status';

// Error
$_['error_permission']				= 'Warning: You do not have permission to modify module Telegram Notification!';