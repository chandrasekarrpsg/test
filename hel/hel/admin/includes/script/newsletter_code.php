<?php 
$action1  = $_REQUEST['actnnewsletter'];
$ldhid1 = $_REQUEST['newsletter_id'];
if($action1 == 'dellnewsletter' && !empty($ldhid1)){
$DelcheSql1 = 'DELETE FROM tbl_newsletter WHERE newsletter_id = "'.$ldhid1.'"';
$DelcheQuery1 = g_db_query($DelcheSql1);
if($DelcheQuery1){
$testimonialmsg.= showMessage('The Newsletter Has Been Deleted','success');
}
}

if($action1 == 'enablenewsletter' && !empty($ldhid1)){
$DelcheSql1 = 'update ignore  tbl_newsletter set unsubscribe=0 WHERE newsletter_id = "'.$ldhid1.'"';
$DelcheQuery1 = g_db_query($DelcheSql1);
if($DelcheQuery1){
$testimonialmsg.= showMessage('The Newsletter Has Been Enabled','success');
}
}
?>
