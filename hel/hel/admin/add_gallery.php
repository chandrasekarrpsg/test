<script type="text/javascript">
	function listgallery()
	{
		location.href = "gallery.php?type=list_gallery&lp=cu";
	}
</script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Add New gallery </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_gallery_form" action="" method="post" name="add_gallery_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                 <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select category <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                       
                        <select name="service_id" class="form-control col-md-7 col-xs-12"  >
                        	<?php
                        	$get_service_sql="select * from  tbl_gallery_category order by gallery_category_name asc";
							$get_service_rs=mysqli_query($conn,$get_service_sql);
							while($get_service_row=mysqli_fetch_array($get_service_rs))
							{
                        	?>
                        	<option value="<?= $get_service_row['gallery_category_id']; ?>"><?= $get_service_row['gallery_category_name']; ?></option>
                        	<?php
                        	}
                        	?>
                        </select>
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="gallery_image" id="gallery_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Name <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="gallery_name" required="required" id="gallery_name" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Sort Description  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">

 <textarea name="gallery_srt_desc" id="gallery_srt_desc" class="form-control col-md-7 col-xs-12"></textarea>
                      </div>
                    </div>
                    
                    
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Gallery Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
                            
                            <input type="file" multiple="multiple" name="gallery_mulimage[]" id="gallery_mulimage" class="form-control col-md-7 col-xs-12" value=""   />
                          </div>
                        </div> -->
                    <!--<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Year <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="gallery_year" required="required" id="gallery_year" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="gallery_date" required="required" id="gallery_date" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>-->
                     
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_gallery" value="Save" onclick="return validate_form('add_gallery_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_gallery_cancel" value="Cancel" onclick="listgallery();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>