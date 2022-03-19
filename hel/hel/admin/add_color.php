<script type="text/javascript">
	function listcolor()
	{
		location.href = "color.php?type=list_color&lp=cu";
	}
</script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Add New color </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_color_form" action="" method="post" name="add_color_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >color Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="color_title" required="required" id="color_title" class="form-control col-md-7 col-xs-12"  />
                     
 
                      </div>
                    </div>
                    
                 
                    <!-- 
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="color_image" id="color_image" value="" class="form-control col-md-7 col-xs-12" required="required"/>
                      </div>
                    </div> -->
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >color Code <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="color_code" required="required" id="color_link" class="form-control col-md-7 col-xs-12"  />
                     
 
                      </div>
                    </div>
                                    
                       
                     
                    
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_color" value="Save" onclick="return validate_form('add_color_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_event_cancel" value="Cancel" onclick="listcolor();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>