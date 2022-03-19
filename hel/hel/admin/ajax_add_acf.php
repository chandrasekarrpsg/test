<?php 
include 'includes/top.php'; 
 include 'fckeditor/fckeditor.php';

  ?>
  <?php
 
  $dt=  $_REQUEST['q'];?>

<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Label<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="acf_field_label[]" id="acf_field_label<?= $dt;?>" class="form-control col-md-7 col-xs-12" required="required" onblur="chenge_field_name(<?= $dt;?>);"/>
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Name<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="acf_field_name[]" id="acf_field_name<?= $dt;?>" class="form-control col-md-7 col-xs-12" required="required" />
                        (Single word, no spaces. Underscores and dashes allowed)
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Required?<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                       <select name="acf_required[]" class="form-control col-md-7 col-xs-12" required="required">
                       
                       		<option value="1" >Yes</option>
                       			<option value="0" selected>No</option>
                       		
                       </select>
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Type<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                       <select name="acf_field_type[]" class="form-control col-md-7 col-xs-12" onchange="get_sub_field(<?= $dt;?>,this.value);">
                       	<option value="TextBox"  selected>TextBox</option>
                       	 	<option value="TextArea" >TextArea</option>
                       	 	<option value="Editor" >Editor</option>
                       	 	<option value="Image" >Image</option>
                       		<option value="File" >File</option>
                       		<!-- <option value="Gallery" >Gallery</option> -->
                       		<option value="Repeater" >Repeater</option>
                       </select>
                      </div>
                    </div>
                     
                     
                     <div class="item form-group" id="repeater-sec<?= $dt;?>" style="display:none;">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Sub Field<span class="required">*</span>
                      </label>
                      
                      <div class="col-md-6 col-sm-6 col-xs-12" >
                     <div id="repeater-sub-field-sec<?= $dt;?>">
                     <div id="repeater-sub-field<?= $dt;?>1">	
	                <div class="item form-group sub-field">
	                  <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Label<span class="required">*</span>
	                  </label>
	                   <div class="col-md-6 col-sm-6 col-xs-12">
	                    <input type="text" name="acf_sub_field_label[]" id="acf_sub_field_label<?= $dt;?>1" class="form-control col-md-7 col-xs-12" required="required" onblur="chenge_sub_field_name(<?= $dt;?>,1);"/>
	                   </div>
	                 </div>
	                <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Name<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="acf_sub_field_name[]" id="acf_sub_field_name<?= $dt;?>1" class="form-control col-md-7 col-xs-12" required="required" />
                         (Single word, no spaces. Underscores and dashes allowed)
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Required?<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                       <select name="acf_sub_required[]" class="form-control col-md-7 col-xs-12">
                       		<option value="1" >Yes</option>
                       		<option value="0" selected>No</option>
                       </select>
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Type<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                       <select name="acf_sub_field_type[]" class="form-control col-md-7 col-xs-12" >
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
                	
                    </div> 
                     <input type="hidden" name="subcount<?= $dt;?>" value="1" id="subcount<?= $dt;?>"> 
                   
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >&nbsp;</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      
                <input type="button" name="add_feature_plan" value="Add Sub Field" onclick="listrepeatersub(<?= $dt;?>,document.getElementById('subcount<?= $dt;?>').value);" class="btn btn-success btn-submit">
 
                      </div>
                    </div>
                	
                	
                       
                      </div>
                      
                    </div>
                     
                     
                     
                     
 <span class="section"></span>                   