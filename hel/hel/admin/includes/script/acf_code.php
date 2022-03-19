<?php
if(isset($_REQUEST['save_acf']) && $_REQUEST['save_acf'] == 'Save'){
		
	 $add_acf_sql = "insert ignore into tbl_acf set
	           
	            acf_group_name     = '".mysqli_real_escape_string($conn,$_REQUEST['acf_group_name'])."'
	           
	            ";
	$add_acf_sql_exe = mysqli_query($conn,$add_acf_sql);
	$add_acf_data = mysqli_insert_id($conn);
	
	
	if($add_acf_data!=''){
		$cnt_field=count($_REQUEST['acf_field_name']);
	   	for($i=0;$i<$cnt_field;$i++) {
			   if($_REQUEST['acf_field_name'][$i] !=''){
			   	 $add_att_opt_sql = "insert ignore into  tbl_acf_field set
			   	 					acf_id   = '".$add_acf_data."',
			   	 					 acf_field_label          = '".$_REQUEST['acf_field_label'][$i]."',
			   	 					 acf_field_name           = '".remove_space($_REQUEST['acf_field_name'][$i])."',
			   	 					acf_field_type  	    = '".$_REQUEST['acf_field_type'][$i]."',
			   	 					acf_required           = '".$_REQUEST['acf_required'][$i]."'
			   	 					";
				$add_att_opt_sql_exe = mysqli_query($conn,$add_att_opt_sql);
			   }
		   }
		if(!empty($_REQUEST['acf_template']))
		{
			foreach($_REQUEST['acf_template'] as $value)
			{
					$add_att_opt_sql = "insert ignore into  tbl_acf_template set
				   	 					acf_id   = '".$add_acf_data."',
				   	 					  	acf_template           = '".$value."'
				   	 					";
					$add_att_opt_sql_exe = mysqli_query($conn,$add_att_opt_sql);
			}
		}
		
		
	}	
	

	if($add_acf_sql_exe){
		$acfmessage.= showMessage("acf has been added successfully",'success');
	}else{
	  	$acfmessage.= showMessage('Problem while saving data','error');
	}
}	


if(isset($_REQUEST['edit_acf']) && $_REQUEST['edit_acf'] == 'Update'){
	 $add_acf_sql = "update ignore  tbl_acf set
	           
	            acf_group_name     = '".mysqli_real_escape_string($conn,$_REQUEST['acf_group_name'])."'
	           
	               where acf_id ='".$_REQUEST['acf_id']."'
	            ";
	$add_acf_sql_exe = mysqli_query($conn,$add_acf_sql);
	
	
	
	if($_REQUEST['acf_id']!='')
	{
		 $cnt_field=count($_REQUEST['acf_field_name_edit']);
		if($cnt_field>0){
	   	for($i=0;$i<$cnt_field;$i++) {
			   if($_REQUEST['acf_field_name_edit'][$i] !=''){
			   	 $add_att_opt_sql = "update ignore tbl_acf_field set
			   	 					acf_id   = '".$_REQUEST['acf_id']."',
			   	 					 acf_field_label          = '".$_REQUEST['acf_field_label_edit'][$i]."',
			   	 					 acf_field_name           = '".remove_space($_REQUEST['acf_field_name_edit'][$i])."',
			   	 					acf_field_type  	    = '".$_REQUEST['acf_field_type_edit'][$i]."',
			   	 					acf_required           = '".$_REQUEST['acf_required_edit'][$i]."'
			   	 					where acf_field_id ='".$_REQUEST['acf_field_id'][$i]."'
			   	 					";
				$add_att_opt_sql_exe = mysqli_query($conn,$add_att_opt_sql);
				
				$update_page_meta_sql="update ignore tbl_page_meta 
				set meta_key='".remove_space($_REQUEST['acf_field_name_edit'][$i])."'  
				where acf_field_id='".$_REQUEST['acf_field_id'][$i]."' 	
				";
				$update_page_meta_rs=mysqli_query($conn,$update_page_meta_sql);
				
				
				
			   }
			   }
		   }
		  $cnt_field1=count($_REQUEST['acf_field_name']);
		if($cnt_field1>0)
		{
	   	for($i=0;$i<$cnt_field1;$i++) 
	   	{
			   if($_REQUEST['acf_field_name'][$i] !=''){
			   	 $add_att_opt_sql = "insert ignore into  tbl_acf_field set
			   	 					acf_id   = '".$_REQUEST['acf_id']."',
			   	 					 acf_field_label          = '".$_REQUEST['acf_field_label'][$i]."',
			   	 					 acf_field_name           = '".remove_space($_REQUEST['acf_field_name'][$i])."',
			   	 					acf_field_type  	    = '".$_REQUEST['acf_field_type'][$i]."',
			   	 					acf_required           = '".$_REQUEST['acf_required'][$i]."'
			   	 					";
				$add_att_opt_sql_exe = mysqli_query($conn,$add_att_opt_sql);
			   }
		   }
		}
		
		$delete_acf_sql="delete from tbl_acf_template where acf_id='".$_REQUEST['acf_id']."'";
		$delete_acf_row=mysqli_query($conn,$delete_acf_sql);
		if(!empty($_REQUEST['acf_template']))
		{
			
			
			foreach($_REQUEST['acf_template'] as $value)
			{
					$add_att_opt_sql = "insert ignore into  tbl_acf_template set
				   	 					acf_id   = '".$_REQUEST['acf_id']."',
				   	 					acf_template    = '".$value."'
				   	 					";
					$add_att_opt_sql_exe = mysqli_query($conn,$add_att_opt_sql);
			}
		}
		
		   
		   
	}	
	
	   if($add_acf_sql_exe){
		$acfmessage.= showMessage("acf has been updated successfully",'success');
	}else{
	  	$acfmessage.= showMessage('There is an item with same name.','error');
	}
	   
	   														
}	

$action  = $_REQUEST['actnacf'];	
$acf_id = $_REQUEST['acf_id'];		
if($action == 'delacf'){
	
$del_att_sql ="delete from tbl_acf where acf_id = '".$acf_id."'";	
$del_att_exe = mysqli_query($conn,$del_att_sql);	

$del_att_opt_sql = "delete from tbl_acf_field where acf_id = '".$acf_id."'";
$del_att_opt_exe = mysqli_query($conn,$del_att_opt_sql);

$del_att_opt_sql = "delete from tbl_acf_template where acf_id = '".$acf_id."'";
$del_att_opt_exe = mysqli_query($conn,$del_att_opt_sql);

$del_att_sql ="delete from tbl_page_meta where acf_id = '".$acf_id."'";	
$del_att_exe = mysqli_query($conn,$del_att_sql);

if($del_att_sql)
{
      $acfmessage.= showMessage("acf Has Been Deleted Successfuly",'success');
	}
	else
	{
      $acfmessage.= showMessage('Query Cannot Be Run','error');	
}
}
												
?>