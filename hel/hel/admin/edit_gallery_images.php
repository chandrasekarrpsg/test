<?php
$mul_gal_id = $_REQUEST['mul_gal_id'];
echo $sl = 'SELECT * FROM  tbl_gallery_image WHERE mul_gal_id = "'.$mul_gal_id.'"';
$q  =mysqli_query($conn,$sl);
$rc =mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listgalleryimages(mgid)
	{
		location.href = "gallery.php?type=list_gallery_images&parent_gal_id="+mgid+"&lp=cu";
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
                  <h2>Edit gallery images </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_gallery_form" action="" method="post" name="edit_gallery_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
                        <img src="post_img/<?php print $rc['mul_gal_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

                            <input type="file" name="mul_gal_image" id="mul_gal_image" class="form-control col-md-7 col-xs-12" value=""   />
                          </div>
                        </div>
                                     
                    
                     
                    
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Gallery Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
                            
                            <input type="file" multiple="multiple" name="gallery_mulimage[]" id="gallery_mulimage" class="form-control col-md-7 col-xs-12" value=""   />
                            
                            <a class="btn btn-info btn-xs" href="gallery.php?type=list_gallery_images&lp=ac&parent_gal_id=<?php print $rc['gallery_id']; ?>&<?php echo session_name().'='.session_id();?>">List Gallery Images</a>
                          </div>
                        </div> -->
                   <!--   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Year <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="gallery_year" required="required" id="gallery_year" class="form-control col-md-7 col-xs-12"  value="<?php echo stripslashes(html_entity_decode($rc['gallery_year']));?>" />
                      </div>
                   </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="gallery_date" required="required" id="gallery_date" class="form-control col-md-7 col-xs-12"  value="<?php echo stripslashes(html_entity_decode($rc['gallery_year']));?>" />
                      </div>
                    </div> -->
                    
                  <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="mul_gal_id" value="<?php print $rc['mul_gal_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_gallery_image" value="Update" onclick="return validate_form('edit_gallery_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_gallery_cancel" value="Cancel" onclick="listgalleryimages(<?php print $rc['parent_gal_id']; ?>);" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>