<?php include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=33";
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

<div class="aboutpage comingsoon contact_page">
	<div class="container containerpadng heading2">
		<div class="aboutToprw abouplantpage">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="contact_box">
						<h4>Registered Office :</h4>
							<p><?php
							echo nl2br($contact_rows['contact_address']);
							?><br>
						Email : <a href="mailto:<?= $contact_rows['contact_email'];?>"><?= $contact_rows['contact_email'];?></a></p>
					</div>
					<div class="contact_box">
						<h4>Site Office :</h4>
						<p><?php
							echo nl2br($contact_rows['contact_address2']);
							?><br>
						Email : <a href="mailto:<?= $contact_rows['contact_email2'];?>"><?= $contact_rows['contact_email2'];?></a></p>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="contact_map">
						<iframe src="<?= $contact_rows['contact_map'];?>" allowfullscreen="" id="map"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<?php include "include/footer-inner.php"; ?>