<?php include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=30";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>



<div class="bannersec innerbanner">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>)">
		<div class="bantxt text-left">
			<div class="container">
				<div class="txtb wow fadeInUp">
<?= $get_page_row['banner_heading'];?>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="aboutpage emploengpage accuphrelyhpage">
	<div class="container heading2">
		<div class="aboutTpara">
<?= $get_page_row['content'];?>
		</div>
		
	</div>
</div>

<?php include "include/footer-inner.php"; ?>