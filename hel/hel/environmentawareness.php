<?php include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=35";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>







<div class="lifehoodsec1 lifehoopage bannersec innerbanner">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>)">
		<div class="bantxt">
			<div class="container">
				<div class="txtb wow fadeInUp">
<?= $get_page_row['banner_heading'];?>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="lifehoodsec2 lifehoopage">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['page_image'];?>)">
		<div class="container">
			<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['page_image'];?>" alt="" class="d-lg-none d-md-block d-sm-block d-block"/>
			<div class="boxsa heading2">
<?= $get_page_row['content'];?>
			</div>
		</div>
	</div>
</div>
<div class="lifehoodsec1 lifehoopage nouppercasec">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img1'];?>)">
		<div class="lifehootxt">
			<div class="container">
				<div class="row">
<?= $get_page_row['add_cont1'];?>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="lifehoodsec2 lifehoopage positnrleft">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img2'];?>)">
		<div class="container">
			<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img2'];?>" alt="" class="d-lg-none d-md-block d-sm-block d-block"/>
			<div class="boxsa heading2">
<?= $get_page_row['add_cont2'];?>
			</div>
		</div>
	</div>
</div>
<?php include "include/footer-inner.php"; ?>