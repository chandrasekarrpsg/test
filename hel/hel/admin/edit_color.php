<?php
$color_id = $_REQUEST['color_id'];
$sl = 'SELECT * FROM  tbl_color WHERE color_id = "'.$color_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listcolor()
	{
		location.href = "color.php?type=list_color&lp=cu";
	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Edit color </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_color_form" action="" method="post" name="edit_color_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	   	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >color Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                     
                      <input type="text" name="color_title" value="<?php echo stripcslashes(html_entity_decode($rc['color_title']));?>" required="required" id="color_cat" class="form-control col-md-7 col-xs-12"  />
                     
                       
 
                      </div>
                    </div>
                       <!--  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['color_image'];?>" height="100" width="100" />
 
                      </div>
                    </div> -->
                    
                    
                       <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="color_image" id="color_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> -->
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >color Code <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                     
                      <input type="text" name="color_code" value="<?php echo stripcslashes(html_entity_decode($rc['color_code']));?>" required="required" id="color_cat" class="form-control col-md-7 col-xs-12"  />
                     
                       
 
                      </div>
                    </div>
                                
                 
            
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="color_id" value="<?php print $rc['color_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_color" value="Update" onclick="return validate_form('edit_color_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_color_cancel" value="Cancel" onclick="listcolor();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>