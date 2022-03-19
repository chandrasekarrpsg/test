<?php include "include/header.php"; ?>

<?php
$get_page_sql="select * from tbl_pagecontent where id=32";
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

<div class="aboutpage comingsoon gallerypagepage">
	<div class="container heading2">
		<div class="galdtl">
			<div class="row">
				<?php
				$get_gallery_cat_sql="select * from tbl_gallery_category order by gallery_category_id asc";
				$get_gallery_cat_rs=mysqli_query($conn,$get_gallery_cat_sql);
				while($get_gallery_cat_row=mysqli_fetch_array($get_gallery_cat_rs))
				{
				?>
				<div class="col">
					<div class="galbox">
						<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_gallery_cat_row['category_image'];?>" alt=""/>
						<div class="text">
							<strong><?= $get_gallery_cat_row['gallery_category_name'];?></strong>
						</div>
						<a href="<?= SITE_URL; ?>gallery-details.php?alise=<?= $get_gallery_cat_row['alise'];?>" class="overlink" ></a>
					</div>
				</div>
				<?php
				}
				?>
				
				
			</div>
		</div>
		
	</div>
</div>



<?php include "include/footer-inner.php"; ?>