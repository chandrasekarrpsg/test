	<div class="owl-carousel owl-theme">
                  <?php 
                  
						$sup_sql="select * from tbl_supplier order by supplier_id desc";
						$sup_run=mysqli_query($conn,$sup_sql);
						while($sup_rows=mysqli_fetch_array($sup_run))
						{
							?>
				        <div class="item">
				    		<div class="logo_box">
								<a href="#"><img src="<?php echo SITE_URL; ?>admin/post_img/<?php echo $sup_rows['supplier_image']; ?>" alt="" /></a>
							</div>
				    	</div>
				    	<?php } ?>
				    	
			
				    </div> 