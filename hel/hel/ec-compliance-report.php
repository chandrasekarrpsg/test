<?php include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=7";
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

<div class="carrerpagess corporFormspage ecreportspage">
	<div class="container">
		<div class="yearstabls">
		<?php
		$get_ec_compliance_sql="select * from tbl_ec_compliance order by year_start asc ";
			$get_ec_compliance_rs=mysqli_query($conn,$get_ec_compliance_sql);
			$get_ec_compliance_num=mysqli_num_rows($get_ec_compliance_rs);
			if($get_ec_compliance_num>10)
			{
		?>
		<div class="owl-carousel ">
			<?php
			
			$i=1;
			while($get_ec_compliance_row=mysqli_fetch_array($get_ec_compliance_rs))
			{
			?>
			<div class="item">
				<a href="#ytab<?= $i;?>"><?= $get_ec_compliance_row['year_start'];?>-<?= substr($get_ec_compliance_row['year_end'], -2);?></a>
			</div>	
			<?php
			$i++;
			}
			?>
			
		</div>
		<?php 
			}
			else
			{
			?>
			<ul class="clstab">
			<?php	
			$i=1;
			 $y=date('Y');
			while($get_ec_compliance_row=mysqli_fetch_array($get_ec_compliance_rs))
			{
			?>
			<li <?php if($get_ec_compliance_row['year_start']==$y || $get_ec_compliance_row['year_end']==$y ){?>class="current"<?php } ?>>
				<a href="#ytab<?= $i;?>"><?= $get_ec_compliance_row['year_start'];?>-<?= substr($get_ec_compliance_row['year_end'], -2);?></a>
			</li>	
			<?php
			$i++;
			}
			?>
			</ul>
			<?php
			}
		?>
		</div>
		<div class="ecreportscont">
			<?php
			$get_ec_compliance_sql="select * from tbl_ec_compliance order by year_start asc ";
			$get_ec_compliance_rs=mysqli_query($conn,$get_ec_compliance_sql);
			$i=1;
			 $y=date('Y');
			while($get_ec_compliance_row=mysqli_fetch_array($get_ec_compliance_rs))
			{
				
			?>
			<div class="ecrepyear" id="ytab<?= $i;?>" <?php if($get_ec_compliance_row['year_start']==$y || $get_ec_compliance_row['year_end']==$y ){?>style="display: block;"<?php } ?>>
				
				<div class="row">
					<!-- <div class="col-md-3 col-sm-12">
						<div class="tabeleftside" id="sidetab<?= $i;?>">
							<ul>
								<li class="currenta"><a href="#yearsub<?= $i;?>1">April <?= substr($get_ec_compliance_row['year_start'], -2);?> – September <?= substr($get_ec_compliance_row['year_start'], -2);?></a></li>
								<li><a href="#yearsub<?= $i;?>2">October<?= substr($get_ec_compliance_row['year_start'], -2);?> – March <?= substr($get_ec_compliance_row['year_end'], -2);?></a></li>
							</ul>
						</div>
						<script>
							$(document).ready(function() {
							    $("#sidetab<?= $i;?> a").click(function(event) {
							        event.preventDefault();
							        $(this).parent().addClass("currenta");
							        $(this).parent().siblings().removeClass("currenta");;
							        var tab = $(this).attr("href");
							        $(".tabertsub<?= $i;?>").not(tab).css("display", "none");
							        $(tab).fadeIn();
							    });
							});
						</script>
					</div> -->
					<div class="col-md-12 col-sm-12">
						<div class="tabertbody">
							<div class="tabertsub tabertsub<?= $i;?>" id="yearsub<?= $i;?>1" style="display: block">
								<ul>
									<li><a href="admin/post_img/<?= $get_ec_compliance_row['first_half_file'];?>" target="_blank"><?= $get_ec_compliance_row['first_half_title'];?></a></li>
									<li><a href="admin/post_img/<?= $get_ec_compliance_row['second_half_file'];?>" target="_blank"><?= $get_ec_compliance_row['second_half_title'];?></a></li>
									
									
								</ul>							
							</div>
							<!-- <div class="tabertsub tabertsub<?= $i;?>" id="yearsub<?= $i;?>2">
								<ul>
									<li><a href="admin/post_img/<?= $get_ec_compliance_row['second_half_file'];?>" target="_blank"><?= $get_ec_compliance_row['second_half_title'];?></a></li>
									
								</ul>		
							</div> -->
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

<?php include "include/footer-inner.php"; ?>