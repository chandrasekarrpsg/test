<script type="text/javascript">
	function listec_compliance()
	{
		location.href = "ec_compliance.php?type=list_ec_compliance&lp=cu";
	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Add Ec Compliance Report</h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_ec_compliance_form" action="" method="post" name="add_ec_compliance_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                    
                   
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Year Start<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<select name="year_start" class="form-control col-md-7 col-xs-12">
                      		<?php
                      		for($i=2000;$i<=2099;$i++)
							{
							?>
                      		<option value="<?= $i;?>"><?= $i;?></option>
                      		<?php
							}
                      		?>
                      	</select>
                        
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Year End<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<select name="year_end" class="form-control col-md-7 col-xs-12">
                      		<?php
                      		for($i=2000;$i<=2099;$i++)
							{
							?>
                      		<option value="<?= $i;?>"><?= $i;?></option>
                      		<?php
							}
                      		?>
                      	</select>
                       
                      </div>
                    </div>
                     <div class="ln_solid"></div>
                      <h2>First Half Information  </h2>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >First Half File Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="first_half_title" required="required" id="first_half_title" class="form-control col-md-7 col-xs-12" value="" />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >First Half File <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      
                        <input type="file" name="first_half_file" id="first_half_file" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    <div class="ln_solid"></div>
                      <h2>Second Half Information  </h2>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Second Half File Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="second_half_title" required="required" id="second_half_title" class="form-control col-md-7 col-xs-12" value="" />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Second Half File <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      
                        <input type="file" name="second_half_file" id="second_half_file" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                     
                    
                     
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_ec_compliance" value="Save" onclick="return validate_form('add_ec_compliance_form');" class="btn btn-success btn-submit">
						<input type="button" name="add_ec_compliance_cancel" value="Cancel" onclick="listec_compliance();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>