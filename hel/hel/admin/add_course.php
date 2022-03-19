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
<div class="x_panel">
                <div class="x_title">
                  <h2>Add New course </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_course_form" action="" method="post" name="add_course_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
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
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Course Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="course_title" required="required" id="course_title" class="form-control col-md-7 col-xs-12"  />
                     
 
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >course Full Title <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                     
                      <input type="text" name="course_full_title" value="" required="required" id="course_full_title" class="form-control col-md-7 col-xs-12"  />
                     
                       
 
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
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Image webp 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">

 <input type="file" name="banner_image_webp" id="banner_image_webp" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                                       
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
			$oFCKeditor->Value		= '';
			$oFCKeditor->Config['EnterMode'] = 'br';
			$oFCKeditor->Create() ;
		?>
		</div>
                </div>
                    </div>
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="course_image" id="course_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                  
                    <!-- 
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image webp 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">

 <input type="file" name="course_image_webp" id="course_image_webp" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                     -->
                    
                    
                   
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Approved And Affiliated By <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <textarea name="short_desc" id="short_desc" class="form-control col-md-7 col-xs-12"></textarea>
                     
 
                      </div>
                    </div>
                    
                    
                   
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Course Pdf Upload<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
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
                			$oFCKeditor->Value		= '';
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
                	  
                     <!--  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Show in Home<span class="required">*</span>
                        
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="radio" name="show_home" id="show_home" class="flat" value="1" <?php if( $rc['show_home']==1){ echo "checked";}?> />Yes

  <input type="radio" name="show_home" id="show_home" class="flat" value="0" <?php if($rc['show_home']==0){ echo "checked";}?> />No
                      </div>
                    </div> -->
                      <span class="section"></span>
                      <div id="add_feature_plan"></div>
                   <input type="hidden" name="hidden" value="0" id="hidden"> 
                <input type="button" name="add_feature_plan" value="Add More Details" onclick="listfeature(document.getElementById('hidden').value);" class="btn btn-success btn-submit">
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_course" value="Save" onclick="return validate_form('add_course_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_event_cancel" value="Cancel" onclick="listcourse();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>