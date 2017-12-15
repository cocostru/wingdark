<?php
class ModelExtensionModuleTelegramNotification extends Model { 
	
        public function GetLastMessageChatID($post_bot_id) {
		$bot_id = (strlen($post_bot_id) != 0) ? $post_bot_id : $this->config->get('telegram_notification_botid');
		$telegram_url = "https://api.telegram.org/bot" . $bot_id . '/getUpdates';
		$chatID = '';
		
		$ch = curl_init($telegram_url);
		curl_setopt($ch, CURLOPT_HEADER, false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		$result = curl_exec($ch);
		
		if (curl_errno($ch)) { 
			$this->log->write('telegram_notification module error at <model>: CURL: ' .  curl_error($ch));
		} else {
			$result = json_decode($result, true);
			// get chatID of the last message
			if (count($result['result']) > 0) {
				$chatID =  $result['result'][count($result['result'])-1]['message']['chat']['id'];
			} else {
				$this->log->write('telegram_notification module error at <model>: no inbox messages when getting chat_id via "last"');
			}
		}
		
		curl_close($ch);
		
		return $chatID;
	}
}
