<?php
$scid = $_REQUEST['scid'];
$sl = 'SELECT * FROM '.TABLE_PREFIX.'subcategory WHERE sub_cat_id = "'.$scid.'"';
$q  = g_db_query($sl);
$rc = g_db_fetch_array($q);
?>

<script>
	function goto()
	{
		self.location = 'subcategory.php?type=listsubcat&lp=ac';
	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Sub Category: </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                    <form id="edit_subcat_form" action="" method="post" name="edit_subcat_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	 	
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['banner_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="banner_image" id="banner_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> 
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select Category <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <select name="category_id" class="form-control col-md-7 col-xs-12">
                      		<option value="">Select</option>
                      		<?php 
                      	$cat_sql="select * from tbl_category";
                      		$cat_rs=mysqli_query($conn,$cat_sql);
                      		 while($cat_row=mysqli_fetch_array($cat_rs)){?> 
                      		 	<option value="<?php echo $cat_row['category_id']; ?>" <?php if($rc['cat_id']==$cat_row['category_id']){ echo 'selected'; } ?>><?php echo $cat_row['category_name']; ?></option>
                      		 	<?php } ?>
                      	</select>
                      </div>
                    </div>
                  
                  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Edit Sub Category<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="edit_category" id="category" value="<?php print $rc['sub_cat_name']; ?>" class="form-control col-md-7 col-xs-12" required="required" />
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['sub_cat_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Sub Category Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="category_image" id="category_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                   
                   
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['featured_cat_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                   
                   
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Featured Sub Category Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="featured_cat_image" id="featured_cat_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>  
                   
                   
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Featured sub category<span class="required">*</span>
                      	
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="radio" name="featured_subcat" id="featured_subcat" class="flat" value="1" <?php if( $rc['featured_subcat']==1){ echo "checked";}?> />Yes

  <input type="radio" name="featured_subcat" id="featured_subcat" class="flat" value="0" <?php if($rc['featured_subcat']==0){ echo "checked";}?> />No
                      </div>
                    </div>
                   
              <!--      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['menu_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                     -->
                  <!--   
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Menu Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="menu_image" id="menu_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> -->
                   
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
               <input type="hidden" name="edit_category_id" value="<?php print $rc['sub_cat_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_subcate" value="Save" onclick="return validate_form('edit_subcat_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="save_attr_cancel" value="Cancel" onclick="goto();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>