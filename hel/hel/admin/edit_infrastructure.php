<?php
$infrastructure_id = $_REQUEST['infrastructure_id'];
$sl = 'SELECT * FROM  tbl_infrastructure WHERE infrastructure_id = "'.$infrastructure_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listinfrastructure()
	{
		location.href = "infrastructure.php?type=list_infrastructure&lp=cu";
	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Edit infrastructure </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_infrastructure_form" action="" method="post" name="edit_infrastructure_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                  	
                  		<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >infrastructure Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" name="infrastructure_title" id="infrastructure_title" value="<?php echo stripcslashes(html_entity_decode($rc['infrastructure_title']));?>" class="form-control col-md-7 col-xs-12" required="required"/>
 
                      </div>
                    </div>
                     <?php
                    if($rc['infrastructure_image']!=''){
                    	?>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['infrastructure_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                   <?php } ?> 
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="infrastructure_image" id="infrastructure_image" value="" class="form-control col-md-7 col-xs-12" required="required"/>
                      </div>
                    </div>
                    <?php
                    if($rc['infrastructure_image_webp']!=''){
                    	?>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['infrastructure_image_webp'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                   <?php } ?> 
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image Webp<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="infrastructure_image_webp" id="infrastructure_image_webp" value="" class="form-control col-md-7 col-xs-12" required="required"/>
                      </div>
                    </div>
                    
                    	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >infrastructure Description <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                
                      <textarea name="infrastructure_desc" required="required" id="infrastructure_desc" style="width: 613px; height: 195px;"><?php echo stripcslashes(html_entity_decode($rc['infrastructure_desc']));?></textarea>
                     
 
                      </div>
                    </div>
                    
                       
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="infrastructure_id" value="<?php print $rc['infrastructure_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_infrastructure" value="Update" onclick="return validate_form('edit_infrastructure_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_infrastructure_cancel" value="Cancel" onclick="listinfrastructure();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>