<?php
$site_id = $_REQUEST['site_id'];
$sl = 'SELECT * FROM  tbl_site_feature WHERE site_id = "'.$site_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listsite()
	{
		location.href = "site_feature.php?type=list_site_feature&lp=cu";
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
                  <h2>Edit site Feature</h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_site_form" action="" method="post" name="edit_site_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                    
                 
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Name  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="site_title" id="site_title" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['site_title']));?>" required="required" />
                      </div>
                    </div>
                     
                  
                    
             <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="site_date" id="datepicker" value="<?php echo stripslashes(html_entity_decode($rc['site_date']));?>" required="required" id="site_date" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['site_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="site_image" id="site_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Text <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="site_desc"  value="<?php echo stripslashes(html_entity_decode($rc['site_desc']));?>" required="required" id="site_link" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                 <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Link <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="site_value"  value="<?php echo stripslashes(html_entity_decode($rc['site_value']));?>" required="required" id="site_link" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                    
                    
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Content
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<div class="txtarea-wysiwyg">
		<?php
		
		
			$oFCKeditor = new FCKeditor('site_desc') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			//$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($rc['site_desc']);
			$oFCKeditor->Create() ;
		?>
		</div>
                </div>
                    </div> -->
                    
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="site_id" value="<?php print $rc['site_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_site" value="Save" onclick="return validate_form('edit_site_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="edit_site_cancel" value="Cancel" onclick="listsite();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>