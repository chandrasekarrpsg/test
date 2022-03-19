<?php include "include/header.php"; ?>

<?php
$get_page_sql="select * from tbl_pagecontent where id=8";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>
<div class="bannersec innerbanner">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>)">
		<div class="bantxt text-left">
			<div class="container">
				<div class="txtb wow fadeInUp">
<?= $get_page_row['banner_heading'];?>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="aboutpage newspage">
	<div class="container heading2">
		<div class="aboutTpara">
			<?= $get_page_row['content'];?>
			<div class="row">
				<?php
				$get_post_sql="select * from  tbl_post order by show_home desc,post_date desc limit 0,3";
				$get_post_rs=mysqli_query($conn,$get_post_sql);
				$i=1;
				$lates_post_arr=array();
				while($get_post_row=mysqli_fetch_array($get_post_rs))
				{
					$lates_post_arr[]=$get_post_row['post_id'];
					
				?>
				<div class="col-lg-4 col-md-6 col-sm-6 col-12">
					<div class="environment_box">
						<a><img src="<?= SITE_URL; ?>admin/post_img/<?= $get_post_row['post_image'];?>" alt="" /></a>
						<div class="environment_txt">
							<h4><a><?= $get_post_row['post_title'];?></a></h4>
							<p><?= $get_post_row['post_srt_desc'];?></p>
							<?php
							if($get_post_row['post_desc']!='')
							{
							?>
							<div class="content" id="hideLive<?= $i;?>">
								<?= $get_post_row['post_desc'];?>
							</div>
							<a href="javascript:void(0)"  class="lernbtn" id="openLive<?= $i;?>">Read More</a>
							<script>
							$(document).ready(function(){
						    $('#openLive<?= $i;?>').click(function(){
						    $('#hideLive<?= $i;?>').slideToggle();
						    });
						    });
						</script>
							<?php
							}
							?>
						</div>
						
					</div>
				</div>
				<?php
				$i++;
				}
				?>
				
			</div>
		</div>
		
		<div class="aboutTpara">
		<?= $get_page_row['add_cont1'];?>
			<div class="owl-carousel newcarocel">
				<?php
				$lates_post_str=implode("','",$lates_post_arr);
				
				$get_post_sql="select * from  tbl_post where post_id not in('$lates_post_str')";
				$get_post_rs=mysqli_query($conn,$get_post_sql);
				$i=1;
				
				while($get_post_row=mysqli_fetch_array($get_post_rs))
				{
					
				?>
				<div class="item">
					<div class="environment_box">
						<a><img src="<?= SITE_URL; ?>admin/post_img/<?= $get_post_row['post_image'];?>" alt="" /></a>
						<div class="environment_txt">
							<h4><a><?= $get_post_row['post_title'];?></a></h4>
							<p><?= $get_post_row['post_srt_desc'];?></p>
							<?php
							if($get_post_row['post_desc']!='')
							{
							?>
							<div class="content" id="hideLive_arch<?= $i;?>">
								<?= $get_post_row['post_desc'];?>
							</div>
							<a href="javascript:void(0)"  class="lernbtn" id="openLive_arch<?= $i;?>">Read More</a>
							<script>
							$(document).ready(function(){
						    $('#openLive_arch<?= $i;?>').click(function(){
						    $('#hideLive_arch<?= $i;?>').slideToggle();
						    });
						    });
						</script>
							<?php
							}
							?>
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
