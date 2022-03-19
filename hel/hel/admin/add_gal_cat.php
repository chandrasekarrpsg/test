<script>
	function goto()
	{
		self.location = 'gallery.php?type=list_gal_cat&lp=ac';
	}
</script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Add New gallery category : </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_gal_cat_form" action="" method="post" name="add_gal_cat_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                 	
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Enter gallery category <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="new_gallery_category" id="gallery_category" class="form-control col-md-7 col-xs-12" required="required" />
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
                      	
                      	<input type="submit" name="save_gal_cate" value="Save" onclick="return validate_form('add_gal_cat_form');" class="btn btn-success btn-submit">
		<input type="button" name="save_attr_cancel" value="Cancel" onclick="goto();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>