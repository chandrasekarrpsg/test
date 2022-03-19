<?php
$faculty_id = $_REQUEST['faculty_id'];
$sl = 'SELECT * FROM  tbl_faculty WHERE faculty_id = "'.$faculty_id.'"';
$q  =mysqli_query($conn,$sl);
$rc =mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listfaculty()
	{
		location.href = "faculty.php?type=list_faculty&lp=cu";
	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Edit faculty </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_faculty_form" action="" method="post" name="edit_faculty_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	   	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >faculty Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                     
                      <input type="text" name="faculty_title" value="<?php echo stripcslashes(html_entity_decode($rc['faculty_title']));?>" required="required" id="faculty_cat" class="form-control col-md-7 col-xs-12"  />
                     
                       
 
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['faculty_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
 
 <input type="file" name="faculty_image" id="faculty_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                    
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['faculty_image_webp'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image webp
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 

 <input type="file" name="faculty_image_webp" id="faculty_image_webp" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >faculty Link <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                     
                      <input type="text" name="faculty_link" value="<?php echo stripcslashes(html_entity_decode($rc['faculty_link']));?>" required="required" id="faculty_cat" class="form-control col-md-7 col-xs-12"  />
                     
                       
 
                      </div>
                    </div> -->
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Details
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('faculty_details') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($rc['faculty_details']);
			$oFCKeditor->Create() ;
		?>
		</div>
                </div>
                    </div>        
                 
            
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="faculty_id" value="<?php print $rc['faculty_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_faculty" value="Update" onclick="return validate_form('edit_faculty_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_faculty_cancel" value="Cancel" onclick="listfaculty();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>