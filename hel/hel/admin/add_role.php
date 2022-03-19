<script type="text/javascript">
	function listrole()
	{
		location.href = "role.php?type=list_role&lp=cu";
	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Add Role  </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_role_form" action="" method="post" name="add_role_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                    
                   
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Role Name<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="role_name" required="required" id="role_name" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                     
                     
                     
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_role" value="Save" onclick="return validate_form('add_role_form');" class="btn btn-success btn-submit">
						<input type="button" name="add_role_cancel" value="Cancel" onclick="listrole();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>