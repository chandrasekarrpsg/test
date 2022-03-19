<?php
$page=(int)$_GET['page'];
$usrmsg='';


if(isset($_GET['action']) && ($_GET['action']=='deletejobapplication')){
	$application_id=$_GET['application_id'];
	$sql_del1="DELETE from tbl_job_application  WHERE application_id='".$application_id."'";
	$delRes=g_db_query($sql_del1);
	if($delRes){
		$jobapplymsg.= showMessage("Job Application has been Deleted.",'success');
	}else{
		$jobapplymsg.= showMessage("An Error is occured.".'error');
	}
}

