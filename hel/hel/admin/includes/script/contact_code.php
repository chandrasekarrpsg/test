<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['edit_contacts']) && $_REQUEST['edit_contacts']=="Update"){
$edit_contact_sql1="update ignore tbl_contact set
	contact_phone='".mysqli_real_escape_string($conn,$_REQUEST['contact_phone'])."',
	contact_phone_inner='".mysqli_real_escape_string($conn,$_REQUEST['contact_phone_inner'])."',
	contact_phone2='".mysqli_real_escape_string($conn,$_REQUEST['contact_phone2'])."',
	contact_phone2_inner='".mysqli_real_escape_string($conn,$_REQUEST['contact_phone2_inner'])."',
	contact_phone3='".mysqli_real_escape_string($conn,$_REQUEST['contact_phone3'])."',
	contact_phone3_inner='".mysqli_real_escape_string($conn,$_REQUEST['contact_phone3_inner'])."',
	contact_phone4='".mysqli_real_escape_string($conn,$_REQUEST['contact_phone4'])."',
	contact_phone4_inner='".mysqli_real_escape_string($conn,$_REQUEST['contact_phone4_inner'])."',
	contact_email='".mysqli_real_escape_string($conn,$_REQUEST['contact_email'])."',
	contact_email2='".mysqli_real_escape_string($conn,$_REQUEST['contact_email2'])."',
	contact_address='".mysqli_real_escape_string($conn,$_REQUEST['contact_address'])."',
	contact_address2='".mysqli_real_escape_string($conn,$_REQUEST['contact_address2'])."',
	contact_address3='".mysqli_real_escape_string($conn,$_REQUEST['contact_address3'])."',
	contact_map='".mysqli_real_escape_string($conn,$_REQUEST['contact_map'])."',
	
	contact_person1='".mysqli_real_escape_string($conn,$_REQUEST['contact_person1'])."',
	contact_time1='".mysqli_real_escape_string($conn,$_REQUEST['contact_time1'])."',
	contact_time2='".mysqli_real_escape_string($conn,$_REQUEST['contact_time2'])."'
	
		
	        where contact_id =1";
			$edit_contact_exe1=mysqli_query($conn,$edit_contact_sql1)  or die(mysqli_error($conn));	
			
		
			
		

if($edit_contact_exe1){
$contactmsg.= showMessage("Contact has been updated successfully",'success');		
}
}

?>