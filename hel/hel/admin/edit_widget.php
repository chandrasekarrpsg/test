<?php $sl = 'SELECT * FROM  tbl_widget WHERE widget_id = 1';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>


<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Widget </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_widget_form" action="" method="post" name="edit_widget_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Copyright<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="widget_copyright"><?php echo stripslashes(html_entity_decode($rc['widget_copyright']));?></textarea>
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Admin Email<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="widget_admin_email"><?php echo stripslashes(html_entity_decode($rc['widget_admin_email']));?></textarea>
                      </div>
                    </div> 
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Rate Image
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<img src="post_img/<?php print $rc['rate_image'];?>" height="100" width="50%" />
    						<input type="file" name="rate_image" id="rate_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Rate Image Title<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="rate_title"><?php echo stripslashes(html_entity_decode($rc['rate_title']));?></textarea>
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Rate Image sub Title<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="rate_title1"><?php echo stripslashes(html_entity_decode($rc['rate_title1']));?></textarea>
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Rate <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="rate"><?php echo stripslashes(html_entity_decode($rc['rate']));?></textarea>
                      </div>
                    </div>
                    
                    
                    
                           <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Rate Image1
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<img src="post_img/<?php print $rc['rate_image1'];?>" height="100" width="50%" />
    						<input type="file" name="rate_image1" id="rate_image1" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Rate Image Title1<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="rate_title2"><?php echo stripslashes(html_entity_decode($rc['rate_title2']));?></textarea>
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Rate Image sub Title1<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="rate_title3"><?php echo stripslashes(html_entity_decode($rc['rate_title3']));?></textarea>
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Rate1 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="rate2"><?php echo stripslashes(html_entity_decode($rc['rate2']));?></textarea>
                      </div>
                    </div>  -->
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Developer Site<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="widget_developer_site"><?php echo stripslashes(html_entity_decode($rc['widget_developer_site']));?></textarea>
                      </div>
                    </div>
                    
                
                    
                    
                     <!--    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Design By 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="widget_design_by"><?php echo stripslashes(html_entity_decode($rc['widget_design_by']));?></textarea>
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Other<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="widget_fashion_enquiry"><?php echo stripslashes(html_entity_decode($rc['widget_fashion_enquiry']));?></textarea>
                      </div>
                    </div>
                       -->
                        <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Designing Works Production Title<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="feature_title"><?php echo stripslashes(html_entity_decode($rc['feature_title']));?></textarea>
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Designing Works Production Title Description<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="feature_desc"><?php echo stripslashes(html_entity_decode($rc['feature_desc']));?></textarea>
                      </div>
                    </div> -->
                   
                             <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Footer Content
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
                		<?php
                			$oFCKeditor = new FCKeditor('foot_content') ;
                			$oFCKeditor->BasePath	= 'fckeditor/';
                			//$oFCKeditor->ToolbarSet = 'Basic';
                			$oFCKeditor->Width 		= '660px';
                			$oFCKeditor->Height 	= '500px';
                			$oFCKeditor->Value		= htmlspecialchars_decode($rc['foot_content']);
                			$oFCKeditor->Create() ;
                		?>
                		</div>
                     </div>
                    </div>     
                    
   
                     <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="edit_widget" value="Update" onclick="return validate_form('edit_widget_form');" class="btn btn-success btn-submit">
                      	
                      	
                   
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>