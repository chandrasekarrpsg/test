<?php
$award_id = $_REQUEST['award_id'];
$sl = 'SELECT * FROM  tbl_award WHERE award_id = "'.$award_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listaward()
	{
		location.href = "award.php?type=list_award&lp=cu";
	}
</script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Award</h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_award_form" action="" method="post" name="edit_award_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                 
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['head_award_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Header Award Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="head_award_image" id="head_award_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['foot_award_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Footer Award Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="foot_award_image" id="foot_award_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                           
      <!--                <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Award Name <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="award_name" id="award_name" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['award_name']));?>" required="required" />
                      </div>
                      </div>
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Award for <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="award_for" id="award_for" class="form-control col-md-7 col-xs-12"  value="<?php echo stripslashes(html_entity_decode($rc['award_for']));?>" required="required" />
                      </div>
                    </div>
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Project name <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
<input type="text" name="project_name" id="project_name" class="form-control col-md-7col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['project_name']));?>" required="required" />
                      </div>
                    </div> -->
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="award_id" value="<?php print $rc['award_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_award" value="Update" onclick="return validate_form('edit_award_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_award_cancel" value="Cancel" onclick="listaward();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>