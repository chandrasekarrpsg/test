<?php
$sscid = $_REQUEST['sscid'];
$sl = 'SELECT * FROM '.TABLE_PREFIX.'subsubcategory WHERE sub_sub_cat_id = "'.$sscid.'"';
$q  = g_db_query($sl);
$rc = g_db_fetch_array($q);
?>

<script>
	function goto()
	{
		self.location = 'subsubcategory.php?type=listsubsubcat&lp=ac';
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
                  <h2>Edit Sub Category: </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                    <form id="edit_subsubcat_form" action="" method="post" name="edit_subsubcat_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	 	
                  <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['banner_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="banner_image" id="banner_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> -->
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select Category <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <select name="category_id"  onchange="change_subcategory(this.value);" class="form-control col-md-7 col-xs-12">
                      		<option value="">Select</option>
                      		<?php $cat_sql=mysqli_query($conn,"select * from `tbl_category`");
                      		 while($cat_row=mysqli_fetch_array($cat_sql)){?> 
                      		 	<option value="<?php echo $cat_row['category_id']; ?>" <?php if($rc['cat_id']==$cat_row['category_id']){ echo 'selected'; } ?>><?php echo $cat_row['category_name']; ?></option>
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
                      		<?php $subcat_sql=mysqli_query($conn,"select * from tbl_subcategory where cat_id='".$rc['cat_id']."'");
           							while($subcat_row=mysqli_fetch_array($subcat_sql)){?>
           								<option value="<?php echo $subcat_row['sub_cat_id']; ?>" <?php if($rc['sub_cat_id']==$subcat_row['sub_cat_id']){ echo 'selected'; } ?>><?php echo $subcat_row['sub_cat_name']; ?></option>
           								<?php } ?>
                      	</select>
                      	</div>
                      </div>
                    </div>
                   
                  
                  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Edit Sub Sub Category<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="edit_category" id="category" value="<?php print $rc['sub_sub_cat_name']; ?>" class="form-control col-md-7 col-xs-12" required="required" />
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['sub_sub_cat_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Category Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="category_image" id="category_image" class="form-control col-md-7 col-xs-12" value=""   />
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
                            $oFCKeditor->Width      = '660px';
                            $oFCKeditor->Height     = '500px';
                            $oFCKeditor->Value      = htmlspecialchars_decode($rc['sub_sub_cat_desc']);
                            $oFCKeditor->Create() ;
                        ?>
                        </div>
                    </div>
                    </div> 
                   
                   <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['menu_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Menu Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="menu_image" id="menu_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> -->
                   
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
               <input type="hidden" name="edit_category_id" value="<?php print $rc['sub_sub_cat_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_subsubcate" value="Save" onclick="return validate_form('edit_subsubcat_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="save_attr_cancel" value="Cancel" onclick="goto();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>