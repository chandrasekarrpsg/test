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
 <?php include 'includes/top.php'; ?>
  <?php 
  $template=$_REQUEST['template']; 
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
 ?>

					<?php
					if($get_acf_field_row['acf_field_type']=='TextBox')
					{
					?>
					<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?php echo $get_acf_field_row['acf_field_label'];?><span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="acf[<?php echo $get_acf_field_row['acf_field_id'];?>]" id="acf_<?php echo $get_acf_field_row['acf_field_id'];?>" class="form-control col-md-7 col-xs-12" <?php if($get_acf_field_row['acf_required']==1){?>required="required"<?php }?> />
                        
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
                      	<textarea name="acf[<?php echo $get_acf_field_row['acf_field_id'];?>]" id="acf_<?php echo $get_acf_field_row['acf_field_id'];?>" class="form-control col-md-7 col-xs-12" <?php if($get_acf_field_row['acf_required']==1){?>required="required"<?php }?> ></textarea>
                      
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
                      	<textarea name="acf[<?php echo $get_acf_field_row['acf_field_id'];?>]" id="acf_<?php echo $get_acf_field_row['acf_field_id'];?>" class="ckeditor" <?php if($get_acf_field_row['acf_required']==1){?>required="required"<?php }?> ></textarea>
                      
                      </div>
                    </div>
                    
                    <script type="text/javascript">
    				CKEDITOR.replace('acf_<?php echo $get_acf_field_row['acf_field_id'];?>');
  					</script>
					
					<?php	
					}
					else if($get_acf_field_row['acf_field_type']=='Image')
					{
					?>
					<div class="item form-group" style="d">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >&nbsp;</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      
                      <img src="post_img/<?php echo $get_page_meta_row['meta_value'];?>" height="100" width="100" id="prev_image_<?php echo $get_acf_field_row['acf_field_id'];?>"/>
                      
                       
                      </div>
                    </div>
					<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?php echo $get_acf_field_row['acf_field_label'];?><span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="file" name="acf[<?php echo $get_acf_field_row['acf_field_id'];?>]" id="acf_<?php echo $get_acf_field_row['acf_field_id'];?>" class="form-control col-md-7 col-xs-12" <?php if($get_acf_field_row['acf_required']==1){?>required="required"<?php }?> accept="image/*"/>
                      	 
                       
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
                      <input type="file" name="acf[<?php echo $get_acf_field_row['acf_field_id'];?>][]" id="acf_<?php echo $get_acf_field_row['acf_field_id'];?>" class="form-control col-md-7 col-xs-12" <?php if($get_acf_field_row['acf_required']==1){?>required="required"<?php }?> multiple accept="image/*"/>
                      	
                       
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
                      <input type="file" name="acf[<?php echo $get_acf_field_row['acf_field_id'];?>]" id="acf_<?php echo $get_acf_field_row['acf_field_id'];?>" class="form-control col-md-7 col-xs-12" <?php if($get_acf_field_row['acf_required']==1){?>required="required"<?php }?> />
                      	
                       
                      </div>
                    </div>
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
