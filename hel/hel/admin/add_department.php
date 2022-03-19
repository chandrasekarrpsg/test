<script type="text/javascript">
	function listdepartment()
	{
		location.href = "department.php?type=list_department&lp=cu";
	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Add Department  </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_department_form" action="" method="post" name="add_department_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                    
                   
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Department Name<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="department_name" required="required" id="department_name" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                     
                     
                     
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_department" value="Save" onclick="return validate_form('add_department_form');" class="btn btn-success btn-submit">
						<input type="button" name="add_department_cancel" value="Cancel" onclick="listdepartment();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>