<?php


class PHP_AES_Cipher {
    private static $OPENSSL_CIPHER_NAME = "AES-128-CBC"; //Name of OpenSSL Cipher
    private static $CIPHER_KEY_LEN = 16; //128 bits
   
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


//Hard coded parameters
$MerchantId=$_idr;
$OperatingMode=$_domt;
$MerchantCountry=$_incty;
$MerchantCurrency=$_incr;
$PostingAmount=$encrypt('amprt');
$OtherDetails=$encrypt('othdet_dr');
$AggregatorId=$_sgpmd;
$MerchantOrderNo=$_idprim; 
$MerchantCustomerID=$_custno; 
$Paymode=$nbt;
$Accesmedium =$onlp;
$TransactionSource =$_srcid;
$requestParameter=$MerTransrce";

$key = 'A7C9F96EEE0602A61F184F4F1B9FSN2F0566B9E61D9805RFK9729EAD3229F882E81C3AW';
$iv = substr($key, 0, 16);


$EncryptTrans  = PHP_AES_Cipher::encrypt($key, $iv, $requestParameter);

$DecryptTrans  = PHP_AES_Cipher::decrypt($key, $iv, $EncryptTrans);


?>
<form name="ecom" method="post" action="https://sbiepay.sbi/secure/AggrtedListener">
<input name="EncryptTrans" value="<?php echo $EncryptTrans;?>">
<input name="merchIdVal" value ="<?php echo $MerchantId;?>">
<input type="submit" name="submit" value="Pass">
</form>
