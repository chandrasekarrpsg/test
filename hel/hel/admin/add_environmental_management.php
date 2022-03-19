<script type="text/javascript">
	function listenvironmental_management()
	{
		location.href = "environmental_management.php?type=list_environmental_management&lp=cu";
	}
</script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Add Environmental Management </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_environmental_management_form" action="" method="post" name="add_environmental_management_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                   <!--    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select Company <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<select name="environmental_management_category" class="form-control col-md-7 col-xs-12">
                      		<option value="">Select</option>
                      		<option value="interviews">Interviews</option>
                      		<option value="recipes">Recipes</option>
                      		<option value="workout">Workout</option>
                      		<option value="music">Music</option>
                      	</select>
                        
                      </div>
                    </div> -->
                    
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="meta_title" required="required" id="meta_title" class="form-control col-md-7 col-xs-12"  />
                     
 
                      </div>
                    </div> -->
                    
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Keyword <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="meta_keyword" required="required" id="meta_keyword" class="form-control col-md-7 col-xs-12"  />
                     
 
                      </div>
                    </div> -->
                    
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Description <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                       <textarea name="meta_desc" id="meta_desc" class="form-control col-md-7 col-xs-12"></textarea>
                      </div>
                    </div> -->
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="environmental_management_title" required="required" id="environmental_management_title" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="environmental_management_image" id="environmental_management_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image(webp)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="environmental_management_image_webp" id="environmental_management_image_webp" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> -->
                    
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="date" name="environmental_management_date" id="environmental_management_date" required="required" id="environmental_management_date" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Short Description <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <textarea name="environmental_management_srt_desc" required="required" id="environmental_management_srt_desc" class="form-control col-md-7 col-xs-12"></textarea>
                      </div>
                    </div>
                    
                       <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Details
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('environmental_management_desc') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= '';
			$oFCKeditor->Create() ;
		?>
		</div></div>
	  </div> -->
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Link <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="environmental_management_link" required="required" id="environmental_management_link" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Featured <span class="required">*</span>
                        
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="radio" name="show_home" id="show_home" class="flat" value="1" <?php if( $rc['show_home']==1){ echo "checked";}?> />Yes

  <input type="radio" name="show_home" id="show_home" class="flat" value="0" <?php if($rc['show_home']==0){ echo "checked";}?> />No
                      </div>
                    </div>   -->    
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_environmental_management" value="Save" onclick="return validate_form('add_environmental_management_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_environmental_management_cancel" value="Cancel" onclick="listenvironmental_management();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>