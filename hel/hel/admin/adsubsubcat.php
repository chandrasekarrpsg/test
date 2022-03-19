<script>
	function goto()
	{
		self.location = 'category.php?type=listcat&lp=ac';
	}
</script>
<script>
	function change_subcategory(qry){
	//alert(qry);	
		
$.ajax({
type: "POST",
url: "ajax_change_subcat.php",
dataType: 'html',
data: "q="+qry,
success: function(html){
	//alert(html);
$("#get_subcat").html(html);
},error: function(){
},complete: function(){
}
});
}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Add New Sub Sub Category : </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_subsubcat_form" action="" method="post" name="add_subsubcat_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	 <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="banner_image" id="banner_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>  -->
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select Category <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <select name="category_id"  onchange="change_subcategory(this.value);" class="form-control col-md-7 col-xs-12">
                      		<option value="">Select</option>
                      		<?php $cat_sql=mysqli_query($conn,"select * from `tbl_category`");
                      		 while($cat_row=mysqli_fetch_array($cat_sql)){?> 
                      		 	<option value="<?php echo $cat_row['category_id']; ?>"><?php echo $cat_row['category_name']; ?></option>
                      		 	<?php } ?>
                      	</select>
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select Sub Category <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<div  id="get_subcat">
                        <select name="subcategory_id" class="form-control col-md-7 col-xs-12">
                      		<option value="">Select</option>
                      	</select>
                      	</div>
                      </div>
                    </div>
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Enter Sub Sub Category <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="new_category" id="category" class="form-control col-md-7 col-xs-12" required="required" />
                      </div>
                    </div>
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Category Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="category_image" id="category_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>  
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Category Description
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
                          <?php
                            $oFCKeditor = new FCKeditor('sub_sub_cat_desc') ;
                            $oFCKeditor->BasePath   = 'fckeditor/';
                            //$oFCKeditor->ToolbarSet = 'Basic';
                            $oFCKeditor->Width      = '100%';
                            $oFCKeditor->Height     = '500px';
                            $oFCKeditor->Value      = '';
                            $oFCKeditor->Create() ;
                        ?>
                        
                        </div>
                    </div>
                    </div> 
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Menu Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="menu_image" id="menu_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>   -->
                    
                                    
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_subsubcate" value="Save" onclick="return validate_form('add_subsubcat_form');" class="btn btn-success btn-submit">
		<input type="button" name="save_attr_cancel" value="Cancel" onclick="goto();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>