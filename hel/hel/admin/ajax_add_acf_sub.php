<?php 
include 'includes/top.php'; 
 include 'fckeditor/fckeditor.php';

  ?>
  <?php
   $row=  $_REQUEST['row'];
  $ctr=  $_REQUEST['ctr'];
  
  ?>

 <span class="section"></span>  
					<div id="repeater-sub-field<?= $row;?><?= $ctr;?>">	
	                <div class="item form-group sub-field">
	                  <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Label<span class="required">*</span>
	                  </label>
	                   <div class="col-md-6 col-sm-6 col-xs-12">
	                    <input type="text" name="acf_sub_field_label[]" id="acf_sub_field_label<?= $row;?><?= $ctr;?>" class="form-control col-md-7 col-xs-12" required="required" onblur="chenge_sub_field_name(<?= $row;?>,<?= $ctr;?>);"/>
	                   </div>
	                 </div>
	                <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Name<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="acf_sub_field_name[]" id="acf_sub_field_name<?= $row;?><?= $ctr;?>" class="form-control col-md-7 col-xs-12" required="required" />
                         (Single word, no spaces. Underscores and dashes allowed)
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Required?<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                       <select name="acf_required[]" class="form-control col-md-7 col-xs-12">
                       		<option value="1" >Yes</option>
                       		<option value="0" selected>No</option>
                       </select>
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Type<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                       <select name="acf_field_type[]" class="form-control col-md-7 col-xs-12" >
                       	<option value="TextBox" >TextBox</option>
                       	 	<option value="TextArea" >TextArea</option>
                       	 	<option value="Editor" >Editor</option>
                       	 	<option value="Image" >Image</option>
                       		<option value="File" >File</option>
                       		<!-- <option value="Gallery" >Gallery</option> -->
                       		
                       </select>
                      </div>
                	</div>
                	</div>
                 