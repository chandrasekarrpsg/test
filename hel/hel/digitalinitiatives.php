<?php include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=20";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>


<div class="bannersec innerbanner">
	<div class="banitm">
		<div id="block1" data-video-urls="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image_webp'];?>,<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>" data-autoplay="true" data-loop="true" data-wf-ignore="true" class="background-video w-background-video w-background-video-atom">
			<video autoplay="" loop="" style="" muted="" playsinline="" data-wf-ignore="true">
				<source src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image_webp'];?>" data-wf-ignore="true"/>
				<source src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>" data-wf-ignore="true"/>
			</video>
		</div>
		<div class="bantxt text-left">
			<div class="container">
				<div class="txtb wow fadeInUp">
<?= $get_page_row['banner_heading'];?>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="aboutpage emploengpage digitalpage">
	<div class="container heading2">
		<div class="aboutTpara graybg ">
<?= $get_page_row['content'];?>
<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['page_image'];?>" alt="" class="w-100"/>
<?= $get_page_row['add_cont1'];?>
		</div>
		
	</div>
</div>
<?php include "include/footer-inner.php"; ?>