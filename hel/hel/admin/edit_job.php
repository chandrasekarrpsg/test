<?php
$job_id = $_REQUEST['job_id'];
$sl = 'SELECT * FROM  tbl_job WHERE job_id = "'.$job_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listjob()
	{
		location.href = "job.php?type=list_job&lp=cu";
	}
</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Job Post </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_job_form" action="" method="post" name="edit_job_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
              
                    
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Employement Type <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<select name="employment_type" class="form-control col-md-7 col-xs-12" required>
                      		<option value="">Select</option>
                      		<option value="Full Time"  <?php if($rc['employment_type']=='Full Time'){echo 'selected';}?>>Full Time</option>
                      		<option value="Part Time" <?php if($rc['employment_type']=='Part Time'){echo 'selected';}?>>Part Time</option>
                      		<option value="Permanent" <?php if($rc['employment_type']=='Permanent'){echo 'selected';}?>>Permanent</option>
                      		<option value="Temporary" <?php if($rc['employment_type']=='Temporary'){echo 'selected';}?>>Temporary</option>
                      	</select>
                        
                      </div>
                    </div> -->
                    
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="job_title" required="required" id="job_title" class="form-control col-md-7 col-xs-12" value="<?= $rc['job_title']; ?>" />
                      </div>
                    </div>
                    <!-- 
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Work Experience Needed 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="exp_required" id="exp_required" class="form-control col-md-7 col-xs-12"  value="<?= $rc['exp_required']; ?>" />
                      </div>
                    </div> -->
                    
                        <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Job Location
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="job_location" id="job_location" class="form-control col-md-7 col-xs-12" required ><?= $rc['job_location']; ?></textarea>
                      </div>
                    </div> -->
                     
                     
                      <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Job Level 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="job_level" id="job_level" class="form-control col-md-7 col-xs-12"   value="<?= $rc['job_level']; ?>" />
                      </div>
                    </div> -->
                     
                     <!-- 
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Job Function 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="job_function" id="job_function" class="form-control col-md-7 col-xs-12" value="<?= $rc['job_function']; ?>"  />
                      </div>
                    </div> -->
                    
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Job Industries
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="job_industry" id="job_industry" class="form-control col-md-7 col-xs-12" required ><?= $rc['job_industry']; ?></textarea>
                      </div>
                    </div> -->
                     
                   
                 
                    <!--  
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Job Introduction
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('job_intro') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			//$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($rc['job_intro']);
			$oFCKeditor->Create() ;
		?>
		</div></div>
	  </div> -->
                   
                   
                   <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Job Description
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('job_specification') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			//$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($rc['job_specification']);
			$oFCKeditor->Create() ;
		?>
		</div></div>
	  </div> -->
                   
                   
        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Job Post Status<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="radio" name="job_status" id="job_status" class="flat" value="1" required="required" <?php if($rc['job_status']==1){ echo "checked";}?>/>Enable
                        <input type="radio" name="job_status" id="job_status" class="flat" value="0" required="required" <?php if($rc['job_status']==0){ echo "checked";}?>/>Disable
                      </div>
                    </div>
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="job_id" value="<?php print $rc['job_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_job" value="Update" onclick="return validate_form('edit_job_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_job_cancel" value="Cancel" onclick="listjob();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>