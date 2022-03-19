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

<script>
	function change_subcategory(qry){
		
$.ajax({
type: "POST",
url: "ajax_change_subcategory.php",
dataType: 'html',
data: "q="+qry,
success: function(html){
	// alert(html);
$("#subcat").html(html);
},error: function(){
},complete: function(){
}
});
}
</script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Add New Product </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_product_form" action="" method="post" name="add_product_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                 <input type="hidden" name="countimg" id="countimg" value="1" />
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select Category 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
            			<select name="cat_id" id="cat_id"  required="required" class="form-control col-md-7 col-xs-12">
            			  <option value="">Select Category</option>
            			  <?php
            				$category = 'SELECT * FROM '.TABLE_PREFIX.'category';
            				$category_query = g_db_query($category);
            				while ($result = g_db_fetch_array($category_query)){
            				?>
            			  <option value="<?php echo $result['category_id']; ?>"><?php echo $result['category_name']; ?></option>
            			  <?php } ?>
            			</select>
                      </div>
                    </div>
                    
               
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Title  
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="meta_title" id="meta_title" class="form-control col-md-7 col-xs-12" value=""  />
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Keyword  
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="meta_keyword" id="meta_keyword" class="form-control col-md-7 col-xs-12" value="" />
                      </div>
                    </div>
                     
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Description 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="meta_desc"></textarea>
                      </div>
                    </div>	 
                <!--        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Tag
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="tag"></textarea>
                      </div>
                    </div> -->

                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="product_title" required="required" id="product_title" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> 
                     
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="product_image" id="product_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
               <!--      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Zoom Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="zoom_image" id="zoom_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                 -->
                    	
                    	
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Other Image  </label>
		              <div class="col-md-6 col-sm-6 col-xs-12"><input type="file" class="form-control col-md-7 col-xs-12" name="image_gallery[]" multiple="multiple" value="" />(Press Ctrl and Upload multiple image)</div>
	               </div>
	   
                    
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Featured Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="featured_image" id="featured_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                     
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="product_date" id="datepicker" required="required" id="product_date" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Price  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="product_price" id="product_price" class="form-control col-md-7 col-xs-12" value="" />
                      </div>
                    </div> -->
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Stock  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="product_stock" id="product_stock" class="form-control col-md-7 col-xs-12" value="" />
                      </div>
                    </div> -->
                   <!-- --> <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Sort Description  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
<textarea name="product_srt_desc" id="product_srt_desc"  /></textarea>
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
                			$oFCKeditor->Width 		= '100%';
                			$oFCKeditor->Height 	= '500px';
                			$oFCKeditor->Value		= '';
                			$oFCKeditor->Create() ;
                		?>
                		</div></div>
                	  </div>
                    <!--    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Featured Content
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
                		<?php
                			$oFCKeditor = new FCKeditor('featuerd_cont') ;
                			$oFCKeditor->BasePath	= 'fckeditor/';
                			//$oFCKeditor->ToolbarSet = 'Basic';
                			$oFCKeditor->Width 		= '100%';
                			$oFCKeditor->Height 	= '500px';
                			$oFCKeditor->Value		= '';
                			$oFCKeditor->Create() ;
                		?>
                		</div></div>
                	  </div> -->
                     
                    
                    <!--  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Color Code (Separate By Comma)  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="product_color" id="product_color" class="form-control col-md-7 col-xs-12" value="" />
                      </div>
                    </div> -->
                    
                    
                    <!-- <script type="text/javascript">
                    function del_field(qry,ctr){
                    $.ajax({
                    type: "GET",
                    url: "ajax_del_field.php",
                    dataType: 'html',
                    data: "q="+qry,
                    success: function(html){
                    alert(html);
                    $("#sec"+ctr).remove();
                    },error: function(){
                    },complete: function(){
                    }
                    });
                    
                    }
                    </script>
                    
                    <script type="text/javascript">
                    
                    $(document).ready(function(){
                    
                        var counter = parseInt($("#hiddencount").val());
                      
                    
                        $("#addButton").click(function () {
                    
                    	var newTextBoxDiv = $(document.createElement('div'))
                    	 .attr("id", 'TextBoxDiv' + counter);
                    $.ajax({
                    type: "POST",
                    url: "ajax_add_color.php",
                    dataType: 'html',
                    data: "counter="+counter,
                    success: function(html){
                    	newTextBoxDiv.after().html(html);
                    
                    	newTextBoxDiv.appendTo("#TextBoxesGroup");
                    	counter++;
                      $("#hiddencount").val(counter);
                    	
                    
                    },error: function(){
                    },complete: function(){
                    }
                    });
                    	
                         });
                    
                       
                      });
                    </script>
                    <div id='TextBoxesGroup'></div>
                     <input type="hidden" name="reccount1" id="reccount1" value="<?= $i-1;?>"> 
                     <input type="hidden" name="hiddencount" id="hiddencount" value="1">  
                    <input type='button' value='Add Color' id='addButton'>  
                    
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Size (Separate By Comma)  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="product_size" id="product_size" class="form-control col-md-7 col-xs-12" value="" />
                      </div>
                    </div>-->
                    
		                   <div class="item form-group">
		                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >New Arrival<span class="required">*</span>
		                      </label>
		                      <div class="col-md-6 col-sm-6 col-xs-12">
		 <input type="radio" name="product_new_arrive" id="product_new_arrive" class="flat" value="1" />Yes
		  <input type="radio" name="product_new_arrive" id="product_new_arrive" class="flat" value="0" checked="checked" />No
		                      </div>
		                    </div> 
		                            <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Exclusive Collections<span class="required">*</span>
                      	
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="radio" name="product_recent" id="product_recent" class="flat" value="1"  />Yes

  <input type="radio" name="product_recent" id="product_recent" class="flat" value="0"/>No
                      </div>
                    </div>
		           <!--          
                     <div class="item form-group">
		                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Recent Product<span class="required">*</span>
		                      </label>
		                      <div class="col-md-6 col-sm-6 col-xs-12">
		 <input type="radio" name="product_recent" id="product_recent" class="flat" value="1" />Yes
		  <input type="radio" name="product_recent" id="product_recent" class="flat" value="0" checked="checked" />No
		                      </div>
		                    </div> 
                      -->
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_product" value="Save" onclick="return validate_form('add_product_form');" class="btn btn-success btn-submit">
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