<?php 
include_once('includes/top.php'); ?>
<?php
 $del_field_sql="delete from tbl_csr_details where id='".$_REQUEST['q']."'";
$del_field_rs=mysqli_query($conn,$del_field_sql);
if($del_field_rs)
{
	echo "record deleted";
}
?>  
