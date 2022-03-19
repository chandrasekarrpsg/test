<?php include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=21";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>




<div class="bannersec innerbanner">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>)">
		<div class="bantxt text-left clsbantxt">
			<div class="container">
				<div class="txtb wow fadeInUp ">
					<?= $get_page_row['banner_heading'];?>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="sustain_sec qualityasspage">
	<div class="container heading2">
		<div class="aboutTpara">
<?= $get_page_row['content'];?>
		</div>
		<div class="sustain_top aboutTpara">
			<div class="sustain_topInnr">
<?= $get_page_row['add_cont1'];?>
			</div>
		</div>
		<div class="sustain_top aboutTpara">
			<div class="sustain_topInnr">
<?= $get_page_row['add_cont2'];?>
				
			</div>
		</div>
	</div>
</div>
<?php include "include/footer-inner.php"; ?>