<?php 
include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=27";
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

<div class="aboutpage perfrmpg leadershippage">
	<div class="container heading2">
		<div class="aboutTpara zigzacgtop">
			<div class="perfrthem">
<?= $get_page_row['add_cont1'];?>
			</div>
		</div>
		<div class="aboutTpara zigzacgtop pull-right">
			<div class="perfrthem">
<?= $get_page_row['add_cont2'];?>
			</div>
		</div>
		<div class="aboutTpara">
			<div class="row">
				<div class="col-sm-5">
					<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['page_image'];?>" alt=""/>
				</div>
				<div class="col-sm-7">
<?= $get_page_row['content'];?>
					
				</div>
			</div>
		</div>
	</div>
</div>
<?php include "include/footer-inner.php"; ?>