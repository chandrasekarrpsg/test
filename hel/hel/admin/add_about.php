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
changeYear: true
});
$( "#datepicker2" ).datepicker({
changeMonth: true,
changeYear: true
});
$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd");
$( "#datepicker2" ).datepicker( "option", "dateFormat", "yy-mm-dd");
});
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Add New Home Video</h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_about_form" action="" method="post" name="add_about_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                 
                    
                     
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Video 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    


 <textarea name="about_video" id="about_video" class="form-control col-md-7 col-xs-12"></textarea>
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Name  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="about_title" id="about_title" class="form-control col-md-7 col-xs-12" value="" required="required" />
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >SHort description  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="about_desc" id="about_desc" class="form-control col-md-7 col-xs-12"></textarea>
                      </div>
                    </div>
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="about_date" id="datepicker" required="required" id="about_date" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                    
                  <!--      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Details
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('about_desc') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			//$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= '';
			$oFCKeditor->Create() ;
		?>
		</div></div>
	  </div> -->
                     
                     
                     
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_about" value="Save" onclick="return validate_form('add_about_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_about_cancel" value="Cancel" onclick="listabout();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>