<script type="text/javascript">
	function listtopper()
	{
		location.href = "topper.php?type=list_topper&lp=cu";
	}
</script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Add New topper </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_topper_form" action="" method="post" name="add_topper_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Topper Year <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="topper_title" required="required" id="topper_title" class="form-control col-md-7 col-xs-12"  />
                     
 
                      </div>
                    </div>
                    
                 
                   
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Year Details
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('topper_details') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($rc['topper_details']);
			$oFCKeditor->Create() ;
		?>
		</div>
                </div>
                    </div>
                                    
                       
                     
                    
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_topper" value="Save" onclick="return validate_form('add_topper_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_event_cancel" value="Cancel" onclick="listtopper();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>