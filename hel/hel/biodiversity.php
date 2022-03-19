<?php include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=34";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>
<div class="bannersec innerbanner">
	<div class="banitm">
		<div id="block1" data-autoplay="true" data-loop="true" data-wf-ignore="true" class="background-video w-background-video w-background-video-atom">
			<video autoplay="" loop="" style="" muted="" playsinline="" data-wf-ignore="true">
				<source src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>" data-wf-ignore="true"/>
				
				<!-- <source src="assets/video/Biodiversity-1.m4v" data-wf-ignore="true"/> -->
			</video>
		</div>
		<div class="bantxt">
			<div class="container">
				<div class="txtb wow fadeInUp">
<?= $get_page_row['banner_heading'];?>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="lifehoodsec2 lifehoopage positnrcenter nohight">
	<div class="banitm">
		<div class="container">
			<div class="boxsa heading2">
<?= $get_page_row['content'];?>

			</div>
		</div>
	</div>
</div>
<div class="lifehoodsec2 lifehoopage">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img1'];?>)">
		<div class="container">
			<img src="assets/images/biopicn1.jpg" alt="" class="d-lg-none d-md-block d-sm-block d-block"/>
			<div class="boxsa heading2">
<?= $get_page_row['add_cont1'];?>
			</div>
		</div>
	</div>
</div>
<div class="lifehoodsec1 lifehoopage">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['page_image'];?>)">
		
	</div>
</div>
<div class="lifehoodsec2 lifehoopage positnrleft">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img2'];?>)">
		<div class="container">
			<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img2'];?>" alt="" class="d-lg-none d-md-block d-sm-block d-block"/>
			<div class="boxsa heading2">
<?= $get_page_row['add_cont2'];?>
			</div>
		</div>
	</div>
</div>
<div class="lifehoodsec1 lifehoopage">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img3'];?>)">
		<div class="lifehootxt">
			<div class="container">
<?= $get_page_row['add_cont3'];?>
			</div>
		</div>
	</div>
</div>


<div class="lifehoodsec2 lifehoopage positnrleft">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img4'];?>)">
		<div class="container">
			<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img4'];?>" alt="" class="d-lg-none d-md-block d-sm-block d-block"/>
			<div class="boxsa heading2">
<?= $get_page_row['add_cont4'];?>
			</div>
		</div>
	</div>
</div>
<div class="lifehoodsec1 lifehoopage">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img5'];?>)">
		<div class="lifehootxt">
			<div class="container">
<?= $get_page_row['add_cont5'];?>
			</div>
		</div>
	</div>
</div>
<div class="lifehoodsec2 lifehoopage positnrleft">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img6'];?>)">
		<div class="container">
			<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img6'];?>" alt="" class="d-lg-none d-md-block d-sm-block d-block"/>
			<div class="boxsa heading2">
<?= $get_page_row['add_cont6'];?>
			</div>
		</div>
	</div>
</div>
<div class="lifehoodsec1 lifehoopage">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img7'];?>)">
		<div class="lifehootxt">
			<div class="container">
<?= $get_page_row['add_cont7'];?>
			</div>
		</div>
	</div>
</div>

<div class="lifehoodsec2 lifehoopage positnrleft">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img8'];?>)">
		<div class="container">
			<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img8'];?>" alt="" class="d-lg-none d-md-block d-sm-block d-block"/>
			<div class="boxsa heading2">
<?= $get_page_row['add_cont8'];?>
			</div>
		</div>
	</div>
</div>

<div class="lifehoodsec1 lifehoopage">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img9'];?>)">
		<div class="lifehootxt">
			<div class="container">
<?= $get_page_row['add_cont9'];?>
			</div>
		</div>
	</div>
</div>

<div class="lifehoodsec2 lifehoopage positnrleft">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img10'];?>)">
		<div class="container">
			<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['add_img10'];?>" alt="" class="d-lg-none d-md-block d-sm-block d-block"/>
			<div class="boxsa heading2">
<?= $get_page_row['add_cont10'];?>
			</div>
		</div>
	</div>
</div>

<?php include "include/footer-inner.php"; ?>