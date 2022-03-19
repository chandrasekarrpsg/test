<?php 
/* Template Name: Template - Social Mobilization */
include "include/header.php"; ?>

<?php

$csr_id=mysqli_real_escape_string($conn,$_REQUEST['csr_id']);
$stmt = mysqli_stmt_init($conn);
$query="select id from tbl_csr_page where alise=?";
mysqli_stmt_prepare($stmt, $query);
mysqli_stmt_bind_param($stmt, "s", $csr_id);
mysqli_stmt_execute($stmt);
mysqli_stmt_bind_result($stmt, $page_id);
mysqli_stmt_fetch($stmt);
mysqli_stmt_close($stmt);

$get_page_sql="select * from tbl_csr_page where id='".$page_id."'";
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
<?php
$get_page_details_sql="select * from tbl_csr_details where   page_id='".$page_id."'";
$get_page_details_rs=mysqli_query($conn,$get_page_details_sql);
$ctr=1;
$even=1;
while($get_page_details_row=mysqli_fetch_array($get_page_details_rs))
{
	if($ctr%2!=0)
	{
?>
<div class="lifehoodsec1 lifehoopage">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_details_row['page_image'];?>)">
		
	</div>
</div>
	<?php
	}
	else
	{	
	?>

<div class="lifehoodsec2 lifehoopage <?php if($even%2!=0){?>positnrleft<?php } ?>">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_details_row['page_image'];?>)">
		<div class="container">
			<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_details_row['page_image'];?>" alt="" class="d-lg-none d-md-block d-sm-block d-block"/>
			<div class="boxsa heading2">
				<?= $get_page_details_row['page_details'];?>
				
			</div>
		</div>
	</div>
</div>
	<?php
	$even++;
	}
	?>
<?php
$ctr++;
}
?>
<?php include "include/footer-inner.php"; ?>
