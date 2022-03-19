<?php

include_once('conn.php');
 $categoryid = $_REQUEST['q'];
//echo "select * from tbl_subcategory where `cat_id`='$categoryid'";
?>

                     <div class="col-md-6 col-sm-6 col-xs-12" id="subcat">
			         <select name="subsubcategory_id" class="form-control col-md-7 col-xs-12">
			          	<option value="">select</option>
			          	<?php $subcat_sql=mysqli_query($conn,"select * from tbl_subsubcategory where `sub_cat_id`=$categoryid");
						      while($subcat_row=mysqli_fetch_array($subcat_sql)){ ?>
								<option value="<?php echo $subcat_row['sub_sub_cat_id']; ?>"><?php echo $subcat_row['sub_sub_cat_name']; ?></option>
			             <?php } ?>
			        </select>
			          	
			         </div>