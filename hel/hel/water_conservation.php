<?php 
include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=10";
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

<div class="aboutpage waterconsepage">
	<div class="container heading2 containerpadng">
		<div class="aboutTpara">
<?= $get_page_row['content'];?>
		</div>
		<div class="aboutTpara">
			<div class="row justify-content">
				<!-- <div class="col-sm-6">
					<img src="assets/images/cahartpic1.jpg" alt=""/>
				</div> -->
				<div class="col-sm-6">
					<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['page_image'];?>" alt=""/>
				</div>
			</div>
		</div>
		<div class="aboutTpara">
<?= $get_page_row['add_cont1'];?>
		</div>
		<div class="aboutTpara">
			<div class="row">
				<!--<div class="col-sm-7">
					<img src="assets/images/cahartpic1.jpg" alt=""/>
				</div>-->
				<div class="col-sm-12">
<?= $get_page_row['add_cont2'];?>
				</div>
			</div>
		</div>
		<div class="aboutTpara">
			<!--<ul>
				<li>As green building initiative existing Administrative building has been converted to a GREEN BUILDING with 30% water saving</li>
.
<li>We have implemented rainwater harvesting also  in our plant to reduce the withdrawal of surface water. Rain water harvesting systems approved by Central ground Water Board has been installed in the plant to reserve monsoon water - present coverage area is 3000 sq.m and is being expanded to 6000 sq.m.</li>

<li>Water recirculation in bottom ash handling system.</li>

<li>ETP effluent parameters are continuously monitored for compliance to CPCB norms.</li>

<li>Sewage treatment is filtered for water recycling and re-use for cultivation approx. 1600 liters per day. </li>
			</ul>-->
<?= $get_page_row['add_cont3'];?>
			
			
		</div>
		
	</div>
</div>



<?php include "include/footer-inner.php"; ?>
