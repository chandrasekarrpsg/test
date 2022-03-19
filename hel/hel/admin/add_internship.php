<script type="text/javascript">
	function listinternship()
	{
		location.href = "internship.php?type=list_internship&lp=cu";
	}
</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Add New Internship Post </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_internship_form" action="" method="post" name="add_internship_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Employement Type <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<select name="employment_type" class="form-control col-md-7 col-xs-12" required>
                      		<option value="">Select</option>
                      		<option value="Full Time">Full Time</option>
                      		<option value="Part Time">Part Time</option>
                      		<option value="Permanent">Permanent</option>
                      		<option value="Temporary">Temporary</option>
                      	</select>
                        
                      </div>
                    </div> -->
                    
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="internship_title" required="required" id="internship_title" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Work Experience Needed 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="exp_required" id="exp_required" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                     
                     
                          <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Internship Location
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="internship_location" id="internship_location" class="form-control col-md-7 col-xs-12" required></textarea>
                      </div>
                    </div> -->
                     
                      <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Internship Level 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="internship_level" id="internship_level" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                     
                     
                       <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Internship Function 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="internship_function" id="internship_function" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                     
                       <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Internship Industries
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="internship_industry" id="internship_industry" class="form-control col-md-7 col-xs-12" required ></textarea>
                      </div>
                    </div> -->
                     
                  
                 
                    
                   
                   <!-- 
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Internship Description
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('internship_specification') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			//$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= '';
			$oFCKeditor->Create() ;
		?>
		</div></div>
	  </div> -->
                   
                   
         <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Internship Post Status<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="radio" name="internship_status" id="internship_status" class="flat" value="1" required="required" checked="checked"/>Enable
                        <input type="radio" name="internship_status" id="internship_status" class="flat" value="0" required="required" />Disable
                      </div>
                    </div>
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_internship" value="Save" onclick="return validate_form('add_internship_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_internship_cancel" value="Cancel" onclick="listinternship();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>