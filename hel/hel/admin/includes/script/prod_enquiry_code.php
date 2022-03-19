<?php
$action  = $_REQUEST['actnenq_id'];
$enq_id = $_REQUEST['enq_id'];
if($action == 'delenq_id' && !empty($enq_id)){
$DelenqSql = 'DELETE FROM tbl_product_enquiry WHERE enq_id  = "'.$enq_id.'"';
$DelenqQuery = g_db_query($DelenqSql);
if($DelenqQuery){
$enqmsg.= showMessage('The Product Enquiry Has Been Deleted','success');
}
}
?>