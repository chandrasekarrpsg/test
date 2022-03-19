<?php
$course_id = $_REQUEST['course_id'];
$sl = 'SELECT * FROM  tbl_course WHERE course_id = "'.$course_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listcourse()
	{
		location.href = "course.php?type=list_course&lp=cu";
	}
</script>
<script type="text/javascript">
function listfeature(qry1){


qry1=parseInt(qry1)+1;

$.ajax({
type: "GET",
url: "ajax_details.php",
dataType: 'html',
data: "q="+qry1,
success: function(html){
	console.log(html);
	
	document.getElementById("hidden").value=qry1;  
$("#add_feature_plan").append(html);
},error: function(){
},complete: function(){
}
});

}
</script>
<script>
function del_attr_val(attr)
{

		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		$.ajax({
type: "GET",
url: "ajax_del_details_val.php",
dataType: 'html',
data: "q="+attr,
success: function(html){
alert(html);
location.reload(); 
},error: function(){
},complete: function(){
}
});
		}
		else
		{
		return false;
		}	

	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Edit course </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_course_form" action="" method="post" name="edit_course_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                  	 	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="meta_title" required="required" id="meta_title" class="form-control col-md-7 col-xs-12" value="<?php echo stripcslashes(html_entity_decode($rc['meta_title']));?>" />
                     
 
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Keyword <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="meta_keyword" required="required" id="meta_keyword" class="form-control col-md-7 col-xs-12" value="<?php echo stripcslashes(html_entity_decode($rc['meta_keyword']));?>" />
                     
 
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Description <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                       <textarea name="meta_desc" id="meta_desc" class="form-control col-md-7 col-xs-12"><?php echo stripcslashes(html_entity_decode($rc['meta_desc']));?></textarea>
                      </div>
                    </div>
                    
                    	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >course Name <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                     
                      <input type="text" name="course_title" value="<?php echo stripcslashes(html_entity_decode($rc['course_title']));?>" required="required" id="course_title" class="form-control col-md-7 col-xs-12"  />
                     
                       
 
                      </div>
                    </div>
                    
                  	   	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >course Full Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                     
                      <input type="text" name="course_full_title" value="<?php echo stripcslashes(html_entity_decode($rc['course_full_title']));?>" required="required" id="course_full_title" class="form-control col-md-7 col-xs-12"  />
                     
                       
 
                      </div>
                    </div>
                    <?php 
                    if($rc['banner_image']!='noimage.jpg'){
                    ?>
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['banner_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <?php } ?>
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="banner_image" id="banner_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                     <?php 
                    if($rc['banner_image_webp']!='noimage.jpg'){
                    ?>
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['banner_image_webp'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <?php } ?>
                    
                    
                    
                  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Image webp 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">

 <input type="file" name="banner_image_webp" id="banner_image_webp"  class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                    
                     <?php 
                    if($rc['course_image']!='noimage.jpg'){
                    ?>
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['course_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <?php } ?>
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="course_image" id="course_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                    <!--  <?php 
                    if($rc['course_image_webp']!='noimage.jpg'){
                    ?>
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['course_image_webp'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <?php } ?>
                    
                    
                    
                  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image webp 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">

 <input type="file" name="course_image_webp" id="course_image_webp"  class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> -->
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Banner Heading
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<div class="txtarea-wysiwyg">
		<?php
		
		
		$banner_heading= stripslashes(html_entity_decode($pageRes['banner_heading']));
		
			$oFCKeditor = new FCKeditor('banner_heading') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '100%';
            $oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($rc['banner_heading']);
			$oFCKeditor->Config['EnterMode'] = 'br';
			$oFCKeditor->Create() ;
		?>
		</div>
                </div>
                    </div>
                    
                    
                    
                     
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Approved And Affiliated By <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <textarea name="short_desc" id="short_desc" class="form-control col-md-7 col-xs-12"><?php echo stripcslashes(html_entity_decode($rc['short_desc']));?></textarea>
                     
 
                      </div>
                    </div>
                    
                    
                     
                    
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Course Pdf Upload<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<a href="pdf_folder/<?= $rc['course_pdf']; ?>">Download</a>
 <input type="file" name="course_pdf" id="course_pdf" value="" class="form-control col-md-7 col-xs-12" />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >About This Course
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
                		<?php
                			$oFCKeditor = new FCKeditor('content') ;
                			$oFCKeditor->BasePath	= 'fckeditor/';
                			$oFCKeditor->ToolbarSet = 'Basic';
                			$oFCKeditor->Width 		= '100%';
                			$oFCKeditor->Height 	= '500px';
                			$oFCKeditor->Value		= htmlspecialchars_decode($rc['content']);
								$oFCKeditor->Config['EnterMode'] = 'br';
                			$oFCKeditor->Create() ;
                		?>
                		</div></div>
                	  </div>     
                
                	  
                	    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Form Content
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
                		<?php
                			$oFCKeditor = new FCKeditor('form_content') ;
                			$oFCKeditor->BasePath	= 'fckeditor/';
                			$oFCKeditor->ToolbarSet = 'Basic';
                			$oFCKeditor->Width 		= '100%';
                			$oFCKeditor->Height 	= '500px';
                			$oFCKeditor->Value		= htmlspecialchars_decode($rc['form_content']);
								$oFCKeditor->Config['EnterMode'] = 'br';
                			$oFCKeditor->Create() ;
                		?>
                		</div></div>
                	  </div>     
                	  	  
                	   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Admission Enquiry
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
                		<?php
                			$oFCKeditor = new FCKeditor('admission_cont') ;
                			$oFCKeditor->BasePath	= 'fckeditor/';
                			$oFCKeditor->ToolbarSet = 'Basic';
                			$oFCKeditor->Width 		= '100%';
                			$oFCKeditor->Height 	= '500px';
                			$oFCKeditor->Value		= htmlspecialchars_decode($rc['admission_cont']);
								$oFCKeditor->Config['EnterMode'] = 'br';
                			$oFCKeditor->Create() ;
                		?>
                		</div></div>
                	  </div>     
                	  
                	        
          
                 
        <!--     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Show in Home<span class="required">*</span>
                        
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="radio" name="show_home" id="show_home" class="flat" value="1" <?php if( $rc['show_home']==1){ echo "checked";}?> />Yes

  <input type="radio" name="show_home" id="show_home" class="flat" value="0" <?php if($rc['show_home']==0){ echo "checked";}?> />No
                      </div>
                    </div> -->
                    <span class="section">All Detail</span>  
                    
 	<?php
$sql = "select * from   tbl_course_details where course_id='".$rc['course_id']."'  order by course_details_id asc";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
if($count>0){
?>

<?php while($result = mysqli_fetch_array($exe)){
	
	
	?>                
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Details Title <?= $rowCount;?>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="edit_course_details_title_<?php echo $result['course_details_id'];?>" id="edit_course_details_title_<?php echo $result['course_details_id'];?>" value="<?= $result['course_details_title']; ?>" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
  
<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Details content <?php echo  $rowCount; ?>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('edit_course_details_desc'.$result['course_details_id']) ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '100%';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($result['course_details_desc']);
			$oFCKeditor->Config['EnterMode'] = 'br';
			$oFCKeditor->Create() ;
		?>
		</div></div>
	  </div>
	   <input type="hidden" name="edit_course_details_id[]" value="<?php echo $result['course_details_id'];?>">
	   <div class="item form-group">
             <input type="button" name="del_attribute_val" value="Delete" onclick="del_attr_val(<?php echo $result['course_details_id'];?>);" style="float:left;">   
       </div> 
	    <span class="section"></span>
		<?php
	$rowCount ++;
}

}?>
    
                    <span class="section"></span>  
                 <div id="add_feature_plan"></div>
                 <input type="hidden" name="hidden" value="<?php echo $count; ?>" id="hidden"> 
                <input type="button" name="add_feature_plan" value="Add Details" onclick="listfeature(document.getElementById('hidden').value);" class="btn btn-success btn-submit">
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="course_id" value="<?php print $rc['course_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_course" value="Update" onclick="return validate_form('edit_course_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_course_cancel" value="Cancel" onclick="listcourse();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>