<script type="text/javascript">
	function listslider()
	{
		location.href = "slider.php?type=list_slider&lp=cu";
	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Add Slider </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_slider_form" action="" method="post" name="add_slider_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Image (JPG)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<input type="file" name="banner_image" id="banner_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Image (WEBP)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<input type="file" name="banner_logo" id="banner_logo" value="" class="form-control col-md-7 col-xs-12"  />
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
							$oFCKeditor->Value		= '';
								$oFCKeditor->Config['EnterMode'] = 'br';
							$oFCKeditor->Create() ;
						?>
						</div>
                		</div>
                    </div>    
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_slider" value="Save" onclick="return validate_form('add_slider_form');" class="btn btn-success btn-submit">
						<input type="button" name="add_slider_cancel" value="Cancel" onclick="listslider();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>