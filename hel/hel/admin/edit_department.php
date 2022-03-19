<?php
$department_id = $_REQUEST['department_id'];
$sl = 'SELECT * FROM  tbl_department WHERE department_id = "'.$department_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listdepartment()
	{
		location.href = "department.php?type=list_department&lp=cu";
	}
</script>

			<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Department  </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_department_form" action="" method="post" name="edit_department_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Department Name<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="department_name" required="required" id="department_name" class="form-control col-md-7 col-xs-12" value="<?php print $rc['department_name']; ?>" />
                      </div>
                    </div>
                     
                    
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  		<input type="hidden" name="department_id" value="<?php print $rc['department_id']; ?>" />
                      	<input type="submit" name="edit_department" value="Update" onclick="return validate_form('edit_department_form');" class="btn btn-success btn-submit">
                      	<input type="button" name="add_department_cancel" value="Cancel" onclick="listdepartment();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>