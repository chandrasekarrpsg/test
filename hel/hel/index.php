<?php 
include "include/header.php"; ?>
<?php
$get_home_sql="select * from tbl_pagecontent where id=1";
$get_home_rs=mysqli_query($conn,$get_home_sql);
$get_home_row=mysqli_fetch_array($get_home_rs);

?>
<div class="bannersec inextban hovtexnone">
	<div class="banitm hmban" style="background: url(<?= SITE_URL; ?>assets/images/homeban.jpg) no-repeat center center">
		<iframe allowfullscreen="true" src="https://momento360.com/e/u/2e715a72ef13435f97114caa72c112a3?utm_campaign=embed&utm_source=other&heading=-77.04&pitch=-9.4&field-of-view=39&size=medium"></iframe> 
		<div class="bantxt">
			<div class="container">
				<div class="txtb wow fadeInUp">
<?= $get_home_row['banner_heading'];?>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="plansec heading2">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 leftcont wow fadeInUp">
<?= $get_home_row['feature_desc'];?>
				<a href="<?= $get_home_row['feature_link'];?>" class="morBtn">read more</a>
			</div>
			<div class="col-sm-6 rigtpic">
				<div class="pic1 wow fadeInUp">
					<picture>
						<source type="image/webp" srcset="<?= SITE_URL; ?>admin/post_img/<?= $get_home_row['feature_image_webp'];?>">
						<source type="image/png" srcset="<?= SITE_URL; ?>admin/post_img/<?= $get_home_row['feature_image'];?>">
						<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_home_row['feature_image'];?>" class="lazyload" data-src="<?= SITE_URL; ?>admin/post_img/<?= $get_home_row['feature_image'];?>" alt="">
					</picture>
				</div>
				<div class="pic2 wow fadeInUp">
					<img class="lazyload" data-src="<?= SITE_URL; ?>admin/post_img/<?= $get_home_row['feature_logo'];?>" alt=""/>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="sustensec heading2">
	<div class="container">
			<?= $get_home_row['add_cont1'];?>
	
		<div class="row">
			<?php
		$site_sql="select * from tbl_site_feature order by site_id asc";
		$site_run=mysqli_query($conn,$site_sql);
		$i=1;
		while($site_rows=mysqli_fetch_array($site_run)){
		?>
			<div class="col-md-4 col-sm-6">
				<div class="susthm wow fadeInUp"  data-wow-duration="1.2s">
					<a href="<?= $site_rows['site_value'];?>"><img src="<?= SITE_URL; ?>admin/post_img/<?= $site_rows['site_image'];?>" alt="" class="wow fadeInUp"  data-wow-duration="1.2s"/></a>
					<h4><a href="<?php echo $site_rows['site_value']?>"><?php echo $site_rows['site_title']?></a> </h4>
					<p><?php echo $site_rows['site_desc']?></p>
				</div>
			</div>
		 <?php $i++; } ?>				
			
			
			
			
			
		</div>
	</div>
</div>
<section class="visionsec">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-12 vidort wow fadeInUp">
				<a id="video1"><img src="<?= SITE_URL; ?>admin/post_img/<?= $get_home_row['video_image'];?>" alt=""/><span class="arplay"><img src="<?= SITE_URL; ?>assets/images/play.png" alt=""/></span></a>
			</div>
			<div id="vidBox" class="videomp4pop">
	
	<div class="videCont">
		<div id="closer_videopopup" onclick="pauseVid()">&times;</div>
	    <video id="v1" controls>
	        <!-- <source src="<?= SITE_URL; ?>admin/post_img/<?= $get_home_row['video_webm'];?>"/> -->
			<source src="<?= SITE_URL; ?>admin/post_img/<?= $get_home_row['video_mp4'];?>"/>
	    </video>
	</div>
</div>
			<div class="col-md-6 col-sm-12 heading2 wow fadeInUp">
<?= $get_home_row['content'];?>
			</div>
		</div>
	</div>
</section>
<div class="bluesec heading2 homeblusec">
	<div class="container">
	<?= $get_home_row['add_cont2'];?>
		<div class="row">
			<div class="col-sm-5 leftpic">
				<a href="<?= $get_home_row['feature_link1'];?>">
					<img class="lazyload" data-src="<?= SITE_URL; ?>admin/post_img/<?= $get_home_row['feature_image1'];?>" alt="">
				</a>
			</div>
			<div class="col-sm-7">
				<div class="rtblue">
					<div class="eg">
<?= $get_home_row['feature_desc1'];?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<?php include "include/footer.php"; ?>