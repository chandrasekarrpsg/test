<?php
$welfare_banner_id = $_REQUEST['welfare_banner_id'];
$sl = 'SELECT * FROM  tbl_welfare_banner WHERE welfare_banner_id = "'.$welfare_banner_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listwelfare_slider()
	{
		location.href = "welfare_slider.php?type=list_welfare_slider&lp=cu";
	}
</script>

			<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Slider </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_welfare_slider_form" action="" method="post" name="edit_welfare_slider_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Background Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<img src="welfare_slider/<?php print $rc['welfare_banner_bg_image'];?>" height="200" width="100%" />
    						<input type="file" name="welfare_banner_image" id="welfare_banner_image" class="form-control col-md-7 col-xs-12" value=""   />
 						</div>
                    </div> -->
                    
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Banner Image (JPG)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<img src="slider/<?php print $rc['welfare_banner_image'];?>" height="100" width="50%" />
    						<input type="file" name="welfare_banner_image" id="welfare_banner_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Banner Image (WEBP)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<img src="welfare_slider/<?php print $rc['welfare_banner_image_webp'];?>" height="100" width="50%" />
    						<input type="file" name="welfare_banner_logo" id="welfare_banner_logo" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> -->
                    
                    
                    <!--    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Image (Logo)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<img src="welfare_slider/<?php print $rc['welfare_banner_logo'];?>" height="100" width="50%" />
    						<input type="file" name="welfare_banner_logo" id="welfare_banner_logo" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                     -->
                    
                                 
                    
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="welfare_banner_title" id="welfare_banner_title" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['welfare_banner_title']));?>" required="required" />
                      </div>
                    </div> -->
                 
                      <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner sub  Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="welfare_banner_cont1" required="required"  value="<?php echo stripslashes(html_entity_decode($rc['welfare_banner_cont1']));?>" id="welfare_banner_cont1" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                    
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Link <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="welfare_banner_link" id="welfare_banner_link" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['welfare_banner_link']));?>" required="required" />
                      </div>
                    </div> -->
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner text
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
						<?php
							$oFCKeditor = new FCKeditor('welfare_banner_desc') ;
							$oFCKeditor->BasePath	= 'fckeditor/';
							$oFCKeditor->ToolbarSet = 'Basic';
							$oFCKeditor->Width 		= '660px';
							$oFCKeditor->Height 	= '500px';
							$oFCKeditor->Value		= htmlspecialchars_decode($rc['welfare_banner_desc']);
								$oFCKeditor->Config['EnterMode'] = 'br';
							$oFCKeditor->Create() ;
						?>
						</div>
                		</div>
                    </div>     
                   
                       
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  		<input type="hidden" name="welfare_banner_id" value="<?php print $rc['welfare_banner_id']; ?>" />
                      	<input type="submit" name="edit_welfare_slider" value="Update" onclick="return validate_form('edit_welfare_slider_form');" class="btn btn-success btn-submit">
                      	<input type="button" name="add_welfare_slider_cancel" value="Cancel" onclick="listwelfare_slider();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>