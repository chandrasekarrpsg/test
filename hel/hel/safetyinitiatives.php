<?php 
include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=28";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>

<div class="bannersec innerbanner">
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


<div class="sustain_sec safetyprapage">
	<div class="container containerpadng">
		<div class="sustain_top">
			<div class="sustain_topInnr">
<?= $get_page_row['content'];?>
<div class="rowbox">
<div class="row">
<div class="col-sm-6 colm">
<?= $get_page_row['add_cont1'];?>
</div>
<div class="col-sm-6 colm">
<?= $get_page_row['add_cont2'];?>
</div>
<div class="col-sm-6 colm">
<?= $get_page_row['add_cont3'];?>
</div>
<div class="col-sm-6 colm">
<?= $get_page_row['add_cont4'];?>
</div>
</div>
</div>
			</div>
		</div>
		<div class="sustain_innr helthintrbotm widthauto">
			<div class="row justify-content">
				<div class="col-md-6 col-sm-6">
					<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['page_image'];?>" alt=""/>
				</div>
			</div>
		
		</div>
	</div>
</div>
<?php include "include/footer-inner.php"; ?>