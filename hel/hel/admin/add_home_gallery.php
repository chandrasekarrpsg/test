<script type="text/javascript">
	function listhome_gallery()
	{
		location.href = "gallery.php?type=list_home_gallery&lp=cu";
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
                  <h2>Add New Home Gallery </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_home_gallery_form" action="" method="post" name="add_home_gallery_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                 
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="home_gallery_image" id="home_gallery_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Name <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="home_gallery_name" required="required" id="home_gallery_name" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Short desc <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="home_gallery_desc" required="required" id="home_gallery_desc" class="form-control col-md-7 col-xs-12"  />
                      </div>
                   </div> -->
                   
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Position<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" name="position" required="required" id="position" class="form-control col-md-7 col-xs-12"  />
                      </div>
                   </div> -->
                   
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >home_gallery Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
                            
                            <input type="file" multiple="multiple" name="home_gallery_mulimage[]" id="home_gallery_mulimage" class="form-control col-md-7 col-xs-12" value=""   />
                          </div>
                        </div> -->
                    <!--<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Year <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="home_gallery_year" required="required" id="home_gallery_year" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="home_gallery_date" required="required" id="home_gallery_date" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>-->
                     
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_home_gallery" value="Save" onclick="return validate_form('add_home_gallery_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_home_gallery_cancel" value="Cancel" onclick="listhome_gallery();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>