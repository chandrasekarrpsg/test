<?php 
include_once('includes/top.php'); ?>
<?php include 'fckeditor/fckeditor.php'; ?>
<?php  $_REQUEST['counter']; ?>
<div class="ln_solid"></div>
<!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Content Title  <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="addlebel<?php echo $_REQUEST['counter']; ?>" id="addlebel<?php echo $_REQUEST['counter']; ?>"  class="form-control col-md-7 col-xs-12" value="<?php echo stripslashes(html_entity_decode($pageRes['heading']));?>" required="required" />
                      </div>
                    </div> -->
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Additional Image  
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="addimage<?php echo $_REQUEST['counter']; ?>" id="addimage<?php echo $_REQUEST['counter']; ?>"  class="form-control col-md-7 col-xs-12"   />
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Additional Content 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
		
		
		
			$oFCKeditor = new FCKeditor('addcontent'.$_REQUEST['counter']) ;
			$oFCKeditor->BasePath	= 'fckeditor/';
			//$oFCKeditor->ToolbarSet = 'Basic';
			$oFCKeditor->Width 		= '660px';
			$oFCKeditor->Height 	= '500px';
			$oFCKeditor->Value		= htmlspecialchars_decode($page_desc);
			$oFCKeditor->Create() ;
		?>
		</div>
                </div>
                    </div>   
