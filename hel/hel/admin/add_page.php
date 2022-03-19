   <script src="ckeditor/ckeditor.js" type="text/javascript"></script> 
  <script src="ckeditor/adapters/jquery.js " type="text/javascript"></script>     
<script>
	function goto()
	{
		self.location = 'page.php?type=list_page&lp=ac';
	}
</script>
<script type="text/javascript">

function get_template_field(v)
{
$.ajax({
type: "POST",
url: "ajax_get_template_field.php",
dataType: 'html',
data: "template="+v,
success: function(html){
	
$("#acf_section").html(html);

	$('.ckeditor').ckeditor();	

},error: function(){
},complete: function(){


}
});
	
}
</script>


<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Content </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_page_form" action="" method="post" name="add_page_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                  	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Choose Template<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12 facilities1">
						<select name="acf_template"  required="required" onchange="get_template_field(this.value)" class="form-control col-md-7 col-xs-12">
						<option value="">Choose Template</option>	
						<?php
						$file_name=get_template();
						foreach($file_name as $key=>$value)
						{
						?>	
						<option value="<?= $key?>" <?php if($key==$rc['template']){ echo "selected";}?>><?= $value; ?></option>	
						<?php
						}
						?>
						</select>	  
                      </div>
                      
                    </div>
                  	
                  	
                  	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Parent Page<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12 facilities1">
						<select name="parent_page"  required="required" class="form-control col-md-7 col-xs-12">
						<option value="0">No Parent</option>	
						<?php
						$get_page_sql="select * from tbl_page where id!='".$_REQUEST['page_id']."' order by page_name asc";
						$get_page_rs=mysqli_query($conn,$get_page_sql);
						while($get_page_row=mysqli_fetch_array($get_page_rs))
						{
						?>	
						<option value="<?= $get_page_row['id']?>" ><?= $get_page_row['page_name']; ?></option>	
						<?php
						}
						?>
						</select>	  
                      </div>
                      
                    </div>
  	               	
                  	   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Title  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="meta_title" id="meta_title" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($pageRes['meta_title']));?>" required="required" />
                      </div>
                    </div>
                     
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Keyword  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="meta_keyword" id="meta_keyword" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($pageRes['meta_keyword']));?>" required="required" />
                      </div>
                    </div>
                     
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Description 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="meta_desc" class="form-control col-md-7 col-xs-12"><?php echo stripslashes(html_entity_decode($pageRes['meta_desc']));?></textarea>
                      </div>
                    </div>
                  
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Page Name  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="page_name" id="page_name" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($pageRes['page_name']));?>" required="required" />
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
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Banner Text
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<div class="txtarea-wysiwyg">
		<?php
		
		
		
		
			$oFCKeditor = new FCKeditor('banner_heading') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= '';
			$oFCKeditor->Config['EnterMode'] = 'br';
			$oFCKeditor->Create() ;
		?>
		</div>
                </div>
                    </div>
                   
                   
                    <?php 
                    if($pageRes['page_image']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $pageRes['page_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <?php }?>
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Page  Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="page_image" id="page_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
            
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Page Details
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<div class="txtarea-wysiwyg">
		<?php
		
		
			$oFCKeditor = new FCKeditor('page_desc') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			//$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= '';
			$oFCKeditor->Create() ;
		?>
		<!-- <textarea name="page_desc" id="page_desc" class="ckeditor" ></textarea> -->
		</div>
                </div>
                    </div>
                    
                    
                <div id="acf_section"></div>
  
   					
  
  
  
  

      	
                         
                <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  
                      	
           <input type="hidden" name="pgid" value="<?php echo $_REQUEST['pgid'];?>">
           <input type="submit" name="save_page" value="Submit" onclick="return validate_form('add_page_form');" class="btn btn-success btn-submit">
                      	
                      	
                      </div>
                    </div>
                  </form>

                </div>
             </div>
         

   