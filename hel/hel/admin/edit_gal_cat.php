<?php
$cid = $_REQUEST['cid'];
$sl = 'SELECT * FROM '.TABLE_PREFIX.'gallery_category WHERE gallery_category_id = "'.$cid.'"';
$q  = g_db_query($sl);
$rc = g_db_fetch_array($q);
?>

<script>
	function goto()
	{
		self.location = 'gallery.php?type=list_gal_cat&lp=ac';
	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Edit gallery category: </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                    <form id="edit_gal_cat_form" action="" method="post" name="edit_gal_cat_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	 	
               
                  
                  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Edit gallery category<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="edit_gallery_category" id="gallery_category" value="<?php print $rc['gallery_category_name']; ?>" class="form-control col-md-7 col-xs-12" required="required" />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
                        <img src="post_img/<?php print $rc['category_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

                            <input type="file" name="category_image" id="category_image" class="form-control col-md-7 col-xs-12" value=""   />
                          </div>
                        </div>
                    
                   
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
               <input type="hidden" name="edit_gallery_category_id" value="<?php print $rc['gallery_category_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_gal_cate" value="Update" onclick="return validate_form('edit_gal_cat_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="save_attr_cancel" value="Cancel" onclick="goto();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>