<?php
$home_gallery_id = $_REQUEST['home_gallery_id'];
$sl = 'SELECT * FROM  tbl_home_gallery WHERE home_gallery_id = "'.$home_gallery_id.'"';
$q  =mysqli_query($conn,$sl);
$rc =mysqli_fetch_array($q);
?>
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
                  <h2>Edit Home Gallery </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_home_gallery_form" action="" method="post" name="edit_home_gallery_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
                        <img src="post_img/<?php print $rc['home_gallery_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

                            <input type="file" name="home_gallery_image" id="home_gallery_image" class="form-control col-md-7 col-xs-12" value=""   />
                          </div>
                        </div>
                                     
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Name  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="home_gallery_name" id="home_gallery_name" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['home_gallery_name']));?>" required="required" />
                      </div>
                    </div>
                    
                   <!--  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >home_gallery Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
                            
                            <input type="file" multiple="multiple" name="home_gallery_mulimage[]" id="home_gallery_mulimage" class="form-control col-md-7 col-xs-12" value=""   />
                            <?php 
                            $gal_exe =mysqli_query($conn,'SELECT * FROM tbl_home_gallery_image WHERE parent_gal_id="'.$home_gallery_id.'"');
                            $count_home_gallery =mysqli_num_rows($gal_exe);
                            if($count_home_gallery!=0){
                            ?>
                            <a class="btn btn-info btn-xs" href="home_gallery.php?type=list_home_gallery_images&lp=ac&parent_gal_id=<?php print $rc['home_gallery_id']; ?>&<?php echo session_name().'='.session_id();?>">List home_gallery Images</a>
                            <?php } ?>
                          </div>
                        </div> -->
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Short desc <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="home_gallery_desc" required="required" id="home_gallery_desc" class="form-control col-md-7 col-xs-12"  value="<?php echo stripslashes(html_entity_decode($rc['home_gallery_desc']));?>" />
                      </div>
                   </div> -->
                   
                   <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Position<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" name="position" required="required" id="position" class="form-control col-md-7 col-xs-12"  value="<?php echo stripslashes(html_entity_decode($rc['position']));?>" />
                      </div>
                   </div> -->
                    
                  <!--    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="home_gallery_date" required="required" id="home_gallery_date" class="form-control col-md-7 col-xs-12"  value="<?php echo stripslashes(html_entity_decode($rc['home_gallery_year']));?>" />
                      </div>
                    </div> -->
                    
                  <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="home_gallery_id" value="<?php print $rc['home_gallery_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_home_gallery" value="Update" onclick="return validate_form('edit_home_gallery_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_home_gallery_cancel" value="Cancel" onclick="listhome_gallery();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>