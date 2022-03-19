<?php
$schedule_doc_id = $_REQUEST['schedule_doc_id'];
$sl = 'SELECT * FROM  tbl_schedule_doc WHERE schedule_doc_id = "'.$schedule_doc_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listschedule_doc()
	{
		location.href = "schedule_doc.php?type=list_schedule_doc&lp=cu";
	}
</script>

			<div class="x_panel">
                <div class="x_title">
                  <h2>Edit schedule Document </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_schedule_doc_form" action="" method="post" name="edit_schedule_doc_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Title 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="schedule_doc_title"  id="schedule_doc_title" class="form-control col-md-7 col-xs-12" value="<?php print $rc['schedule_doc_title']; ?>" />
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Report Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="date" name="report_date" required="required" id="report_date" class="form-control col-md-7 col-xs-12" value="<?php print $rc['report_date']; ?>" />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Short Description 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <textarea name="schedule_doc_desc"  id="schedule_doc_desc" class="form-control col-md-7 col-xs-12"><?php print $rc['schedule_doc_desc']; ?></textarea>
                      </div>
                    </div>
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > File
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<a href="post_img/<?php print $rc['schedule_doc_file']; ?>" target="_blank">Download</a>
 							<input type="file" name="schedule_doc_file" id="schedule_doc_file" value="" class="form-control col-md-7 col-xs-12"  />
 							
                      </div>
                    </div>
                    
                   
                       
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  		<input type="hidden" name="schedule_doc_id" value="<?php print $rc['schedule_doc_id']; ?>" />
                      	<input type="submit" name="edit_schedule_doc" value="Update" onclick="return validate_form('edit_schedule_doc_form');" class="btn btn-success btn-submit">
                      	<input type="button" name="add_schedule_doc_cancel" value="Cancel" onclick="listschedule_doc();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>