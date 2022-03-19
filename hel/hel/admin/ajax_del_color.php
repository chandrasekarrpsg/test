<?php include 'conn.php'; ?>
<?php
$del_field_sql="delete from tbl_prod_col where 	pc_id='".$_REQUEST['q']."'";
$del_field_rs=mysqli_query($conn,$del_field_sql);

$del_field_sql1="delete from tbl_prod_img where prod_col_id='".$_REQUEST['q']."'";
$del_field_rs1=mysqli_query($conn,$del_field_sql1);

if($del_field_rs)
{
	echo "record deleted";
}
?>  
