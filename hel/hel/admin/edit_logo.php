<?php
$logo_id = $_REQUEST['logo_id'];
$sl = 'SELECT * FROM  tbl_logo WHERE logo_id = "'.$logo_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
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
                  <h2>Edit Logo </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_logo_form" action="" method="post" name="edit_logo_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  
                     
             
                        
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['logo_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="logo_image" id="logo_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="logo_id" value="<?php print $rc['logo_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_logo" value="Update" onclick="return validate_form('edit_logo_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_logo_cancel" value="Cancel" onclick="listlogo();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>