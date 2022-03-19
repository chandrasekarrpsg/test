<?php include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=25";
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

<div class="aboutpage emploengpage learnspage">
	<div class="container heading2 containerpadng">
		<div class="aboutTpara">
			<?= $get_page_row['content'];?>
		</div>
		<div class="aboutTpara graybg">
		<?= $get_page_row['add_cont1'];?>
		</div>
		<div class="aboutTpara graybg">
		<?= $get_page_row['add_cont2'];?>
		</div>
		<div class="aboutTpara graybg">
		<?= $get_page_row['add_cont3'];?>
		</div>
		<div class="aboutTpara graybg">
		<?= $get_page_row['add_cont4'];?>
			</div>
		</div>
	</div>
</div>
<?php include "include/footer-inner.php"; ?>