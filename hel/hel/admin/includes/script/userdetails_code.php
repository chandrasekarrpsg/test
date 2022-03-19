<?php
$page=(int)$_GET['page'];
$usrmsg1='';
if(isset($_REQUEST['save_user']) && $_REQUEST['save_user']=='Save'){
	
	
 $email=mysqli_real_escape_string($conn,trim($_REQUEST['email']));	
$password=mysqli_real_escape_string($conn,trim($_REQUEST['password']));	


$s2 = 'SELECT * FROM tbl_administrator WHERE adminname="'.$_REQUEST['adminname'].'"';
$q2  = g_db_query($s2);
$q2_num=mysqli_num_rows($q2);

if($q2_num>0)
{

	
$usrmsg1= showMessage("Login Id Already Registered.",'error');

}
else
{

	
 $pageUpdSql = "insert ignore into tbl_user_profile set
		name ='".mysqli_real_escape_string($conn,trim($_REQUEST['name']))."',  
		lname ='".mysqli_real_escape_string($conn,trim($_REQUEST['lname']))."',
		address ='".mysqli_real_escape_string($conn,trim($_REQUEST['address']))."',  
		email  ='".$email."',	
		password   ='".$password."',	
		phone='".mysqli_real_escape_string($conn,trim($_REQUEST['phone']))."',
		department='".mysqli_real_escape_string($conn,trim($_REQUEST['department']))."',
		u_active='".mysqli_real_escape_string($conn,trim($_REQUEST['status']))."'
		";
	
       $pageUpdExe = mysqli_query($conn,$pageUpdSql) or die(mysqli_error($conn));
       $last_id=mysqli_insert_id($conn); 
	  
	  
	   
	  $loginsql = "insert ignore into tbl_administrator set
						name ='".mysqli_real_escape_string($conn,trim($_REQUEST['name']))."', 
					 	adminname ='".mysqli_real_escape_string($conn,trim($_REQUEST['adminname']))."',  
					 	status ='".mysqli_real_escape_string($conn,trim($_REQUEST['status']))."', 
					 	 adminpassword ='".md5($password)."',
					 	 admin_email  ='".mysqli_real_escape_string($conn,trim($_REQUEST['email']))."',	
					 	 uid  ='".$last_id."',	
						type   ='".mysqli_real_escape_string($conn,trim($_REQUEST['department']))."'";
	
       $loginexe = mysqli_query($conn,$loginsql) or die(mysqli_error($conn));   
	   
if(isset($_REQUEST['role_id']))	
{   
foreach($_REQUEST['role_id'] as $role)
{
 $assignrolesql = "insert ignore into tbl_user_role set
						user_id ='".$last_id."', 
					 	role_id ='".$role."'
					 	";
	
  $assignroleexe = mysqli_query($conn,$assignrolesql) or die(mysqli_error($conn));   
	   
}
}	   
	   
	   
       
	   if($pageUpdExe){
	   	
		$usrmsg1= showMessage("user Added Successfully.",'success');
	   }
}

}



// /*----------------Make User Active/Inactivate-------------------------*/


