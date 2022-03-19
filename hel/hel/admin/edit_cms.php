<!-- <script type="text/javascript">

function reload(form){
	var val = form.category.options[form.category.options.selectedIndex].value;
	self.location = 'cmspage.php?type=edit_cms&lp=adp&pgid='+val;
}

</script> -->

<script type="text/javascript">
	function listcms()
	{
		location.href = "cmspage.php?type=list_cms&lp=ord";
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
url: "ajax_add_field.php",
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
<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Content </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_home_form" action="" method="post" name="edit_home_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	<!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select Page  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <select name="category" id="category" onChange="reload(this.form);" required>
			  <option value="">Select Page</option>
			  <?php
				$category = 'SELECT * FROM '.TABLE_PREFIX.'page ';
				$category_query = g_db_query($category);
				while ($result = g_db_fetch_array($category_query)){
				?>
			  <option value="<?php print $result['id']; ?>" <?php print $result['id'] == $_REQUEST['pgid'] ? 'selected' : '' ; ?>><?php print $result['page_name']; ?></option>
			  <?php } ?>
	
		</select>
                      </div>
                    </div> -->
  	<?php 
		$pageSql = "select * from tbl_pagecontent where id='".$_REQUEST['pgid']."'";
		$pageSqlExe = mysqli_query($conn,$pageSql);
		$pageRes = mysqli_fetch_array($pageSqlExe);
		
		
	?>                  	
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
 <textarea name="meta_desc"><?php echo stripslashes(html_entity_decode($pageRes['meta_desc']));?></textarea>
                      </div>
                    </div>

                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Page Heading  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="heading"><?php echo stripslashes(html_entity_decode($pageRes['heading']));?></textarea>
                      </div>
                    </div>
                   
                      
                       	
                       	  <?php 
                    if($pageRes['banner_image']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 				
    					<?php
    					$banner_image=explode(".", $pageRes['banner_image']);
						if($banner_image[1]=='m4v' ||$banner_image[1]=='mp4' ||$banner_image[1]=='webm')
						{
						?>
						<video autoplay="" loop="" style="" muted="" playsinline="" data-wf-ignore="true" width="100">
							<source src="post_img/<?php print $pageRes['banner_image'];?>" data-wf-ignore="true"/>
						</video>
						<?php	
						}
						else
						{
						?>
						<img src="post_img/<?php print $pageRes['banner_image'];?>" height="100" width="100" />
						<?php	
						}
    					?>
 						
 						
                      </div>
                    </div>
                    <?php }?>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Image /Video
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 						<input type="file" name="banner_image" id="banner_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>  
                       	
                       	
                       	
                       	
                   
                    
                    
                      <?php 
                    if($pageRes['banner_image_webp']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    <?php
    					$banner_image=explode(".", $pageRes['banner_image_webp']);
						if($banner_image[1]=='m4v' ||$banner_image[1]=='mp4' ||$banner_image[1]=='webm')
						{
						?>
						<video autoplay="" loop="" style="" muted="" playsinline="" data-wf-ignore="true" width="100">
							<source src="post_img/<?php print $pageRes['banner_image_webp'];?>" data-wf-ignore="true"/>
						</video>
						<?php	
						}
						else
						{
						?>
						<img src="post_img/<?php print $pageRes['banner_image_webp'];?>" height="100" width="100" />
						<?php	
						}
    					?>
 						
 
                      </div>
                    </div>
                    <?php }?> 
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Banner Image/Video web
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="banner_image_webp" id="banner_image_webp" class="form-control col-md-7 col-xs-12" value=""   />
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
                    if($_REQUEST['pgid']==1)
					{
                    ?>     
                        	  
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $pageRes['feature_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                 
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Feature Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 						<input type="file" name="feature_image" id="feature_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $pageRes['feature_image_webp'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                 
                    
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Feature Image webp
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 						<input type="file" name="feature_image_webp" id="feature_image_webp" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Feature logo
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<img src="post_img/<?php print $pageRes['feature_logo'];?>" height="100" width="100" />
    						<input type="file" name="feature_logo" id="feature_logo" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                           
                    
                  	
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Feature text
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
						<?php
							$oFCKeditor = new FCKeditor('feature_desc') ;
							$oFCKeditor->BasePath	= 'fckeditor/';
							$oFCKeditor->ToolbarSet = 'Basic';
							$oFCKeditor->Width 		= '660px';
							$oFCKeditor->Height 	= '500px';
							$oFCKeditor->Value		= htmlspecialchars_decode($pageRes['feature_desc']);
								$oFCKeditor->Config['EnterMode'] = 'br';
							$oFCKeditor->Create() ;
						?>
						</div>
                		</div>
                    </div>  
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Feature Link
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="feature_link" id="feature_link" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($pageRes['feature_link']));?>" />
                      </div>
                    </div> 
                    
                      
                    
                 
                   
                      
                  
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $pageRes['feature_image1'];?>" height="100" width="100" />
 
                      </div>
                    </div>
               		
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Feature Image 2
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="feature_image1" id="feature_image1" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $pageRes['feature_image1_webp'];?>" height="100" width="100" />
 
                      </div>
                    </div>
               
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Feature Image 2 webp
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="feature_image1_webp" id="feature_image1_webp" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                    
                    
                      
                    
                    
                                 
                    
                  
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Feature text2
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
						<?php
							$oFCKeditor = new FCKeditor('feature_desc1') ;
							$oFCKeditor->BasePath	= 'fckeditor/';
							$oFCKeditor->ToolbarSet = 'Basic';
							$oFCKeditor->Width 		= '660px';
							$oFCKeditor->Height 	= '500px';
							$oFCKeditor->Value		= htmlspecialchars_decode($pageRes['feature_desc1']);
								$oFCKeditor->Config['EnterMode'] = 'br';
							$oFCKeditor->Create() ;
						?>
						</div>
                		</div>
                    </div> 
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Feature Link2 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="feature_link1" id="feature_link" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($pageRes['feature_link1']));?>" />
                      </div>
                    </div>
                    
                    <?php
                    }
                    ?>
                    
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
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Page Image 
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
		
		$pageSql = "select * from tbl_pagecontent where id='".$_REQUEST['pgid']."'";
		$pageSqlExe = mysqli_query($conn,$pageSql);
		$pageRes = mysqli_fetch_array($pageSqlExe);
		$page_desc = stripslashes(html_entity_decode($pageRes['content']));
		
			$oFCKeditor = new FCKeditor('page_desc') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($page_desc);
			$oFCKeditor->Config['EnterMode'] = 'br';
			$oFCKeditor->Create() ;
		?>
		</div>
                </div>
                    </div> 
                    
                    
                    
                        	
                    <?php
                    if($_REQUEST['pgid']==1 || $_REQUEST['pgid']==2 || $_REQUEST['pgid']==13  || $_REQUEST['pgid']==18 || $_REQUEST['pgid']==24 || $_REQUEST['pgid']==26 || $_REQUEST['pgid']==29)
					{
                    ?>   
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Page Video Image
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<img src="post_img/<?php print $pageRes['video_image'];?>" height="100" width="100" />
    						<input type="file" name="video_image" id="video_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Page Video m4v
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							File:<a target="_blank" href="post_img/<?php print $pageRes['video_mp4'];?>"><?php print $pageRes['video_mp4'];?></a>
    						<input type="file" name="video_mp4" id="video_mp4" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Page Video webm
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							File:<a target="_blank" href="post_img/<?php print $pageRes['video_webm'];?>"><?php print $pageRes['video_webm'];?></a>
    						<input type="file" name="video_webm" id="video_webm" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> -->
                    
                   <?php
                   }
                   ?>
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                     <?php 
                    if($pageRes['add_img1']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $pageRes['add_img1'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <?php }?>
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >additional Image1 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 						<input type="file" name="add_img1" id="add_img1" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > additional Content1
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<div class="txtarea-wysiwyg">
		<?php
		
		
		$add_cont2 = stripslashes(html_entity_decode($pageRes['add_cont1']));
		
			$oFCKeditor = new FCKeditor('add_cont1') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($add_cont2);
			$oFCKeditor->Config['EnterMode'] = 'br';
			$oFCKeditor->Create() ;
		?>
		</div>
     </div>
  </div> 
                
           <?php 
                    if($pageRes['add_img2']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $pageRes['add_img2'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <?php }?>
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Image2 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 						<input type="file" name="add_img2" id="add_img2" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>   
               
   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Additional Content2
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<div class="txtarea-wysiwyg">
		<?php
		
		
		$add_cont1 = stripslashes(html_entity_decode($pageRes['add_cont2']));
		
			$oFCKeditor = new FCKeditor('add_cont2') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($add_cont1);
			$oFCKeditor->Config['EnterMode'] = 'br';
			$oFCKeditor->Create() ;
		?>
		</div>
     </div>
  </div>
  

  
  <!-- <?php if($_REQUEST['pgid']=='1'){  ?>       
  	
  	 <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Counter Years <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="counter_year" id="counter_year" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($pageRes['counter_year']));?>" required="required" />
                      </div>
                    </div>
                    
     	 <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Counter Faculty <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="counter_faculty" id="counter_faculty" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($pageRes['counter_faculty']));?>" required="required" />
                      </div>
                    </div>
          	 <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Counter Recruiters <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="counter_recruit" id="counter_recruit" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($pageRes['counter_recruit']));?>" required="required" />
                      </div>
                    </div>
                     
          	 <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Counter Students <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="counter_student" id="counter_student" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($pageRes['counter_student']));?>" required="required" />
                      </div>
                    </div>
                                                           
                 <?php } ?> -->    
  	
  <?php 
                    if($pageRes['add_img3']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $pageRes['add_img3'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <?php }?>
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Image3 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 						<input type="file" name="add_img3" id="add_img3" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> 
   
  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Additional Content3
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<div class="txtarea-wysiwyg">
		<?php
		
		
			$add_cont3 = stripslashes(html_entity_decode($pageRes['add_cont3']));
			$oFCKeditor = new FCKeditor('add_cont3') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($add_cont3);
			$oFCKeditor->Create() ;
		?>
		</div>
     </div>
  </div>
  
  
  <?php 
                    if($pageRes['add_img4']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $pageRes['add_img4'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <?php }?>
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Image4 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 						<input type="file" name="add_img4" id="add_img4" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> 
  
  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Additional Content4
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<div class="txtarea-wysiwyg">
		<?php
		
		
			$add_cont4 = stripslashes(html_entity_decode($pageRes['add_cont4']));
			$oFCKeditor = new FCKeditor('add_cont4') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($add_cont4);
			$oFCKeditor->Create() ;
		?>
		</div>
     </div>
  </div>
  
  
  
   <?php 
                    if($pageRes['add_img5']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $pageRes['add_img5'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <?php }?>
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Image5 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 						<input type="file" name="add_img5" id="add_img5" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> 
<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Additional Content5
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<div class="txtarea-wysiwyg">
		<?php
		
		
			$add_cont5 = stripslashes(html_entity_decode($pageRes['add_cont5']));
			$oFCKeditor = new FCKeditor('add_cont5') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($add_cont5);
			$oFCKeditor->Create() ;
		?>
		</div>
     </div>
  </div>
  
  
  <?php 
                    if($pageRes['add_img6']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $pageRes['add_img6'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <?php }?>
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Image6 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 						<input type="file" name="add_img6" id="add_img6" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> 
  
   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Additional Content6
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<div class="txtarea-wysiwyg">
		<?php
		
		
			$add_cont6 = stripslashes(html_entity_decode($pageRes['add_cont6']));
			$oFCKeditor = new FCKeditor('add_cont6') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($add_cont6);
			$oFCKeditor->Create() ;
		?>
		</div>
     </div>
  </div> 
  
  <?php 
                    if($pageRes['add_img7']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $pageRes['add_img7'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <?php }?>
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Image7 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 						<input type="file" name="add_img7" id="add_img7" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> 
  
   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Additional Content7
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<div class="txtarea-wysiwyg">
		<?php
		
		
			$add_cont7 = stripslashes(html_entity_decode($pageRes['add_cont7']));
			$oFCKeditor = new FCKeditor('add_cont7') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($add_cont7);
			$oFCKeditor->Create() ;
		?>
		</div>
     </div>
  </div>  
  
  
   <?php 
                    if($pageRes['add_img8']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $pageRes['add_img8'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <?php }?>
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Image8 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 						<input type="file" name="add_img8" id="add_img8" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> 
  
   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Additional Content8
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<div class="txtarea-wysiwyg">
		<?php
		
		
			$add_cont8 = stripslashes(html_entity_decode($pageRes['add_cont8']));
			$oFCKeditor = new FCKeditor('add_cont8') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($add_cont8);
			$oFCKeditor->Create() ;
		?>
		</div>
     </div>
  </div>             
                    
   <?php 
                    if($pageRes['add_img9']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $pageRes['add_img9'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <?php }?>
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Image9 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 						<input type="file" name="add_img9" id="add_img9" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> 
  
   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Additional Content9
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<div class="txtarea-wysiwyg">
		<?php
		
		
			$add_cont9 = stripslashes(html_entity_decode($pageRes['add_cont9']));
			$oFCKeditor = new FCKeditor('add_cont9') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($add_cont9);
			$oFCKeditor->Create() ;
		?>
		</div>
     </div>
  </div> 
  
  
  
  
  
  
  
  
   <?php 
                    if($pageRes['add_img10']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $pageRes['add_img10'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <?php }?>
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Image10 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 						<input type="file" name="add_img10" id="add_img10" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div> 
  
   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Additional Content10
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<div class="txtarea-wysiwyg">
		<?php
		
		
			$add_cont10 = stripslashes(html_entity_decode($pageRes['add_cont10']));
			$oFCKeditor = new FCKeditor('add_cont10') ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($add_cont10);
			$oFCKeditor->Create() ;
		?>
		</div>
     </div>
  </div> 
  <!--                 
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
<?php if($_REQUEST['pgid']=='6' || $_REQUEST['pgid']=='7' || $_REQUEST['pgid']=='8' )
{
?>
        <script type="text/javascript">
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
     <div id='TextBoxesGroup'>
	<div id="TextBoxDiv1"> 
		<?php 
		$pageSql1 = "select * from tbl_cms_details where page_id='".$_REQUEST['pgid']."'";
		$pageSqlExe1 = mysqli_query($conn,$pageSql1);
		$i=1;
		while($pageRes1 = mysqli_fetch_array($pageSqlExe1))
		{
		?>  
                     <div class="ln_solid"></div>
                     <div id="sec<?php echo $i;?>">
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Content Title  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <a class="btn btn-danger btn-xs" onclick="del_field(<?php echo $pageRes1['cms_id'];?>,<?php echo $i;?>)">Delete</a>	
                      	
 <input type="text" name="additionallebel<?php echo $i;?>" id="additionallebel<?php echo $i;?>" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($pageRes1['page_heading']));?>"  required="required" />
 
 					
 					
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Content 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <div class="txtarea-wysiwyg">
						<?php
						
						
						$page_desc1 = stripslashes(html_entity_decode($pageRes1['page_details']));
						
							$oFCKeditor = new FCKeditor('additionalcontent'.$i) ;
							$oFCKeditor->BasePath	= 'fckeditor/';
							$oFCKeditor->ToolbarSet = 'Basic';
							$oFCKeditor->Width 		= '660px';
							$oFCKeditor->Height 	= '500px';
							$oFCKeditor->Value		= htmlspecialchars_decode($page_desc1);
							$oFCKeditor->Create() ;
						?>
					</div>
                </div>
                    </div> 
                    <input type="hidden" name="cms_id<?php echo $i;?>" value="<?php echo $pageRes1['cms_id'];?>">
                    </div>
                    
                    <?php 
					$i++;
		}
		?>  
                    	</div>
	</div>
                     <input type="hidden" name="reccount1" id="reccount1" value="<?= $i-1;?>"> 
                     <input type="hidden" name="hiddencount" id="hiddencount" value="1">  
                    <input type='button' value='Add Button' id='addButton'>  
      <?php 
      } 
      ?> --->
      	
                         
                <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  
                      	
           <input type="hidden" name="pgid" value="<?php echo $_REQUEST['pgid'];?>">
           <input type="submit" name="page_content" value="Submit" onclick="return validate_form('edit_home_form');" class="btn btn-success btn-submit">
           <input type="button" name="edit_cms_cancel" value="Cancel" onclick="listcms();" class="btn btn-success btn-submit">           	
                      	
                      </div>
                    </div>
                  </form>

                </div>
             </div>