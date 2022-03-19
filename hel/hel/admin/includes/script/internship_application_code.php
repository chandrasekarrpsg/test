<?php
$page=(int)$_GET['page'];
$usrmsg='';


if(isset($_GET['action']) && ($_GET['action']=='deleteinternshipapplication')){
	$application_id=$_GET['application_id'];
	$sql_del1="DELETE from tbl_internship_application  WHERE application_id='".$application_id."'";
	$delRes=g_db_query($sql_del1);
	if($delRes){
		$internshipapplymsg.= showMessage("Internship Application has been Deleted.",'success');
	}else{
		$internshipapplymsg.= showMessage("An Error is occured.".'error');
	}
}