if(isset($_REQUEST['edit_user']) && $_REQUEST['edit_user']=='Save'){
 $usr_id = $_REQUEST['uid'];
$password=mysqli_real_escape_string($conn,trim($_REQUEST['password']));	


$s2 = 'SELECT * FROM tbl_administrator WHERE adminname="'.$_REQUEST['adminname'].'" and  uid != "'.$_REQUEST['uid'].'" ';
$q2  = g_db_query($s2);
$q2_num=mysqli_num_rows($q2);

if($q2_num>0)
{

$usrmsg1= showMessage("Login Id Already Registered.",'error');
	
}
else
{
		
	 $act_inact_sql1="update ignore tbl_user_profile set 
		name ='".mysqli_real_escape_string($conn,trim($_REQUEST['name']))."',  
		lname ='".mysqli_real_escape_string($conn,trim($_REQUEST['lname']))."',
		address ='".mysqli_real_escape_string($conn,trim($_REQUEST['address']))."',  
		email  ='".mysqli_real_escape_string($conn,trim($_REQUEST['email']))."',	
		password   ='".$password."',	
		phone='".mysqli_real_escape_string($conn,trim($_REQUEST['phone']))."',
		department='".mysqli_real_escape_string($conn,trim($_REQUEST['department']))."',
		u_active='".mysqli_real_escape_string($conn,trim($_REQUEST['status']))."'

where uid='".$_REQUEST['uid']."'";
$act_inact_exe1=mysqli_query($conn,$act_inact_sql1) or die(mysqli_error($conn));


$loginsql = "update ignore tbl_administrator set
							name ='".mysqli_real_escape_string($conn,trim($_REQUEST['name']))."',
							adminname ='".mysqli_real_escape_string($conn,trim($_REQUEST['adminname']))."',  
					 		status ='".mysqli_real_escape_string($conn,trim($_REQUEST['status']))."', 
							type   ='".mysqli_real_escape_string($conn,trim($_REQUEST['department']))."',
					 		adminpassword ='".md5($password)."',
					 		admin_email  ='".mysqli_real_escape_string($conn,trim($_REQUEST['email']))."'	
					 	where uid='".$_REQUEST['uid']."'";
	
$loginexe = mysqli_query($conn,$loginsql) or die(mysqli_error($conn));   


$delete_role_sql="delete from tbl_user_role where user_id='".$_REQUEST['uid']."'";
$delete_role_rs=mysqli_query($conn,$delete_role_sql);

	   

foreach($_REQUEST['role_id'] as $role)
{
 $assignrolesql = "insert ignore into tbl_user_role set
						user_id ='".$_REQUEST['uid']."', 
					 	role_id ='".$role."'
					 	";
	
  $assignroleexe = mysqli_query($conn,$assignrolesql) or die(mysqli_error($conn));   
	   
}



	
if($act_inact_exe1) {
			
$usrmsg1.= showMessage("User is updated.",'success');
}else {
$usrmsg1.= showMessage("An Error is occured.",'error');
}
}

	
}


if(isset($_GET['action']) && ($_GET['action']=='delete')){
	$uusr_id=$_GET['usr_id'];
	$sql_del1="DELETE from tbl_user_profile  WHERE uid='".$uusr_id."'";
	$delRes=g_db_query($sql_del1);
	
	$sql_del1="DELETE from tbl_administrator  WHERE uid='".$uusr_id."'";
	$delRes=g_db_query($sql_del1);
	
	$delete_role_sql="delete from tbl_user_role where user_id='".$uusr_id."'";
	$delete_role_rs=mysqli_query($conn,$delete_role_sql);
	if($delRes){
		$usrmsg1.= showMessage("User Is Deleted.",'success');
	}else{
		$usrmsg1.= showMessage("An Error is occured.".'error');
	}
}

// /*----------------Make User Active/Inactivate-------------------------*/

if(isset($_GET['action']) && ($_GET['action']=='active'))
{
$usr_id=$_GET['usr_id'];
$act_inact_sql="update ignore tbl_user_profile set u_active='1' where uid='".$usr_id."'";

$act_inact_exe=mysqli_query($conn,$act_inact_sql);

$loginsql = "update ignore tbl_administrator set
					 		status ='1'
					 	 
					 	where uid='".$usr_id."'";
$loginexe = mysqli_query($conn,$loginsql) or die(mysqli_error($conn));  

if($act_inact_exe) {
$usrmsg1.= showMessage("User is enabled.",'success');
}else {
$usrmsg1.= showMessage("An Error is occured.",'error');
}

}
if(isset($_GET['action']) && ($_GET['action']=='deactive')){
$usr_id=$_GET['usr_id'];
$act_inact_sql1="update ignore tbl_user_profile set u_active='0' where uid='".$usr_id."'";
$act_inact_exe1=mysqli_query($conn,$act_inact_sql1);

$loginsql = "update ignore tbl_administrator set
					 		status ='0'
					 	 
					 	where uid='".$usr_id."'";
$loginexe = mysqli_query($conn,$loginsql) or die(mysqli_error($conn));  
	
if($act_inact_exe1) {
$usrmsg1.= showMessage("User is disabled.",'success');
}else {
$usrmsg1.= showMessage("An Error is occured.",'error');
}
	
}


