<?php 
include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=18";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>
<div class="bannersec innerbanner">
	<div class="banitm">
		<div id="block1" data-autoplay="true" data-loop="true" data-wf-ignore="true" class="background-video w-background-video w-background-video-atom">
			<video autoplay="" loop="" style="" muted="" playsinline="" data-wf-ignore="true">
				<source src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>" data-wf-ignore="true"/>
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



<div class="bio_sec biodiversity environment">
	<div class="container containerpadng">
		<div class="environment_sec">
			<div class="row">
				<div class="col-sm-6 environment_img">
					<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['page_image'];?>" alt="" />
				</div>
				<div class="col-sm-6">
					<div class="environment_pic">
						<a id="video1"><img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['video_image'];?>" alt=""/><span class="arplay"><img src="<?= SITE_URL; ?>assets/images/play.png" alt=""/></span></a>
					</div>
				</div>
			</div>
		</div>
		<div id="vidBox" class="videomp4pop">
	
	<div class="videCont">
		<div id="closer_videopopup" onclick="pauseVid()">&times;</div>
	    <video id="v1" loop controls>
	        <!-- <source src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['video_webm'];?>" data-wf-ignore="true"/> -->
			<source src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['video_mp4'];?>" data-wf-ignore="true"/>
	    </video>
	</div>
</div>
		<div class="bio_top">
<?= $get_page_row['content'];?>
		</div>
		
		<div class="environment_innr">
			<div class="row">
				<?php
				$get_environmental_management_sql="select * from tbl_environmental_management order by environmental_management_id asc";
				$get_environmental_management_rs=mysqli_query($conn,$get_environmental_management_sql);
				while($get_environmental_management_row=mysqli_fetch_array($get_environmental_management_rs))
				{
				?>
				<div class="col-lg-4 col-md-6 col-sm-6 col-12">
					<div class="environment_box">
						<a href="<?= $get_environmental_management_row['environmental_management_link'];?>"><img src="<?= SITE_URL; ?>admin/post_img/<?= $get_environmental_management_row['environmental_management_image'];?>" alt="" /></a>
						<div class="environment_txt">
							<h4><a href="<?= $get_environmental_management_row['environmental_management_link'];?>"><?= $get_environmental_management_row['environmental_management_title'];?></a></h4>
							<p><?= $get_environmental_management_row['environmental_management_srt_desc'];?></p>
							<a href="<?= $get_environmental_management_row['environmental_management_link'];?>" class="lernbtn">Learn More</a>
						</div>
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