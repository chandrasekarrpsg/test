<?php include "include/header.php"; ?>

<?php
$get_page_sql="select * from tbl_pagecontent where id=15";
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

<div class="aboutpage solidpage">
	<div class="container heading2 containerpadng">
		<div class="aboutTpara graybg">
<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['page_image'];?>" alt="" class="float-left"/>
<?= $get_page_row['content'];?>
		</div>
		<div class="aboutTpara graybg">
<?= $get_page_row['add_cont1'];?>
		</div>
		<!--<div class="aboutTpara graybg">
			<img src="assets/images/solidpic3.jpg" alt="" class="float-left"/>
			<h3>Export</h3>
			<p>A large part of the HEL fly ash is conveyed from the Haldia plant through eco-friendly sealed bulkers to the Haldia Port for transportation through Namkhana-Hemnagar customs- Sekberia-Mangla- Narayangunj- Kurla route to a cluster of cement industries in Bangladesh. During a peak season, daily, on an average six barges with 850 tonnes capacity of fly ash each carries fly ash to Bangladesh from Haldia. On a peak day, Haldia Energygenerates 3500 tonnes of fly ash, a large part of which is currently being exported to Bangladesh for use in a cluster of cement plants.
</p>
		</div>
		<div class="aboutTpara text-center">
			<img src="assets/images/charts.jpg" alt="" />
		</div>-->
		<div class="aboutTpara graybg">
<?= $get_page_row['add_cont2'];?>
		</div>
	</div>
</div>
<?php include "include/footer-inner.php"; ?>