<script type="text/javascript">
	function listsupplier()
	{
		location.href = "supplier.php?type=list_supplier&lp=cu";
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
                  <h2>Add New Logo </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_supplier_form" action="" method="post" name="add_supplier_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                
                    
               
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="supplier_image" id="supplier_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Logo Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="logo_image" id="logo_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                    
                    
                   
                         <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Short Description
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
                		<?php
                			$oFCKeditor = new FCKeditor('short_desc') ;
                			$oFCKeditor->BasePath	= 'fckeditor/';
                			//$oFCKeditor->ToolbarSet = 'Basic';
                			$oFCKeditor->Width 		= '660px';
                			$oFCKeditor->Height 	= '500px';
                			$oFCKeditor->Value		= '';
                			$oFCKeditor->Create() ;
                		?>
                		</div>
                    </div>
                    </div> 
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Show in home page<span class="required">*</span>
                      	
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="radio" name="show_home" id="show_home" class="flat" value="1" />Yes

  <input type="radio" name="show_home" id="show_home" class="flat" value="0"  />No
                      </div>
                    </div>
            
                     
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_supplier" value="Save" onclick="return validate_form('add_supplier_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_supplier_cancel" value="Cancel" onclick="listsupplier();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>