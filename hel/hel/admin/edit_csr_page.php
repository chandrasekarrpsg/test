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
		self.location = 'csr_page.php?type=list_csr_page&lp=ac';
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
		$csr_pageSql = "select * from tbl_csr_page where id='".$_REQUEST['csr_page_id']."'";
		$csr_pageSqlExe = mysqli_query($conn,$csr_pageSql);
		$csr_pageRes = mysqli_fetch_array($csr_pageSqlExe);
		
		
	?>   
<div class="x_panel">
                <div class="x_title">
                  <h2>Edit CSR Page </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_csr_page_form" action="" method="post" name="edit_csr_page_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
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
						<option value="<?= $key?>" <?php if($key==$csr_pageRes['acf_template']){ echo "selected";}?>><?= $value; ?></option>	
						<?php
						}
						?>
						</select>	  
                      </div>
                      
                    </div>
                  	<!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Parent Page<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12 facilities1">
						<select name="parent_page"  required="required" class="form-control col-md-7 col-xs-12">
						<option value="0">No Parent</option>	
						<?php
						 $get_csr_page_sql="select * from tbl_csr_page where id!='".$_REQUEST['csr_page_id']."' order by page_name asc";
						$get_csr_page_rs=mysqli_query($conn,$get_csr_page_sql);
						while($get_csr_page_row=mysqli_fetch_array($get_csr_page_rs))
						{
						?>	
						<option value="<?= $get_csr_page_row['id']?>" <?php if($get_csr_page_row['id']==$csr_pageRes['parent_page']){ echo "selected";}?>><?= $get_csr_page_row['page_name']; ?></option>	
						<?php
						}
						?>
						</select>	  
                      </div>
                      
                    </div> -->
                 	
                  	   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Title  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="meta_title" id="meta_title" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($csr_pageRes['meta_title']));?>" required="required" />
                      </div>
                    </div>
                     
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Keyword  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="meta_keyword" id="meta_keyword" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($csr_pageRes['meta_keyword']));?>" required="required" />
                      </div>
                    </div>
                     
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Meta Description 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="meta_desc" class="form-control col-md-7 col-xs-12"><?php echo stripslashes(html_entity_decode($csr_pageRes['meta_desc']));?></textarea>
                      </div>
                    </div>
                 
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Page Name  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="page_name" id="page_name" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($csr_pageRes['page_name']));?>" required="required" />
                      </div>
                    </div>
                   
                   
                   <?php 
                    if($csr_pageRes['banner_image']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 				
    					
						<img src="post_img/<?php print $csr_pageRes['banner_image'];?>" height="100" width="100" />
						
 						
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
		
		
		$banner_heading= stripslashes(html_entity_decode($csr_pageRes['banner_heading']));
		
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
                    if($csr_pageRes['page_image']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 						<img src="post_img/<?php print $csr_pageRes['page_image'];?>" height="100" width="100" />
 
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
	
		$content = stripslashes(html_entity_decode($csr_pageRes['content']));
		
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
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Page Video Image
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      		<?php
                      		if($csr_pageRes['video_image']!='')
							{
                      		?>
 							<img src="post_img/<?php print $csr_pageRes['video_image'];?>" height="100" width="100" />
 							<?php
							}
 							?>
    						<input type="file" name="video_image" id="video_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Page Video m4v
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<?php
                      		if($csr_pageRes['video_mp4']!='')
							{
                      		?>
 							File:<a target="_blank" href="post_img/<?php print $csr_pageRes['video_mp4'];?>"><?php print $csr_pageRes['video_mp4'];?></a>
 							<?php
							}
 							?>
    						<input type="file" name="video_mp4" id="video_mp4" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                    
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
		$pageSql1 = "select * from tbl_csr_details where page_id='".$_REQUEST['csr_page_id']."'";
		$pageSqlExe1 = mysqli_query($conn,$pageSql1);
		$i=1;
		while($pageRes1 = mysqli_fetch_array($pageSqlExe1))
		{
		?>  
                     <div class="ln_solid"></div>
                     <div id="sec<?php echo $i;?>">
                    
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Content Title  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      
                      	
 <input type="text" name="additionallebel<?php echo $i;?>" id="additionallebel<?php echo $i;?>" class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($pageRes1['page_heading']));?>"  required="required" />
 
 					
 					
                      </div>
                    </div> -->
                    
                     <?php 
                    if($pageRes1['page_image']!=''){
                    ?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 				
    					
						<img src="post_img/<?php print $pageRes1['page_image'];?>" height="100" width="100" />
						
 						
                      </div>
                    </div>
                    <?php }?>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Image<?php echo $i;?>  
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                    	
                      	
 <input type="file" name="additionalimage<?php echo $i;?>" id="additionalimage<?php echo $i;?>" class="form-control col-md-7 col-xs-12"  />
 <a class="btn btn-danger btn-xs" onclick="del_field(<?php echo $pageRes1['id'];?>,<?php echo $i;?>)">Delete</a>	
 					
 					
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Content<?php echo $i;?> 
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
                    <input type="hidden" name="id<?php echo $i;?>" value="<?php echo $pageRes1['id'];?>">
                    </div>
                    
                    <?php 
					$i++;
		}
		?>  
                    	</div>
	</div>
                     <input type="hidden" name="reccount1" id="reccount1" value="<?= $i-1;?>"> 
                     <input type="hidden" name="hiddencount" id="hiddencount" value="1">  
                    <input type='button' value='Add More' id='addButton'>  
     
      	
                         
                <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  
                      	
           <input type="hidden" name="pgid" value="<?php echo $_REQUEST['csr_page_id'];?>">
           <input type="submit" name="edit_csr_page" value="Submit" onclick="return validate_form('edit_csr_page_form');" class="btn btn-success btn-submit">
            <input type="button" name="csr_cancel" value="Cancel" onclick="goto();" class="btn btn-success btn-submit">
                      	
                      	
                      </div>
                    </div>
                  </form>

                </div>
             </div>