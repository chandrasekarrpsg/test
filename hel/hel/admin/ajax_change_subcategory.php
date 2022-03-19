<?php

include_once('includes/top.php');
 $categoryid = $_REQUEST['q'];
//echo "select * from tbl_subcategory where `cat_id`='$categoryid'";
?>

			         <select name="subcategory_id" class="form-control col-md-7 col-xs-12">
			          	<option value="">select</option>
			          	<?php echo $subcat_sql="select * from tbl_subcategory where `cat_id`=$categoryid";
						       $subcat_run=mysqli_query($conn,$subcat_sql);
						      while($subcat_row=mysqli_fetch_array($subcat_run)){ ?>
								<option value="<?php echo $subcat_row['sub_cat_id']; ?>"><?php echo $subcat_row['sub_cat_name']; ?></option>
			             <?php } ?>
			        </select>
			          	
