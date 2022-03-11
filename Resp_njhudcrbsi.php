<?php

class PHP_AES_Cipher {
    private static $OPENSSL_CIPHER_NAME = "AES-128-CBC"; 
    private static $CIPHER_KEY_LEN = 16; 
   
    static function encrypt($key, $iv, $data) {
if (strlen($key) < PHP_AES_Cipher::$CIPHER_KEY_LEN) {
            $key = str_pad("$key", PHP_AES_Cipher::$CIPHER_KEY_LEN, "0"); //0 pad to len 16
        } else if (strlen($key) > PHP_AES_Cipher::$CIPHER_KEY_LEN) {
            $key = $key;
        }
       
$encodedEncryptedData = base64_encode(openssl_encrypt($data, PHP_AES_Cipher::$OPENSSL_CIPHER_NAME, $key, OPENSSL_RAW_DATA, $iv));
        $encryptedPayload = $encodedEncryptedData;

return $encryptedPayload;
       
    }
 
    static function decrypt($key, $iv, $data) {
        if (strlen($key) < PHP_AES_Cipher::$CIPHER_KEY_LEN) {
            $key = str_pad("$key", PHP_AES_Cipher::$CIPHER_KEY_LEN, "0"); //0 pad to len 16
        } else if (strlen($key) > PHP_AES_Cipher::$CIPHER_KEY_LEN) {
            $key = $key;
        }

$decryptedData = openssl_decrypt(base64_decode($data), PHP_AES_Cipher::$OPENSSL_CIPHER_NAME, $key, OPENSSL_RAW_DATA, $iv);
       
        return $decryptedData;
    }
}

$key = 'A7C9F96EEE0602A61F184F4F1B92F0W566B9E61D98059729EAD6A3229F882E81C3A';
$iv = substr($key, 0, 16);

$EncryptTrans = 'kiqUi1hvA7j4lrwXZG9sVTw++HgtxgWgPQmjbic7xLuAEX6SXhrcgUY7yTgi65sJgSFxUXuQxsbOvz5TZ19HIQbSkRDTKWcuA9ZcQL9XPxZg0pE7hJWqGLjK8cd33q45m2o0b3wtEkEBEfH0DqhDfPRmD9kgoVi8pzbGImbZ7GdwosQR7nTWUYJ7qvlzf8Wb';
$DecryptTrans  = PHP_AES_Cipher::decrypt($key, $iv, $_REQUEST['encData']);

echo "<br>";
echo "Encrypted value =".$_REQUEST['encData'];
echo "<br>";
echo "<br>";
echo "<br>";
echo "Decrypt=".$DecryptTrans;


?>