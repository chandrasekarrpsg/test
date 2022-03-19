<script type="text/javascript">
	function listlogo()
	{
		location.href = "logo.php?type=list_logo&lp=cu";
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

                  <form id="add_logo_form" action="" method="post" name="add_logo_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                
                    
               
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="logo_image" id="logo_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                   
                     
            
                     
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_logo" value="Save" onclick="return validate_form('add_logo_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_logo_cancel" value="Cancel" onclick="listlogo();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>