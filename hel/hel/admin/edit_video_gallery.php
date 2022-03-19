<?php
$gallery_id = $_REQUEST['gallery_id'];
$sl = 'SELECT * FROM  tbl_video_gallery WHERE gallery_id = "'.$gallery_id.'"';
$q  =mysqli_query($conn,$sl);
$rc =mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listvideo_gallery()
	{
		location.href = "gallery.php?type=list_video_gallery&lp=cu";
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
                  <h2>Edit video_gallery </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_video_gallery_form" action="" method="post" name="edit_video_gallery_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                        <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
                        <img src="post_img/<?php print $rc['gallery_image'];?>" height="100" width="100" />
 
                      </div>
                    </div> -->
                    
                    
                       <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

                            <input type="file" name="gallery_image" id="gallery_image" class="form-control col-md-7 col-xs-12" value=""   />
                          </div>
                        </div> -->
                                     
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Name  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="gallery_name" id="gallery_name" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['gallery_name']));?>" required="required" />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >You Tube Link <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                       
                        <textarea class="form-control col-md-7 col-xs-12" name="gallery_link" required="required"><?php echo stripslashes(html_entity_decode($rc['gallery_link']));?></textarea>
                      </div>
                    </div>
                    
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Gallery Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
                            
                            <input type="file" multiple="multiple" name="gallery_mulimage[]" id="gallery_mulimage" class="form-control col-md-7 col-xs-12" value=""   />
                            <?php 
                            $gal_exe =mysqli_query($conn,'SELECT * FROM tbl_gallery_image WHERE parent_gal_id="'.$gallery_id.'"');
                            $count_gallery =mysqli_num_rows($gal_exe);
                            if($count_gallery!=0){
                            ?>
                            <a class="btn btn-info btn-xs" href="gallery.php?type=list_gallery_images&lp=ac&parent_gal_id=<?php print $rc['gallery_id']; ?>&<?php echo session_name().'='.session_id();?>">List Gallery Images</a>
                            <?php } ?>
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
                      	
                  <input type="hidden" name="gallery_id" value="<?php print $rc['gallery_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_video_gallery" value="Update" onclick="return validate_form('edit_video_gallery_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_video_gallery_cancel" value="Cancel" onclick="listvideo_gallery();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>