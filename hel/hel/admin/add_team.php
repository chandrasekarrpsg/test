<script type="text/javascript">
	function listteam()
	{
		location.href = "team.php?type=list_team&lp=cu";
	}
</script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Add New Board of Directors </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_team_form" action="" method="post" name="add_team_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Name <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="team_title" required="required" id="team_title" class="form-control col-md-7 col-xs-12"  />
                     
 
                      </div>
                    </div>
                    
                 
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="team_image" id="team_image" value="" class="form-control col-md-7 col-xs-12" required="required"/>
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image hover<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="team_image2" id="team_image2" value="" class="form-control col-md-7 col-xs-12" required="required"/>
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >team Designation <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                     
                      <input type="text" name="team_desg" value="" required="required" id="team_cat" class="form-control col-md-7 col-xs-12"  />
                     
                       
 
                      </div>
                    </div>
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >team Link <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="team_link" required="required" id="team_link" class="form-control col-md-7 col-xs-12"  />
                     
 
                      </div>
                    </div> -->
                                    
                       <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >team Link2 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="team_link2" required="required" id="team_link2" class="form-control col-md-7 col-xs-12"  />
                     
 
                      </div>
                    </div> -->
                     
                    
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_team" value="Save" onclick="return validate_form('add_team_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_event_cancel" value="Cancel" onclick="listteam();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>