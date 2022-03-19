<script type="text/javascript">
	function listservice()
	{
		location.href = "service.php?type=list_service&lp=cu";
	}
</script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Add Service </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_service_form" action="" method="post" name="add_service_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                   <!--    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select Company <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<select name="service_category" class="form-control col-md-7 col-xs-12">
                      		<option value="">Select</option>
                      		<option value="interviews">Interviews</option>
                      		<option value="recipes">Recipes</option>
                      		<option value="workout">Workout</option>
                      		<option value="music">Music</option>
                      	</select>
                        
                      </div>
                    </div> -->
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="service_title" required="required" id="service_title" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="meta_title" required="required" id="meta_title" class="form-control col-md-7 col-xs-12"  />
                     
 
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Keyword <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="meta_keyword" required="required" id="meta_keyword" class="form-control col-md-7 col-xs-12"  />
                     
 
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Description <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                       <textarea name="meta_desc" id="meta_desc" class="form-control col-md-7 col-xs-12"></textarea>
                      </div>
                    </div>
                    
                   
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Service Icon 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="service_icon" id="service_icon" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Service Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="service_image" id="service_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Service Image(webp)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="service_image_webp" id="service_image_webp" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="service_date" id="datepicker" required="required" id="service_date" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Short Description <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <textarea name="service_srt_desc" required="required" id="service_srt_desc" class="form-control col-md-7 col-xs-12"></textarea>
                      </div>
                    </div>
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Details
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('service_desc') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= '';
			$oFCKeditor->Create() ;
		?>
		</div></div>
	  </div>
	  
	  
	  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Service Image2 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="service_image2" id="service_image2" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Service Image2(webp)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="service_image2_webp" id="service_image2_webp" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
	  
	  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Details2
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('service_desc2') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= '';
			$oFCKeditor->Create() ;
		?>
		</div></div>
	  </div>
                   
                <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Show in Home<span class="required">*</span>
                        
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="radio" name="show_home" id="show_home" class="flat" value="1" <?php if( $rc['show_home']==1){ echo "checked";}?> />Yes

  <input type="radio" name="show_home" id="show_home" class="flat" value="0" <?php if($rc['show_home']==0){ echo "checked";}?> />No
                      </div>
                    </div>  
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Featured Service<span class="required">*</span>
                        
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="radio" name="featured_service" id="featured_service" class="flat" value="1" <?php if( $rc['featured_service']==1){ echo "checked";}?> />Yes

  <input type="radio" name="featured_service" id="featured_service" class="flat" value="0" <?php if($rc['featured_service']==0){ echo "checked";}?> />No
                      </div>
                    </div>   
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Other State Service<span class="required">*</span>
                        
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="radio" name="other_state_service" id="other_state_service" class="flat" value="1" <?php if( $rc['other_state_service']==1){ echo "checked";}?> />Yes

  <input type="radio" name="other_state_service" id="other_state_service" class="flat" value="0" <?php if($rc['other_state_service']==0){ echo "checked";}?> />No
                      </div>
                    </div>   
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_service" value="Save" onclick="return validate_form('add_service_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_service_cancel" value="Cancel" onclick="listservice();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>