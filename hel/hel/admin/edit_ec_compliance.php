<?php
$ec_compliance_id = $_REQUEST['ec_compliance_id'];
$sl = 'SELECT * FROM  tbl_ec_compliance WHERE ec_compliance_id = "'.$ec_compliance_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listec_compliance()
	{
		location.href = "ec_compliance.php?type=list_ec_compliance&lp=cu";
	}
</script>

			<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Ec Compliance  </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_ec_compliance_form" action="" method="post" name="edit_ec_compliance_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Year Start<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<select name="year_start" class="form-control col-md-7 col-xs-12">
                      		<?php
                      		for($i=2000;$i<=2099;$i++)
							{
							?>
                      		<option value="<?= $i;?>" <?php if($rc['year_start']==$i){ echo "selected"; }?>><?= $i;?></option>
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
                      		<option value="<?= $i;?>" <?php if($rc['year_end']==$i){ echo "selected"; }?>><?= $i;?></option>
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
                        <input type="text" name="first_half_title" required="required" id="first_half_title" value="<?= $rc['first_half_title'];?>" class="form-control col-md-7 col-xs-12" value="" />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >First Half File <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <a href="post_img/<?php print $rc['first_half_file']; ?>" target="_blank">Download</a>
                        <input type="file" name="first_half_file" id="first_half_file" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    <div class="ln_solid"></div>
                      <h2>Second Half Information  </h2>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Second Half File Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="second_half_title" required="required" id="second_half_title" value="<?= $rc['second_half_title'];?>" class="form-control col-md-7 col-xs-12" value="" />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Second Half File <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<a href="post_img/<?php print $rc['second_half_file']; ?>" target="_blank">Download</a>
                        <input type="file" name="second_half_file" id="second_half_file" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                   
                       
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  		<input type="hidden" name="ec_compliance_id" value="<?php print $rc['ec_compliance_id']; ?>" />
                      	<input type="submit" name="edit_ec_compliance" value="Update" onclick="return validate_form('edit_ec_compliance_form');" class="btn btn-success btn-submit">
                      	<input type="button" name="add_ec_compliance_cancel" value="Cancel" onclick="listec_compliance();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>