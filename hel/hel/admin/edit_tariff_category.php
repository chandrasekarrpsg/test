<?php
$tariffid = $_GET['tariffid'];
 $sl = "SELECT * FROM  tbl_tariff_category WHERE category_id='$tariffid'";
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listtariff_category()
	{
		location.href = "tariff_category.php?type=list_tariff_category";
	}
</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<div class="x_panel">
                <div class="x_title">
               <h2>Edit Tariff category</h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_tariff_category_form" action="" method="post" name="edit_tariff_category_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                  <!-- 	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select Company <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<select name="post_category" class="form-control col-md-7 col-xs-12">
                      		<option value="">Select</option>
                      		<option value="interviews" <?php if($rc['category_name']=='interviews'){ echo 'selected'; } ?>>Interviews</option>
                      		<option value="recipes" <?php if($rc['category_name']=='recipes'){ echo 'selected'; } ?>>Recipes</option>
                      		<option value="workout" <?php if($rc['category_name']=='workout'){ echo 'selected'; } ?>>Workout</option>
                      		<option value="music" <?php if($rc['category_name']=='music'){ echo 'selected'; } ?>>Music</option>
                      	</select>
                        
                      </div>
                    </div> -->
                    
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >category name <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="category_name" required="required" id="category_name" class="form-control col-md-7 col-xs-12" value="<?php print $rc['category_name'];?>" />
                     
 
                      </div>
                    </div>
                    
                    
                     
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Menu title<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <textarea name="category_title" required="required" id="category_title" class="form-control col-md-7 col-xs-12"><?php echo $rc['category_title'];?></textarea>
                      </div>
                    </div>
                    
                       
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="category_id" value="<?php print $rc['category_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="submitcategory" value="Update" onclick="return validate_form('edit_tariff_category_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_tariff_category" value="Cancel" onclick="listtariff_category();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>