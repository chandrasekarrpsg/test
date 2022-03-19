<?php 
include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=19";
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



<div class="sustain_sec">
	<div class="container containerpadng">
		<div class="sustain_top">
			<div class="sustain_topInnr">
				<!-- <span class="tagbox">Sustainability</span> -->
<?= $get_page_row['content'];?>
				<!-- <p><b>In this process, HEL shall strive to:</b></p>
				<p>Haldia Energy Limited is committed to generate and provide reliable power at competitive prices in a sustainable manner by optimising the use of multiple energy resource with innovative eco-friendly technologies & contributing to upliftment of the society and promoting a safe & healthy environment to its employees & people around.</p>
				<ul>
					<li>Contribute towards clean and sustainable environment with respect to land, water and air Conserve resources by reduction, reuse and recycling</li>
					<li>Initiate and support measures to optimise the use of renewable energy, increase energy efficiency and reduce Green House Gases emissions.</li>
					<li>Support the measures for biodiversity conservation by following the practices of protecting, conserving and restoring ecosystems.</li>
					<li>Be supportive in developing and enhancing people’s standard of living in and around the plants.</li>
					<li>Generate awareness, share knowledge and support training programmes on sustainable development among the employees, neighbouring communities and public at large</li>
					<li>Be transparent, ethical and fair to all stakeholders</li>
				</ul> -->
			</div>
		</div>
		
		<div class="sustain_innr">
			<div class="row">
				<?php
				$get_esg_sql="select * from tbl_esg order by esg_id asc";
				$get_esg_rs=mysqli_query($conn,$get_esg_sql);
				while($get_esg_row=mysqli_fetch_array($get_esg_rs))
				{
				?>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="sustain_box">
						<a href="<?= $get_esg_row['esg_link'];?>"><img src="<?= SITE_URL; ?>admin/post_img/<?= $get_esg_row['esg_image'];?>" alt="" /></a>
						<div class="sustain_boxTextinnr">
							<div class="sustain_boxText">
								<h5><a href="<?= $get_esg_row['esg_link'];?>"><?= $get_esg_row['esg_title'];?></a></h5>
								<p><?= $get_esg_row['esg_srt_desc'];?></p>
							</div>
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