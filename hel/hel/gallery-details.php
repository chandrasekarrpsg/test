<?php include "include/header.php"; ?>

<?php
$get_page_sql="select * from tbl_pagecontent where id=32";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>
<?php
 // echo $get_gallery_cat_sql="select * from tbl_gallery_category where alise='".$_REQUEST['alise']."'";
// $get_gallery_cat_rs=mysqli_query($conn,$get_gallery_cat_sql);
// $get_gallery_cat_row=mysqli_fetch_array($get_gallery_cat_rs);

$alise=mysqli_real_escape_string($conn,$_REQUEST['alise']);
$stmt = mysqli_stmt_init($conn);
$query="select gallery_category_id,gallery_category_name from tbl_gallery_category where alise=?";
mysqli_stmt_prepare($stmt, $query);
mysqli_stmt_bind_param($stmt, "s", $alise);
mysqli_stmt_execute($stmt);
mysqli_stmt_bind_result($stmt, $gallery_category_id,$gallery_category_name);
mysqli_stmt_fetch($stmt);
mysqli_stmt_close($stmt);


?>
<div class="bannersec innerbanner">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>)">
		<div class="bantxt">
			<div class="container">
				<div class="txtb wow fadeInUp">
					<strong><?= $gallery_category_name;?></strong>
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
				 $get_gallery_sql="select * from tbl_gallery where service_id='".$gallery_category_id."' order by gallery_id desc";
				$get_gallery_rs=mysqli_query($conn,$get_gallery_sql);
				$get_gallery_num=mysqli_num_rows($get_gallery_rs);
				if($get_gallery_num>0)
				{
				while($get_gallery_row=mysqli_fetch_array($get_gallery_rs))
				{
				?>
				<div class="col">
					<div class="galbox">
						<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_gallery_row['gallery_image'];?>" alt=""/>
						
						<a href="<?= SITE_URL; ?>admin/post_img/<?= $get_gallery_row['gallery_image'];?>" class="overlink" data-fancybox="images" data-width="1536" data-height="2304"></a>
						<figcaption>
			                <h6><?= $get_gallery_row['gallery_name'];?></h6>
			                <p><?= $get_gallery_row['gallery_srt_desc'];?></p>
			            </figcaption>
					</div>
				</div>
				<?php
				}
				}
				else
				{
					echo "<center>No data foud</center>";
				}
				?>
				
				
			</div>
		</div>
		
	</div>
</div>



<?php include "include/footer-inner.php"; ?>