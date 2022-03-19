<?php 
include "include/header.php"; 
?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=4";
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

<div class="aboutpage perfrmpg">
	<div class="container heading2 containerpadng">
		<?php
		$get_tarrif_category_sql="select * from tbl_tariff_category order by category_id asc";
		$get_tarrif_category_rs=mysqli_query($conn,$get_tarrif_category_sql);
		while($get_tarrif_category_row=mysqli_fetch_array($get_tarrif_category_rs))
		{
		 ?>
		<div class="aboutTpara graybg margtop" id="tariff<?= $get_tarrif_category_row['category_id'];?>">
			<h4><strong><?= $get_tarrif_category_row['category_name']?></strong></h4>
			<div class="perfrthem">
				<?php
				$get_tarrif_sql="select * from tbl_tariff where category_id='".$get_tarrif_category_row['category_id']."'";
				$get_tarrif_rs=mysqli_query($conn,$get_tarrif_sql);
				while($get_tarrif_row=mysqli_fetch_array($get_tarrif_rs))
				{
					if($get_tarrif_row['tariff_file']!='')
					{
					$download_link=SITE_URL."admin/post_img/".$get_tarrif_row['tariff_file'];
					}
					else
					{
					$download_link="#url";	
					}
				?>
					<p><a href="<?= $download_link; ?>" target="_blank" ><?= $get_tarrif_row['tariff_title'];?></a> </p>
					<?php
					if($get_tarrif_row['tariff_short_desc']!='')
					{
					?>
					<p><?= $get_tarrif_row['tariff_short_desc'];?></p>
					<?php 
					}
					?>
				<?php
				}
				?>


			</div>
		</div>
		<?php
		}
		?>
		
		
		
		
	</div>
</div>



<?php include "include/footer-inner.php"; ?>