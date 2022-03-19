<?php
$environmental_management_id = $_REQUEST['environmental_management_id'];
$sl = 'SELECT * FROM  tbl_environmental_management WHERE environmental_management_id = "'.$environmental_management_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listenvironmental_management()
	{
		location.href = "environmental_management.php?type=list_environmental_management&lp=cu";
	}
</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
$( "#datepicker" ).datepicker({
changeMonth: true,
changeYear: true,
dateFormat:"yy-mm-dd"
});
$( "#datepicker2" ).datepicker({
changeMonth: true,
changeYear: true,
dateFormat:"yy-mm-dd"
});
//$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd");
//$( "#datepicker2" ).datepicker( "option", "dateFormat", "yy-mm-dd");
});
</script>
<div class="x_panel">
                <div class="x_title">
               <h2>Edit Environmental Management </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_environmental_management_form" action="" method="post" name="edit_environmental_management_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                  <!-- 	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select Company <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<select name="environmental_management_category" class="form-control col-md-7 col-xs-12">
                      		<option value="">Select</option>
                      		<option value="interviews" <?php if($rc['category_name']=='interviews'){ echo 'selected'; } ?>>Interviews</option>
                      		<option value="recipes" <?php if($rc['category_name']=='recipes'){ echo 'selected'; } ?>>Recipes</option>
                      		<option value="workout" <?php if($rc['category_name']=='workout'){ echo 'selected'; } ?>>Workout</option>
                      		<option value="music" <?php if($rc['category_name']=='music'){ echo 'selected'; } ?>>Music</option>
                      	</select>
                        
                      </div>
                    </div> -->
                    
                    
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="meta_title" required="required" id="meta_title" class="form-control col-md-7 col-xs-12" value="<?php echo stripcslashes(html_entity_decode($rc['meta_title']));?>" />
                     
 
                      </div>
                    </div> -->
                    
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Keyword <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="meta_keyword" required="required" id="meta_keyword" class="form-control col-md-7 col-xs-12" value="<?php echo stripcslashes(html_entity_decode($rc['meta_keyword']));?>" />
                     
 
                      </div>
                    </div> -->
                    
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Description <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                       <textarea name="meta_desc" id="meta_desc" class="form-control col-md-7 col-xs-12"><?php echo stripcslashes(html_entity_decode($rc['meta_desc']));?></textarea>
                      </div>
                    </div> -->
                    
                    
                  	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Title  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="environmental_management_title" id="environmental_management_title" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['environmental_management_title']));?>" required="required" />
                      </div>
                    </div>
                     
                     
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['environmental_management_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="environmental_management_image" id="environmental_management_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                                 
                                 
                   <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="environmental_management_img/<?php print $rc['environmental_management_image_webp'];?>" height="100" width="100" />
 
                      </div>
                    </div> -->
                    
                    
                       <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image(webp)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="environmental_management_image_webp" id="environmental_management_image_webp" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> -->
                    
                     
                    
             <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="environmental_management_date" id="datepicker" value="<?php echo stripslashes(html_entity_decode($rc['environmental_management_date']));?>" required="required" id="environmental_management_date" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>-->    
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Short Description <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <textarea name="environmental_management_srt_desc" required="required" id="environmental_management_srt_desc" class="form-control col-md-7 col-xs-12"><?php echo stripslashes(html_entity_decode($rc['environmental_management_srt_desc']));?></textarea>
                      </div>
                    </div>
                    
                       <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Details
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('environmental_management_desc') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($rc['environmental_management_desc']);
			$oFCKeditor->Create() ;
		?>
		</div>
                </div>
                    </div> -->  
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Link <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="environmental_management_link" required="required" id="environmental_management_link" class="form-control col-md-7 col-xs-12"  value="<?php echo $rc['environmental_management_link'];?>"/>
                      </div>
                    </div>
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Featured Post<span class="required">*</span>
                        
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="radio" name="show_home" id="show_home" class="flat" value="1" <?php if( $rc['show_home']==1){ echo "checked";}?> />Yes

  <input type="radio" name="show_home" id="show_home" class="flat" value="0" <?php if($rc['show_home']==0){ echo "checked";}?> />No
                      </div>
                    </div> -->
                       
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="environmental_management_id" value="<?php print $rc['environmental_management_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_environmental_management" value="Update" onclick="return validate_form('edit_environmental_management_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_environmental_management_cancel" value="Cancel" onclick="listenvironmental_management();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>