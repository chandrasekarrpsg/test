<?php include "include/header.php"; ?>

<?php
$get_page_sql="select * from tbl_pagecontent where id=17";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>
<div class="bannersec innerbanner">
	<div class="banitm nohighban">
		<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>" alt=""/>
		<div class="bantxt text-left">
			<div class="container">
				<div class="txtb wow fadeInUp">
<?= $get_page_row['banner_heading'];?>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="aboutpage emploengpage awardpage">
	<div class="container heading2 containerpadng">
		<div class="aboutTpara">
<?= $get_page_row['content'];?>
		</div>
		<div class="row employgred">
			<?php
				$get_awards_sql="select * from  tbl_awards order by show_home desc,awards_id desc limit 0,3";
				$get_awards_rs=mysqli_query($conn,$get_awards_sql);
				$i=1;
				$lates_awards_arr=array();
				while($get_awards_row=mysqli_fetch_array($get_awards_rs))
				{
					$lates_awards_arr[]=$get_awards_row['awards_id'];
					
				?>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="employthm">
					<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_awards_row['awards_image'];?>" alt=""/>
					<div class="textpara">
						<strong><?= $get_awards_row['awards_title'];?></strong>
					</div>
				</div>
			</div>
			<?php
				$i++;
				}
				?>
			
			
			
		</div>
		
		
		<div class="aboutTpara">
			<div class="owl-carousel newcarocel">
				<?php
				$lates_awards_str=implode("','",$lates_awards_arr);
				
				$get_awards_sql="select * from  tbl_awards where awards_id not in('$lates_awards_str')";
				$get_awards_rs=mysqli_query($conn,$get_awards_sql);
				$i=1;
				
				while($get_awards_row=mysqli_fetch_array($get_awards_rs))
				{
					
				?>
				<div class="item">
					<div class="employthm">
						<img src="<?= SITE_URL; ?>admin/post_img/<?= $get_awards_row['awards_image'];?>" alt=""/>
						<div class="textpara">
							<strong><?= $get_awards_row['awards_title'];?></strong>
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
</div>

<?php include "include/footer-inner.php"; ?>