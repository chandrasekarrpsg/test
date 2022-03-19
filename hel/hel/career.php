<?php include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=13";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>

<div class="bannersec innerbanner carrerban">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>)">
		<div class="bantxt text-right">
			<div class="container">
				<div class="txtb wow fadeInUp">
<?= $get_page_row['banner_heading'];?>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="aboutpage carrerpagess">
	<div class="container heading2">
		<div class="aboutTpara">
<?= $get_page_row['content'];?>
		</div>
		<div class="carthmbox">
			<div class="row">
				<div class="col-md-4 cartmBox">
<?= $get_page_row['add_cont1'];?>
				</div>
				<div class="col-md-4 cartmBox">
<?= $get_page_row['add_cont2'];?>
<div class="pic">
	
	<a id="video1"><img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['video_image'];?>" alt=""/><span class="arplay"><img src="<?= SITE_URL; ?>assets/images/play.png" alt=""/></span></a>
</div>
					
				</div>
				<div class="col-md-4 cartmBox">
<?= $get_page_row['add_cont3'];?>
				</div>
			</div>
		</div>
		
		
		
		<div class="aboutTpara">
<?= $get_page_row['add_cont4'];?>
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