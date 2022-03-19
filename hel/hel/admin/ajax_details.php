<?php
include 'conn.php';
?>
<?php include 'fckeditor/fckeditor.php'; ?>
 <?php
    $_REQUEST['q'];
  $dt=  $_REQUEST['q'];?>
   
   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Details Title <?= $dt;?>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="course_details_title_<?= $dt;?>" id="course_details_title_<?= $dt;?>" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
  
<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Details content <?php echo  $dt; ?>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
		<?php
			$oFCKeditor = new FCKeditor('course_details_desc'.$dt) ;
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

<input type="hidden" value="<?= $dt;?>" name="course_details_id[]">			