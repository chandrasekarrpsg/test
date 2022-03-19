<?php 
include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=37";
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

<div class="aboutpage comingsoon borddirpage">
	<div class="container heading2">
<?= $get_page_row['content'];?>
		<div class="borddecrtlist">
			<?php
				$get_team_sql="select * from tbl_team order by team_id asc";
				$get_team_rs=mysqli_query($conn,$get_team_sql);
				while($get_team_row=mysqli_fetch_array($get_team_rs))
				{
				?>
			<div class="row">
				<?php
				if($get_team_row['team_title']!='')
				{
				?>
				<div class="col-sm-4">
					<div class="dectorBox">
						<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_team_row['team_image'];?>" alt="" class="imageBOD"/>
						<div class="overlayImgDiv">
							<div class="bodOverlay"></div>
							<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_team_row['team_image2'];?>" alt="" class="bodImage"/>
						</div>
						<div class="text">
							<span><strong><?= $get_team_row['team_title'];?></strong><?= $get_team_row['team_desg'];?></span>
						</div>
					</div>
				</div>
				<?php
				}
				?>
				<?php 
				$get_team_row=mysqli_fetch_array($get_team_rs);
				if($get_team_row['team_title']!='')
				{
				?>
				<div class="col-sm-4">
					<div class="dectorBox">
						<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_team_row['team_image'];?>" alt="" class="imageBOD"/>
						<div class="overlayImgDiv">
							<div class="bodOverlay"></div>
							<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_team_row['team_image2'];?>" alt="" class="bodImage"/>
						</div>
						<div class="text">
							<span><strong><?= $get_team_row['team_title'];?></strong><?= $get_team_row['team_desg'];?></span>
						</div>
					</div>
				</div>
				<?php
				}
				?>
			</div>
			<?php
				}
				?>
			
		</div>
	</div>
</div>



<?php include "include/footer-inner.php"; ?>