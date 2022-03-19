<?php
$product_id = $_REQUEST['product_id'];
$sl = 'SELECT * FROM  tbl_product WHERE product_id = "'.$product_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listproduct()
	{
		location.href = "product.php?type=list_product&lp=cu";
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

<script>
    function change_subcategory(qry){
    //alert(qry);   
        
$.ajax({
type: "POST",
url: "ajax_change_subcategory.php",
dataType: 'html',
data: "q="+qry,
success: function(html){
    //alert(html);
$("#subcat").html(html);
},error: function(){
},complete: function(){
}
});
}
</script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Product </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_product_form" action="" method="post" name="edit_product_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
             <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select Category 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
    
 <select name="cat_id" id="cat_id"  required="required"  class="form-control col-md-7 col-xs-12">
			  <option value="">Select Category</option>
			  <?php
				$category = 'SELECT * FROM '.TABLE_PREFIX.'category';
				$category_query = g_db_query($category);
				while ($result = g_db_fetch_array($category_query)){
				?>
			  <option value="<?php echo $result['category_id']; ?>" <?php print $result['category_id'] == $rc['cat_id'] ? 'selected' : '' ; ?>><?php echo $result['category_name']; ?></option>
			  <?php } ?>
				</select>
 
                      </div>
                    </div>
                
            <!--     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select Sub Category 
                      </label>
                      <div id="get_subcat"> 
                      <div class="col-md-6 col-sm-6 col-xs-12" id="subcat">
                      
                         <select name= "sub_category" id="sub_category" class="form-control col-md-7 col-xs-12">
                             <option value="">Select Sub Category</option>
                            <?php
                            $subcategory = 'SELECT * FROM '.TABLE_PREFIX.'subcategory';
                            $subcategory_query = g_db_query($subcategory);
                            while ($subcatresult = g_db_fetch_array($subcategory_query)){
                            ?>
                          <option value="<?php echo $subcatresult['sub_cat_id']; ?>" <?php print $subcatresult['sub_cat_id'] == $rc['sub_cat_id'] ? 'selected' : '' ; ?>><?php echo $subcatresult['sub_cat_name']; ?></option>
                          <?php } ?>
              
                         </select>
                     </div>
                      </div>
                    </div>  -->
                    
                  <!--   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select Sub Sub Category <span class="required">*</span>
                      </label>
                      <div id="get_subsubcat"> 
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        
                        <select name="subsubcategory_id" class="form-control col-md-7 col-xs-12">
                            <option value="">Select Sub Sub Category</option>
                            <?php
                            $subsubcategory = 'SELECT * FROM '.TABLE_PREFIX.'subsubcategory';
                            $subsubcategory_query = g_db_query($subsubcategory);
                            while ($subsubresult = g_db_fetch_array($subsubcategory_query)){
                            ?>
                          <option value="<?php echo $subsubresult['sub_sub_cat_id']; ?>" <?php print $subsubresult['sub_sub_cat_id'] == $rc['sub_sub_cat_id'] ? 'selected' : '' ; ?>><?php echo $subsubresult['sub_sub_cat_name']; ?></option>
                          <?php } ?>
                        </select>
                        
                      </div>
                      </div>
                    </div>    
                     -->
                    
                    
            <!--         
              <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Code  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="product_code" id="product_code" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['product_code']));?>" required="required" />
                      </div>
                    </div> -->
                    
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Title  
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="meta_title" id="meta_title" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['meta_title']));?>"  />
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Keyword  
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="meta_keyword" id="meta_keyword" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['meta_keyword']));?>" />
                      </div>
                    </div>
                     
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Description 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="meta_desc"><?php echo stripslashes(html_entity_decode($rc['meta_desc']));?></textarea>
                      </div>
                    </div>	 
                      <!--  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Tag
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="tag"><?php echo stripslashes(html_entity_decode($rc['tag']));?></textarea>
                      </div>
                    </div> -->

               <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Title  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="product_title" id="product_title" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['product_title']));?>" required="required" />
                      </div>
                    </div>
                    
                     
             
                        
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['product_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="product_image" id="product_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                  
                   <!--   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['zoom_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>      
                     
                     
                     
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Zoom Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="zoom_image" id="zoom_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                         -->
                  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Add Other Image </label>
		   <div class="col-md-6 col-sm-6 col-xs-12"><input type="file" class="form-control col-md-7 col-xs-12" name="image_gallery[]" multiple="multiple" value="" />(Press Ctrl and Upload multiple image)</div>
	  </div> 
	   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Other Image  </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <a href="product.php?type=list_gallery&product_id=<?php print $rc['product_id']; ?>" target='_blank'><strong>View Other Image</strong></a></div>
	  </div>
                    
                  
                  
                 <!--  
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['featured_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>      
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Featured Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="featured_image" id="featured_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                     
                      -->
                 
             <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="product_date" id="datepicker" value="<?php echo stripslashes(html_entity_decode($rc['product_date']));?>" required="required" id="product_date" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Price  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="product_price" id="product_price" class="form-control col-md-7 col-xs-12" value="<?php echo stripcslashes(htmlspecialchars_decode($rc['product_price']));?>" />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Stock  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="product_stock" id="product_stock" class="form-control col-md-7 col-xs-12" value="<?php echo stripcslashes(htmlspecialchars_decode($rc['product_stock']));?>" />
                      </div>
                    </div> -->
                 <!--   -->
                  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Sort Description  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="product_srt_desc" id="product_srt_desc"  /><?php echo stripcslashes(htmlspecialchars_decode($rc['product_srt_desc']));?></textarea>
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Description
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
                		<?php
                			$oFCKeditor = new FCKeditor('product_overview') ;
                			$oFCKeditor->BasePath	= 'fckeditor/';
                			//$oFCKeditor->ToolbarSet = 'Basic';
                			$oFCKeditor->Width 		= '660px';
                			$oFCKeditor->Height 	= '500px';
                			$oFCKeditor->Value		= htmlspecialchars_decode($rc['product_overview']);
                			$oFCKeditor->Create() ;
                		?>
                		</div>
                    </div>
                    </div> 
                   <!--    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Featured Content
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
                		<?php
                			$oFCKeditor = new FCKeditor('featuerd_cont') ;
                			$oFCKeditor->BasePath	= 'fckeditor/';
                			//$oFCKeditor->ToolbarSet = 'Basic';
                			$oFCKeditor->Width 		= '660px';
                			$oFCKeditor->Height 	= '500px';
                			$oFCKeditor->Value		= htmlspecialchars_decode($rc['featuerd_cont']);
                			$oFCKeditor->Create() ;
                		?>
                		</div>
                     </div>
                    </div>     
                    -->
                        

                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >New Arrival<span class="required">*</span>
                      	
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="radio" name="product_new_arrive" id="product_new_arrive" class="flat" value="1" <?php if( $rc['product_new_arrive']==1){ echo "checked";}?> />Yes

  <input type="radio" name="product_new_arrive" id="product_new_arrive" class="flat" value="0" <?php if($rc['product_new_arrive']==0){ echo "checked";}?> />No
                      </div>
                    </div>
                    
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Exclusive Collections<span class="required">*</span>
                      	
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="radio" name="product_recent" id="product_recent" class="flat" value="1" <?php if( $rc['product_recent']==1){ echo "checked";}?> />Yes

  <input type="radio" name="product_recent" id="product_recent" class="flat" value="0" <?php if($rc['product_recent']==0){ echo "checked";}?> />No
                      </div>
                    </div>
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="product_id" value="<?php print $rc['product_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_product" value="Update" onclick="return validate_form('edit_product_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_product_cancel" value="Cancel" onclick="listproduct();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>
             
<script type="text/javascript">
function listgallery(qry){

$.ajax({
type: "GET",
url: "ajax_add_gallery.php",
dataType: 'html',
data: "q="+qry,
success: function(html){

$("#add_gallery").append(html);
},error: function(){
},complete: function(){
}
});

}
</script>