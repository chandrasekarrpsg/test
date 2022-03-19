<?php include "include/header.php"; ?>

<?php
$get_page_sql="select * from tbl_pagecontent where id=24";
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

<div class="aboutpage perfrmpg ocupationtop combatingcovid">
	<div class="container heading2 containerpadng">
		<div class="sustain_top aboutTpara">
			<div class="sustain_topInnr">
<?= $get_page_row['content'];?>
			
			</div>
		</div>
		<!-- <div class="aboutTpara bluepnalbox">
			<p>We have developed health and safety policies and have established OH&amp;S function that facilitates effective implementation of these policies and protocols. We have also implemented OHSAS 18001 as part of our integrated management system.</p>
			<div class="row">
				<div class="col-sm-6 picbox">
					<img src="assets/images/colrbox1.jpg" alt=""/>
				</div>
				<div class="col-sm-6 picbox text-right">
					<img src="assets/images/colrbox2.jpg" alt=""/>
				</div>
			</div>
		</div> -->
	</div>
</div>

<div class="sustain_sec combatingcovid">
	<div class="container containerpadng">
		<div class="sustain_top">
			<div class="sustain_topInnr tks">
<?= $get_page_row['add_cont1'];?>
				<div class="row">
					<div class="col-md-6">
<?= $get_page_row['add_cont2'];?>
					</div>
					<div class="col-md-6">
<a id="video1"><img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['video_image'];?>" alt=""/><span class="arplay">
	<img src="<?= SITE_URL; ?>assets/images/play.png" alt=""/></span></a>
					</div>
					<div id="vidBox" class="videomp4pop">
	<div id="closer_videopopup" onclick="pauseVid()">&times;</div>
	<div class="videCont">
	    <video id="v1" controls>
			<source src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['video_mp4'];?>" data-wf-ignore="true"/>
	    </video>
	</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>



<?php include "include/footer-inner.php"; ?>