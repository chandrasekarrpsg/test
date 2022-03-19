<?php include 'includes/top.php'; ?>
<?php
 $del_option_sql="delete from tbl_acf_field where acf_field_id='".$_REQUEST['q']."'";
$del_option_rs=mysqli_query($conn,$del_option_sql);

 $del_option_sql="delete from tbl_page_meta where  	acf_field_id ='".$_REQUEST['q']."'";
$del_option_rs=mysqli_query($conn,$del_option_sql);

if($del_option_rs)
{
	echo "record deleted";
}
?> 