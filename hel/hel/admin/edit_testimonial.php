<?php
$testimonial_id = $_REQUEST['testimonial_id'];
$sl = 'SELECT * FROM  tbl_testimonial WHERE testimonial_id = "'.$testimonial_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listtestimonial()
	{
		location.href = "testimonial.php?type=list_testimonial&lp=cu";
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
                  <h2>Edit Testimonial </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_testimonial_form" action="" method="post" name="edit_testimonial_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['testimonial_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="testimonial_image" id="testimonial_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                                 
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Name  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="testimonial_title" id="testimonial_title" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['testimonial_title']));?>" required="required" />
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Designation  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="testimonial_desg" id="testimonial_desg" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['testimonial_desg']));?>" required="required" />
                      </div>
                    </div>
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Feedback  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="testimonial_desc" id="testimonial_desc" class="form-control col-md-7 col-xs-12"><?php echo stripcslashes(htmlspecialchars_decode($rc['testimonial_desc']));?></textarea>
                      </div>
                    </div>
                    
             <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="testimonial_date" id="datepicker" value="<?php echo stripslashes(html_entity_decode($rc['testimonial_date']));?>" required="required" id="testimonial_date" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                    
                     <!--   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Details
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('testimonial_desc') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			//$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($rc['testimonial_desc']);
			$oFCKeditor->Create() ;
		?>
		</div>
                </div>
                    </div>     
                   
                        -->
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="testimonial_id" value="<?php print $rc['testimonial_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_testimonial" value="Update" onclick="return validate_form('edit_testimonial_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_testimonial_cancel" value="Cancel" onclick="listtestimonial();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>