<?php include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=16";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>
<div class="bannersec innerbanner">
	<div class="banitm">
		<div id="block1" data-autoplay="true" data-loop="true" data-wf-ignore="true" class="background-video w-background-video w-background-video-atom">
			<video autoplay="" loop="" style="" muted="" playsinline="" data-wf-ignore="true">
				<source src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>" data-wf-ignore="true"/>
			</video>
		</div>
		<div class="bantxt">
			<div class="container">
				<div class="txtb wow fadeInUp">
<?= $get_page_row['banner_heading'];?>
				</div>
			</div>
		</div>
	</div>
</div>



<div class="bio_sec climate">
	<div class="container containerpadng">
		<div class="bio_top">
<?= $get_page_row['content'];?>
		</div>
		<div class="biowaste_innr">
			<div class="biowaste_box">
<?= $get_page_row['add_cont1'];?>
			</div>
			<div class="biowaste_box">
<?= $get_page_row['add_cont2'];?>
			</div>
			<div class="biowaste_box">
<?= $get_page_row['add_cont3'];?>
			</div>
			<div class="biowaste_box">
<?= $get_page_row['add_cont4'];?>
			</div>
			<div class="biowaste_box">
<?= $get_page_row['add_cont5'];?>
			</div>
		</div>
		
	</div>
</div>
<?php include "include/footer-inner.php"; ?>