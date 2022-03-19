<?php include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=26";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>



<div class="bannersec innerbanner">
	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
<?php
$get_slider_sql="select * from tbl_banner order by banner_id asc";
$get_slider_rs=mysqli_query($conn,$get_slider_sql);
$i=0;
while($get_slider_row=mysqli_fetch_array($get_slider_rs))
{
?>	
		    <li data-target="#carouselExampleControls" data-slide-to="<?= $i;?>" <?php if($i==0){?>class="active"<?php } ?>></li>
<?php
$i++;
}
?>		    
		
		</ol>
		<div class="carousel-inner">
<?php
$get_slider_sql="select * from tbl_banner order by banner_id asc";
$get_slider_rs=mysqli_query($conn,$get_slider_sql);
$i=1;
while($get_slider_row=mysqli_fetch_array($get_slider_rs))
{
?>			
			<div class="carousel-item <?php if($i==1){?>active<?php } ?>">
				<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/slider/<?= $get_slider_row['banner_image'];?>)">
					<div class="bantxt">
						<div class="container">
							<div class="txtb wow fadeInUp">
<?= $get_slider_row['banner_desc'];?>
							</div>
						</div>
					</div>
				</div>
			</div>
<?php
$i++;
}
?>			
			
		</div>
	</div>
</div>

<div class="aboutpage perfrmpg csrpage1">
	<div class="container heading2 containerpadng">
		<div class="aboutTpara csrchat">
			<div class="row">
				<div class="col-md-6 text">
<?= $get_page_row['content'];?>
				</div>
				<div class="col-md-6 pic">
<?= $get_page_row['add_cont1'];?>
				</div>
			</div>
			
		</div>
	</div>
</div>
<div class="csrpage2">
	<div class="container heading2 containerpadng">
		<div class="aboutTpara">
			<a id="video1" class="videoright"><img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['video_image'];?>" alt=""/><span class="arplay"><img src="<?= SITE_URL; ?>assets/images/play.png" alt=""/></span></a>
<div id="vidBox" class="videomp4pop">
	
	<div class="videCont">
		<div id="closer_videopopup" onclick="pauseVid()">&times;</div>
	    <video id="v1" controls>
	        <source src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['video_mp4'];?>" data-wf-ignore="true"/>
	    </video>
	</div>
</div>

<?= $get_page_row['add_cont2'];?>
			
		</div>
	</div>
</div>

<div class="csrpage3">
	<div class="container containerpadng">
		<div class="csrpage3Inn">
<?= $get_page_row['add_cont3'];?>
		</div>
	</div>
</div>



<?php include "include/footer-inner.php"; ?>
