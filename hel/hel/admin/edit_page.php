<style>
input[type="file"] {
  display: block;
}
.imageThumb {
  max-height: 75px;
  border: 2px solid;
  padding: 1px;
  cursor: pointer;
}
.pip {
  display: inline-block;
  margin: 10px 10px 0 0;
}
.remove {
  display: block;
  background: #444;
  border: 1px solid black;
  color: white;
  text-align: center;
  cursor: pointer;
}
.remove:hover {
  background: white;
  color: black;
}
</style>
<script src="ckeditor/ckeditor.js" type="text/javascript"></script>

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
	
	
},error: function(){
},complete: function(){
	
	
}
});
	
}
</script>

	<?php 
		$pageSql = "select * from tbl_page where id='".$_REQUEST['page_id']."'";
		$pageSqlExe = mysqli_query($conn,$pageSql);
		$pageRes = mysqli_fetch_array($pageSqlExe);
		
		
	?>   
<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Content </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_page_form" action="" method="post" name="edit_page_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
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
						<option value="<?= $key?>" <?php if($key==$pageRes['acf_template']){ echo "selected";}?>><?= $value; ?></option>	
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
						<option value="<?= $get_page_row['id']?>" <?php if($get_page_row['id']==$pageRes['parent_page']){ echo "selected";}?>><?= $pageRes['page_name']; ?></option>	
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
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Page Heading  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="page_name" id="page_name" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($pageRes['page_name']));?>" required="required" />
                      </div>
                    </div>
                   
                   
                   <?php 
                    if($pageRes['banner_image']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 				
    					
						<img src="post_img/<?php print $pageRes['banner_image'];?>" height="100" width="100" />
						
 						
                      </div>
                    </div>
                    <?php }?>
                    
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
		
		
		$banner_heading= stripslashes(html_entity_decode($pageRes['banner_heading']));
		
			$oFCKeditor = new FCKeditor('banner_heading') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($banner_heading);
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
		
		$pageSql = "select * from tbl_page where id='".$_REQUEST['page_id']."'";
		$pageSqlExe = mysqli_query($conn,$pageSql);
		$pageRes = mysqli_fetch_array($pageSqlExe);
		$content = stripslashes(html_entity_decode($pageRes['content']));
		
			$oFCKeditor = new FCKeditor('page_desc') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($content);
			$oFCKeditor->Config['EnterMode'] = 'br';
			$oFCKeditor->Create() ;
		?>
		</div>
                </div>
                    </div> 
                    
                    
                    <div id="acf_section">
                    	<?php
  $template=$pageRes['acf_template']; 
  $get_template_sql="select * from  tbl_acf_template where acf_template='".$template."' order by acf_id asc";
  $get_template_rs=mysqli_query($conn,$get_template_sql);
 while($get_template_row=mysqli_fetch_array($get_template_rs))
 {
 	$get_acf_sql="select * from tbl_acf where acf_id='".$get_template_row['acf_id']."'";
	$get_acf_rs=mysqli_query($conn,$get_acf_sql);
	$get_acf_row=mysqli_fetch_array($get_acf_rs);
?>
  <span class="section"><?php echo $get_acf_row['acf_group_name'];?></span>   
<?php	
	$get_acf_field_sql="select * from tbl_acf_field where acf_id='".$get_template_row['acf_id']."'";
	$get_acf_field_rs=mysqli_query($conn,$get_acf_field_sql);
	while($get_acf_field_row=mysqli_fetch_array($get_acf_field_rs))
	{
		
		$get_page_meta_sql="select * from tbl_page_meta where acf_field_id='".$get_acf_field_row['acf_field_id']."' and page_id='".$_REQUEST['page_id']."'";
		$get_page_meta_rs=mysqli_query($conn,$get_page_meta_sql);
		$get_page_meta_row=mysqli_fetch_array($get_page_meta_rs);
 ?>

					<?php
					if($get_acf_field_row['acf_field_type']=='TextBox')
					{
					?>
					<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?php echo $get_acf_field_row['acf_field_label'];?><span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="acf[<?php echo $get_acf_field_row['acf_field_id'];?>]" id="acf_<?php echo $get_acf_field_row['acf_field_id'];?>" class="form-control col-md-7 col-xs-12" <?php if($get_acf_field_row['acf_required']==1){?>required="required"<?php }?> value="<?php echo $get_page_meta_row['meta_value'];?>"/>
                      
                      </div>
                    </div>
					<?php	
					}
					else if($get_acf_field_row['acf_field_type']=='TextArea')
					{
					?>
					<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?php echo $get_acf_field_row['acf_field_label'];?><span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<textarea name="acf[<?php echo $get_acf_field_row['acf_field_id'];?>]" id="acf_<?php echo $get_acf_field_row['acf_field_id'];?>" class="form-control col-md-7 col-xs-12" <?php if($get_acf_field_row['acf_required']==1){?>required="required"<?php }?> ><?php echo $get_page_meta_row['meta_value'];?></textarea>
                      
                       
                      </div>
                    </div>
					<?php	
					}
					else if($get_acf_field_row['acf_field_type']=='Editor')
					{
					?>
					<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?php echo $get_acf_field_row['acf_field_label'];?><span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<!-- <textarea name="acf[<?php echo $get_acf_field_row['acf_field_id'];?>]" id="acf_<?php echo $get_acf_field_row['acf_field_id'];?>" class="ckeditor" <?php if($get_acf_field_row['acf_required']==1){?>required="required"<?php }?> ><?php echo $get_page_meta_row['meta_value'];?></textarea> -->
                      	
                      	<div class="txtarea-wysiwyg">
                      	<?php
		
		
		
		 $field_name="acf_".$get_acf_field_row['acf_field_id'];
		 $field_value= stripslashes(html_entity_decode($get_page_meta_row['meta_value']));
		 
			$oFCKeditor = new FCKeditor($field_name) ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		=  htmlspecialchars_decode($field_value);
			$oFCKeditor->Config['EnterMode'] = 'br';
			$oFCKeditor->Create() ;
		?>
                      </div>
                       
                      </div>
                    </div>
					<?php	
					}
					else if($get_acf_field_row['acf_field_type']=='Image')
					{
					?>
					<?php
					if($get_page_meta_row['meta_value']!='')
					{
					?>
					<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >&nbsp;</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      
                      <img src="post_img/<?php echo $get_page_meta_row['meta_value'];?>" height="100" width="100" id="prev_image_<?php echo $get_acf_field_row['acf_field_id'];?>"/>
                      
                       
                      </div>
                    </div>
                    <?php
					}
                    ?>
                    
					<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?php echo $get_acf_field_row['acf_field_label'];?><span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	 
                      <input type="file" name="acf[<?php echo $get_acf_field_row['acf_field_id'];?>]" id="acf_<?php echo $get_acf_field_row['acf_field_id'];?>" class="form-control col-md-7 col-xs-12"  accept="image/*"/>
                      	
                      	 
                       
                      </div>
                    </div>
                    
 <script>
	function readURL(input) {

  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function(e) {
      $('#prev_image_<?php echo $get_acf_field_row['acf_field_id'];?>').attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}

$("#acf_<?php echo $get_acf_field_row['acf_field_id'];?>").change(function() {
  readURL(this);
});
</script>
					<?php	
					}
					else if($get_acf_field_row['acf_field_type']=='Gallery')
					{
					?>
					<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?php echo $get_acf_field_row['acf_field_label'];?><span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	
                      <input type="file" name="acf[<?php echo $get_acf_field_row['acf_field_id'];?>][]" id="acf_<?php echo $get_acf_field_row['acf_field_id'];?>" class="form-control col-md-7 col-xs-12" <?php if($get_acf_field_row['acf_required']==1){?>required="required"<?php }?> multiple accept="image/*"  />
                      
                       
                      </div>
                    </div>
                    
                    <script>
$(document).ready(function() {
  if (window.File && window.FileList && window.FileReader) {
    $("#acf_<?php echo $get_acf_field_row['acf_field_id'];?>").on("change", function(e) {
      var files = e.target.files,
        filesLength = files.length;
      for (var i = 0; i < filesLength; i++) {
        var f = files[i]
        var fileReader = new FileReader();
        fileReader.onload = (function(e) {
        	
          var file = e.target;
          $("<span class=\"pip\">" +
            "<img class=\"imageThumb\" src=\"" + e.target.result + "\" title=\"" + file.name + "\"/>" +
            "<br/><span class=\"remove\">Remove</span>" +
            "</span>").insertBefore("#acf_<?php echo $get_acf_field_row['acf_field_id'];?>");
          $(".remove").click(function(){
            $(this).parent(".pip").remove();
            });
          
          // Old code here
          /*$("<img></img>", {
            class: "imageThumb",
            src: e.target.result,
            title: file.name + " | Click to remove"
          }).insertAfter("#files").click(function(){$(this).remove();});*/
          
        });
        fileReader.readAsDataURL(f);
      }
    });
  } else {
    alert("Your browser doesn't support to File API")
  }
});

</script>
					<?php	
					}
					else if($get_acf_field_row['acf_field_type']=='file')
					{
					?>
					<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?php echo $get_acf_field_row['acf_field_label'];?><span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <a href="post_img/<?php echo $get_page_meta_row['meta_value'];?>">Download</a>	
                      </div>
                    </div>
                    
					<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?php echo $get_acf_field_row['acf_field_label'];?><span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="file" name="acf[<?php echo $get_acf_field_row['acf_field_id'];?>]" id="acf_<?php echo $get_acf_field_row['acf_field_id'];?>" class="form-control col-md-7 col-xs-12" <?php if($get_acf_field_row['acf_required']==1){?>required="required"<?php }?> />
                      	
                       
                      </div>
                    </div>
					<?php	
					}
					else if($get_acf_field_row['acf_field_type']=='Repeater')
					{
						
					?>
					
					<?php	
					}
                    ?>
				
					<input type="hidden" name="acf_field_id[]" value="<?php echo $get_acf_field_row['acf_field_id'];?>">
					 <input type="hidden" name="acf_id[<?php echo $get_acf_field_row['acf_field_id'];?>]" value="<?php echo $get_acf_field_row['acf_id'];?>">
                      	 <input type="hidden" name="acf_key[<?php echo $get_acf_field_row['acf_field_id'];?>]" value="<?php echo $get_acf_field_row['acf_field_name'];?>">
					 <input type="hidden" name="acf_type[<?php echo $get_acf_field_row['acf_field_id'];?>]" value="<?php echo $get_acf_field_row['acf_field_type'];?>">
<?php
	}
  }
  
                	?>
                    </div>
     
      	
                         
                <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  
                      	
           <input type="hidden" name="pgid" value="<?php echo $_REQUEST['page_id'];?>">
           <input type="submit" name="edit_page" value="Submit" onclick="return validate_form('edit_page_form');" class="btn btn-success btn-submit">
                      	
                      	
                      </div>
                    </div>
                  </form>

                </div>
             </div>