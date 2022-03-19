<?php
include("conn.php");
//include 'conn.php';
?>

 <?php
   $ban_id = $_REQUEST['banner_id'];
  
  	$value = $_REQUEST['value'];


	  
	$sql="update ignore tbl_banner set banner_order='".$value."' where banner_id ='".$ban_id."'";
	$run = mysqli_query($conn,$sql);
	
	if($run){
		echo "done";
	}else{
		echo "not done";
	}
			
?>