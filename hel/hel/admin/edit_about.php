<?php
$about_id = $_REQUEST['about_id'];
$sl = 'SELECT * FROM  tbl_about_slider WHERE about_id = "'.$about_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listabout()
	{
		location.href = "about.php?type=list_about&lp=cu";
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
                  <h2>Edit Home Video </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_about_form" action="" method="post" name="edit_about_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 
 <iframe width="50%" height="25%" src="<?php print $rc['about_video'];?>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
 
                      </div>
                    </div>
                    
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Video 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    


 <textarea name="about_video" id="about_video" class="form-control col-md-7 col-xs-12"><?php print $rc['about_video'];?></textarea>
                      </div>
                    </div>
                                 
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Name  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="about_title" id="about_title" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['about_title']));?>" required="required" />
                      </div>
                    </div>
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >SHort description  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="about_desc" id="about_desc" class="form-control col-md-7 col-xs-12"><?php echo stripcslashes(htmlspecialchars_decode($rc['short_desc']));?></textarea>
                      </div>
                    </div>
                    
             <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="about_date" id="datepicker" value="<?php echo stripslashes(html_entity_decode($rc['about_date']));?>" required="required" id="about_date" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                    
                       <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Details
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('about_desc') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			//$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($rc['about_desc']);
			$oFCKeditor->Create() ;
		?>
		</div>
                </div>
                    </div>    -->  
                   
                       
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="about_id" value="<?php print $rc['about_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_about" value="Update" onclick="return validate_form('edit_about_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_about_cancel" value="Cancel" onclick="listabout();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>