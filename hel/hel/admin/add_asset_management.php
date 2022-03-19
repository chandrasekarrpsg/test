<script type="text/javascript">
	function listasset_management()
	{
		location.href = "asset_management.php?type=list_asset_management&lp=cu";
	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Add Asset Management </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_asset_management_form" action="" method="post" name="add_asset_management_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	 <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Title
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<input type="text" name="asset_management_title" id="asset_management_title" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Asset Management Image (JPG)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<input type="file" name="asset_management_image" id="asset_management_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Asset Management Image (WEBP)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<input type="file" name="asset_management_logo" id="asset_management_logo" value="" class="form-control col-md-7 col-xs-12"  />
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
                      	
                      	<input type="submit" name="save_asset_management" value="Save" onclick="return validate_form('add_asset_management_form');" class="btn btn-success btn-submit">
						<input type="button" name="add_asset_management_cancel" value="Cancel" onclick="listasset_management();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>