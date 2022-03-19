<?php include 'includes/top.php'; ?>
 <?php
 $get_crs_page_sql="select * from tbl_csr_page where id='".$_REQUEST['q']."'";
 $get_crs_page_rs=mysqli_query($conn,$get_crs_page_sql);
 $get_crs_page_row=mysqli_fetch_array($get_crs_page_rs);
 
 
 $page_name_str=$get_crs_page_row['page_name'];
 $page_name_str=$page_name_str."_copy";
 $ser_alias = alias(strtolower($page_name_str));
 
 extract($get_crs_page_row);
 
 $insert_csr_page_sql="insert ignore into tbl_csr_page set 
 page_name='".$page_name_str."',
 alise='".$ser_alias."',
 acf_template='".$acf_template."',
 parent_page='".$parent_page."',
 meta_title='".$meta_title."',
 meta_keyword='".$meta_keyword."',
 meta_desc='".$meta_desc."',
 content='".$content."',
 page_image='".$page_image."',
 banner_image='".$banner_image."',
 banner_heading='".$banner_heading."',
 video_image='".$video_image."',
 video_mp4='".$video_mp4."',
 active=0
             
 ";
 $insert_csr_page_rs=mysqli_query($conn,$insert_csr_page_sql);
 $last_id=mysqli_insert_id($conn);
 
 
   $get_crs_page_details_sql="select * from tbl_csr_details where page_id='".$_REQUEST['q']."'";
 $get_crs_page_details_rs=mysqli_query($conn,$get_crs_page_details_sql);
 while($get_crs_page_details_row=mysqli_fetch_array($get_crs_page_details_rs))
 {
 	  $insert_csr_page_details_sql="insert ignore into tbl_csr_details set 
 page_id='".$last_id."',
 row_id='".$get_crs_page_details_row['row_id']."',
 page_heading='".$get_crs_page_details_row['page_heading']."',
 page_details='".$get_crs_page_details_row['page_details']."',
 page_image='".$get_crs_page_details_row['page_image']."'
             
 ";
 $insert_csr_page_details_rs=mysqli_query($conn,$insert_csr_page_details_sql);
 }
 
 if($insert_csr_page_rs)
 {
 	echo "Duplicate page created";
 }
 
 
?>  