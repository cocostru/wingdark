<?php
class ModelExtensionModuleTelegramNotification extends Model { 
        
        public function SendMessage($chat_id_array, $message) {
            $bot_id = $this->config->get('telegram_notification_botid');
            $telegram_url = "https://api.telegram.org/bot" . $bot_id . '/sendMessage';
            
            $mh = curl_multi_init();
            
            $ch = array();
            
            foreach ($chat_id_array as $chat_id) {
                $chat_id = trim($chat_id);
                $params = array(
                    'chat_id' => $chat_id,
                    'text' => $message,
                    'parse_mode' => 'Markdown'
                );
                $ch[$chat_id] = curl_init($telegram_url);
                curl_setopt($ch[$chat_id], CURLOPT_HEADER, false);
                curl_setopt($ch[$chat_id], CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($ch[$chat_id], CURLOPT_POST, 1);
                curl_setopt($ch[$chat_id], CURLOPT_POSTFIELDS, ($params));
                curl_setopt($ch[$chat_id], CURLOPT_SSL_VERIFYPEER, false);
                curl_multi_add_handle($mh, $ch[$chat_id]);
            }

            do {
                curl_multi_exec($mh, $running);
                curl_multi_select($mh);
            } while ($running > 0);

            foreach ($ch as $value) {
                if (curl_errno($value)) {
                    $this->log->write('telegram_notification module error: CURL: ' . curl_error($value));
                } elseif (curl_getinfo($value, CURLINFO_HTTP_CODE) != 200) {
                    $this->log->write('telegram_notification module error at SendMessage: CURL: HTTP CODE: ' . curl_getinfo($value, CURLINFO_HTTP_CODE));
                }
                curl_multi_remove_handle($mh, $value);
            }

            curl_multi_close($mh);
        }
}
