<?php include 'includes/top.php'; ?>
 <?php
 $del_attr_val_sql="delete from  tbl_course_details where course_details_id='".$_REQUEST['q']."'";
$del_attr_val_rs=mysqli_query($conn,$del_attr_val_sql);


if($del_attr_val_rs)
{
	echo "record deleted";
}
?>  