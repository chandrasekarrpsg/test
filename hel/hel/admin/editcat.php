<?php
$cid = $_REQUEST['cid'];
$sl = 'SELECT * FROM '.TABLE_PREFIX.'category WHERE category_id = "'.$cid.'"';
$q  = g_db_query($sl);
$rc = g_db_fetch_array($q);
?>

<script>
	function goto()
	{
		self.location = 'category.php?type=listcat&lp=ac';
	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Category: </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                    <form id="edit_cat_form" action="" method="post" name="edit_cat_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	 	
                  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <img src="post_img/<?php echo $rc['banner_image']; ?>" width="80" height="80" />
                      </div>
                    </div>
                  
                  
                  
                    
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Image
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="banner_image" id="banner_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                   
                   
                   
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Image  contetnt<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="menu_image_cont" id="category" value="<?php print $rc['menu_image_cont']; ?>" class="form-control col-md-7 col-xs-12" required="required" />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Image  contetnt1<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="menu_image_cont1" id="category" value="<?php print $rc['menu_image_cont1']; ?>" class="form-control col-md-7 col-xs-12" required="required" />
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <img src="post_img/<?php echo $rc['menu_image']; ?>" width="80" height="80" />
                      </div>
                    </div>
                  
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Image For Home
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="menu_image" id="menu_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>  
                  
                  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Edit Category<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="edit_category" id="category" value="<?php print $rc['category_name']; ?>" class="form-control col-md-7 col-xs-12" required="required" />
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Title  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="meta_title" id="meta_title" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['meta_title']));?>" required="required" />
                      </div>
                    </div>
                     
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Keyword  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="meta_keyword" id="meta_keyword" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($rc['meta_keyword']));?>" required="required" />
                      </div>
                    </div>
                     
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Description 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="meta_desc"><?php echo stripslashes(html_entity_decode($rc['meta_desc']));?></textarea>
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image For Home  contetnt<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="image_cont" id="category" value="<?php print $rc['image_cont']; ?>" class="form-control col-md-7 col-xs-12" required="required" />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image For Home  contetnt1<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="image_cont1" id="category" value="<?php print $rc['image_cont1']; ?>" class="form-control col-md-7 col-xs-12" required="required" />
                      </div>
                    </div>
                   <!--  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['category_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Category Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="category_image" id="category_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> -->
                   
                <!--    <div class="item form-group">
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
                      	
               <input type="hidden" name="edit_category_id" value="<?php print $rc['category_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_cate" value="Update" onclick="return validate_form('edit_cat_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="save_attr_cancel" value="Cancel" onclick="goto();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>