<?php
// Heading
$_['heading_title']				= 'Telegram Notification';

// Text
$_['text_module']				= 'Модули';
$_['text_success']				= 'Модуль Telegram Notification успешно отредактирован!';
$_['text_edit']					= 'Настройка модуля Telegram Notification';
$_['text_about'] 				= 'Модуль Telegram Notification позволяет получать уведомления в Telegram о новых заказах и отзывах';
$_['text_disabled']				= 'Отключено';
$_['text_enabled']				= 'Включено';
$_['text_default_order_message_header_format']	= 'Новый заказ *#orderid*! $$*Имя*: #firstname #lastname$$*Телефон*: #telephone$$*Email*: #email$$*Доставка*: #shippingmethod$$*Адрес доставки*: #shippingaddressfirstname #shippingaddresslastname, #shippingaddressaddress1, #shippingaddresscity, #shippingaddresszone, #shippingaddresscountry';
$_['text_default_order_message_item_format']	= '  - *#productquantity* x [#productname/#productmodel](#producturl) = *#producttotal*';
$_['text_default_order_message_options_format']	= '    - #optionname: #optionvalue';
$_['text_default_review_message_format']	= 'Новый отзыв!$$*Имя*: #name$$*Рейтинг*: #rating/5$$*Текст отзыва*: #text';
$_['text_default_contact_message_format']	= 'Новый вопрос! $$*Имя*: #name$$*Email*: #email$$*Вопрос*: #text';
$_['button_save']				= 'Сохранить';
$_['button_cancel']				= 'Отмена';

// Entry
$_['entry_botid']				= 'Идентификатор бота (bot-id)';
$_['entry_orders_chat_ids']			= 'Идентификатор(ы) чата (chat_id) для уведомления о заказах';
$_['entry_orders_message_header_format']	= 'Формат заголовка сообщения о новых заказах';
$_['entry_orders_message_item_format']		= 'Формат основы сообщения о новых заказах';
$_['entry_orders_message_options_format']	= 'Формат опций сообщения о новых заказах';
$_['entry_reviews_chat_ids']			= 'Идентификатор(ы) чата (chat_id) для уведомления об отзывах';
$_['entry_reviews_message_format']		= 'Формат сообщения об отзывах';
$_['entry_contact_chat_ids']			= 'Идентификатор(ы) чата (chat_id) для уведомления о сообщениях "Связаться с нами"';
$_['entry_contact_message_format']		= 'Формат сообщения "Связаться с нами"';
$_['entry_status']				= 'Статус';

// Error
$_['error_permission']				= 'Ошибка: у вас нет прав доступа для изменения модуля Telegram Notification!';