<script type="text/javascript">
	function listfaculty()
	{
		location.href = "faculty.php?type=list_faculty&lp=cu";
	}
</script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Add New faculty </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_faculty_form" action="" method="post" name="add_faculty_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >faculty Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="faculty_title" required="required" id="faculty_title" class="form-control col-md-7 col-xs-12"  />
                     
 
                      </div>
                    </div>
                    
                 
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="faculty_image" id="faculty_image" value="" class="form-control col-md-7 col-xs-12" required="required"/>
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image webp <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="faculty_image_webp" id="faculty_image_webp" value="" class="form-control col-md-7 col-xs-12" required="required"/>
                      </div>
                    </div>
                   
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Details
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('faculty_details') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($rc['faculty_details']);
			$oFCKeditor->Create() ;
		?>
		</div>
                </div>
                    </div>
                                    
                       
                     
                    
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_faculty" value="Save" onclick="return validate_form('add_faculty_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_event_cancel" value="Cancel" onclick="listfaculty();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>