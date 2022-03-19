<script type="text/javascript">
	function listpost()
	{
		location.href = "post.php?type=list_post&lp=cu";
	}
</script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Add Event </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_post_form" action="" method="post" name="add_post_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                   <!--    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select Company <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<select name="post_category" class="form-control col-md-7 col-xs-12">
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
                        <input type="text" name="post_title" required="required" id="post_title" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="post_image" id="post_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image(webp)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="post_image_webp" id="post_image_webp" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> -->
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="date" name="post_date" id="post_date" required="required" id="post_date" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Short Description <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <textarea name="post_srt_desc" required="required" id="post_srt_desc" class="form-control col-md-7 col-xs-12"></textarea>
                      </div>
                    </div>
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Details
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('post_desc') ;
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
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Featured Post<span class="required">*</span>
                        
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="radio" name="show_home" id="show_home" class="flat" value="1" <?php if( $rc['show_home']==1){ echo "checked";}?> />Yes

  <input type="radio" name="show_home" id="show_home" class="flat" value="0" <?php if($rc['show_home']==0){ echo "checked";}?> />No
                      </div>
                    </div>      
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_post" value="Save" onclick="return validate_form('add_post_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_post_cancel" value="Cancel" onclick="listpost();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>