<?php include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=31";
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
<div class="lifehoodsec2 assetsec1 lifehoopage">
	<div class="banitm">
		<div class="container">
			<div class="apsupic"><img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['page_image'];?>" alt=""/></div>
			<div class="boxsa heading2">
<?= $get_page_row['content'];?>
			</div>
		</div>
	</div>
</div>


<?php
$get_asset_management_sql="select * from tbl_asset_management order by asset_management_id asc";
$get_asset_management_rs=mysqli_query($conn,$get_asset_management_sql);
while($get_asset_management_row=mysqli_fetch_array($get_asset_management_rs))
{

?>
<div class="lifehoodsec1 lifehoopage">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_asset_management_row['asset_management_image'];?>)">
		<div class="bantxt text-center">
			<div class="container">
				<div class="txtb wow fadeInUp">
					<strong><?= $get_asset_management_row['asset_management_title'];?></strong>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="lifehoodsec2 lifehoopage positnrcenter">
	<div class="banitm">
		<div class="container">
			<div class="boxsa heading2">
<?= $get_asset_management_row['asset_management_desc'];?>

			</div>
		</div>
	</div>
</div>
<?php
}
?>

<?php include "include/footer-inner.php"; ?>
