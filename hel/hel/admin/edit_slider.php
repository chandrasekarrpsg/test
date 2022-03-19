<?php
$banner_id = $_REQUEST['banner_id'];
$sl = 'SELECT * FROM  tbl_banner WHERE banner_id = "'.$banner_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listslider()
	{
		location.href = "slider.php?type=list_slider&lp=cu";
	}
</script>

			<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Slider </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_slider_form" action="" method="post" name="edit_slider_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Background Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<img src="slider/<?php print $rc['banner_bg_image'];?>" height="200" width="100%" />
    						<input type="file" name="banner_image" id="banner_image" class="form-control col-md-7 col-xs-12" value=""   />
 						</div>
                    </div> -->
                    
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Banner Image (JPG)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<img src="slider/<?php print $rc['banner_image'];?>" height="100" width="50%" />
    						<input type="file" name="banner_image" id="banner_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Banner Image (WEBP)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<img src="slider/<?php print $rc['banner_image_webp'];?>" height="100" width="50%" />
    						<input type="file" name="banner_logo" id="banner_logo" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> -->
                    
                    
                    <!--    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Image (Logo)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<img src="slider/<?php print $rc['banner_logo'];?>" height="100" width="50%" />
    						<input type="file" name="banner_logo" id="banner_logo" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                     -->
                    
                                 
                    
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="banner_title" id="banner_title" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['banner_title']));?>" required="required" />
                      </div>
                    </div> -->
                 
                      <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner sub  Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="banner_cont1" required="required"  value="<?php echo stripslashes(html_entity_decode($rc['banner_cont1']));?>" id="banner_cont1" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                    
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Link <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="banner_link" id="banner_link" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['banner_link']));?>" required="required" />
                      </div>
                    </div> -->
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner text
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
						<?php
							$oFCKeditor = new FCKeditor('banner_desc') ;
							$oFCKeditor->BasePath	= 'fckeditor/';
							$oFCKeditor->ToolbarSet = 'Basic';
							$oFCKeditor->Width 		= '660px';
							$oFCKeditor->Height 	= '500px';
							$oFCKeditor->Value		= htmlspecialchars_decode($rc['banner_desc']);
								$oFCKeditor->Config['EnterMode'] = 'br';
							$oFCKeditor->Create() ;
						?>
						</div>
                		</div>
                    </div>     
                   
                       
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  		<input type="hidden" name="banner_id" value="<?php print $rc['banner_id']; ?>" />
                      	<input type="submit" name="edit_slider" value="Update" onclick="return validate_form('edit_slider_form');" class="btn btn-success btn-submit">
                      	<input type="button" name="add_slider_cancel" value="Cancel" onclick="listslider();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>