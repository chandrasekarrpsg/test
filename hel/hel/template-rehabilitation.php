<?php 
/* Template Name: Template - Rehabilitation */
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
$get_page_details_sql="select * from tbl_csr_details where row_id=1 and  page_id='".$page_id."'";
$get_page_details_rs=mysqli_query($conn,$get_page_details_sql);
$get_page_details_row=mysqli_fetch_array($get_page_details_rs);

?>
<div class="lifehoodsec1 lifehoopage lifeovertxt">
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
$get_page_details_sql="select * from tbl_csr_details where row_id=2 and  page_id='".$page_id."'";
$get_page_details_rs=mysqli_query($conn,$get_page_details_sql);
$get_page_details_row=mysqli_fetch_array($get_page_details_rs);

?>
<div class="lifehoodsec2 lifehoopage positnrleft">
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
$get_page_details_sql="select * from tbl_csr_details where row_id=3 and  page_id='".$page_id."'";
$get_page_details_rs=mysqli_query($conn,$get_page_details_sql);
$get_page_details_row=mysqli_fetch_array($get_page_details_rs);

?>

<div class="lifehoodsec1 lifehoopage lifethemsec">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_details_row['page_image'];?>)">
		<div class="container">
			<div id="blockres">
				<a id="video1"><img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['video_image'];?>" alt=""/><span class="arplay"><img src="<?= SITE_URL; ?>assets/images/play.png" alt=""/></span></a>
			</div>
			<div class="blockresthem">
				<div class="row">
					<?= $get_page_details_row['page_details'];?>
					
				</div>
			</div>
		</div>
	</div>
</div>
<?php
$get_page_details_sql="select * from tbl_csr_details where row_id=4 and  page_id='".$page_id."'";
$get_page_details_rs=mysqli_query($conn,$get_page_details_sql);
$get_page_details_row=mysqli_fetch_array($get_page_details_rs);

?>
<div class="lifehoodsec2 lifehoopage positnrright">
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
$get_page_details_sql="select * from tbl_csr_details where row_id=5 and  page_id='".$page_id."'";
$get_page_details_rs=mysqli_query($conn,$get_page_details_sql);
$get_page_details_row=mysqli_fetch_array($get_page_details_rs);

?>
<div class="lifehoodsec1 lifehoopage">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_details_row['page_image'];?>)">
		
	</div>
</div>
<div class="lifehoodsec2 lifehoopage positnrcenter nohight refertable">
	<div class="banitm">
		<div class="container">
			<div class="boxsa heading2">
				<?= $get_page_details_row['page_details'];?>
			</div>
		</div>
	</div>
</div>
<div id="vidBox" class="videomp4pop">
	
	<div class="videCont">
		<div id="closer_videopopup" onclick="pauseVid()">&times;</div>
	    <video id="v1" controls>
			<source src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['video_mp4'];?>" data-wf-ignore="true"/>
	    </video>
	</div>
</div>


<?php include "include/footer-inner.php"; ?>