<?php
$asset_management_id = $_REQUEST['asset_management_id'];
$sl = 'SELECT * FROM  tbl_asset_management WHERE asset_management_id = "'.$asset_management_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listasset_management()
	{
		location.href = "asset_management.php?type=list_asset_management&lp=cu";
	}
</script>

			<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Asset Management </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_asset_management_form" action="" method="post" name="edit_asset_management_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Title
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<input type="text" name="asset_management_title" id="asset_management_title" value="<?php print $rc['asset_management_title'];?>" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Asset Management Image (JPG)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<img src="post_img/<?php print $rc['asset_management_image'];?>" height="100" width="50%" />
    						<input type="file" name="asset_management_image" id="asset_management_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Asset Management Image (WEBP)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<img src="asset_management/<?php print $rc['asset_management_image_webp'];?>" height="100" width="50%" />
    						<input type="file" name="asset_management_logo" id="asset_management_logo" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> -->
                    
                    
                    <!--    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Asset Management Image (Logo)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<img src="asset_management/<?php print $rc['asset_management_logo'];?>" height="100" width="50%" />
    						<input type="file" name="asset_management_logo" id="asset_management_logo" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                     -->
                    
                                 
                    
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Asset Management Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="asset_management_title" id="asset_management_title" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['asset_management_title']));?>" required="required" />
                      </div>
                    </div> -->
                 
                      <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Asset Management sub  Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="asset_management_cont1" required="required"  value="<?php echo stripslashes(html_entity_decode($rc['asset_management_cont1']));?>" id="asset_management_cont1" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                    
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Asset Management Link <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="asset_management_link" id="asset_management_link" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['asset_management_link']));?>" required="required" />
                      </div>
                    </div> -->
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Asset Management text
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
						<?php
							$oFCKeditor = new FCKeditor('asset_management_desc') ;
							$oFCKeditor->BasePath	= 'fckeditor/';
							$oFCKeditor->ToolbarSet = 'Basic';
							$oFCKeditor->Width 		= '660px';
							$oFCKeditor->Height 	= '500px';
							$oFCKeditor->Value		= htmlspecialchars_decode($rc['asset_management_desc']);
								$oFCKeditor->Config['EnterMode'] = 'br';
							$oFCKeditor->Create() ;
						?>
						</div>
                		</div>
                    </div>     
                   
                       
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  		<input type="hidden" name="asset_management_id" value="<?php print $rc['asset_management_id']; ?>" />
                      	<input type="submit" name="edit_asset_management" value="Update" onclick="return validate_form('edit_asset_management_form');" class="btn btn-success btn-submit">
                      	<input type="button" name="add_asset_management_cancel" value="Cancel" onclick="listasset_management();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>