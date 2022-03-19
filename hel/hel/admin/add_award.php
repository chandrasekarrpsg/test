<script type="text/javascript">
	function listaward()
	{
		location.href = "award.php?type=list_award&lp=cu";
	}
</script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Add New Award</h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_award_form" action="" method="post" name="add_award_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Header Award Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="head_award_image" id="head_award_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Footer Award Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="foot_award_image" id="foot_award_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                <!--      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Award Name <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="award_name" required="required" id="award_name" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Award for <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="award_for" required="required" id="award_for" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Project name <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="project_name" required="required" id="project_name" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                     <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_award" value="Save" onclick="return validate_form('add_award_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_award_cancel" value="Cancel" onclick="listaward();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>
                </div>
              </div>