<link rel="stylesheet" type="text/css" href="https://rawgit.com/nobleclem/jQuery-MultiSelect/master/jquery.multiselect.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

 <script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script src="https://rawgit.com/nobleclem/jQuery-MultiSelect/master/jquery.multiselect.js"></script>

<script>
	function goto()
	{
		self.location = 'acf.php?type=list_acf&lp=ac';
	}
</script>
<script type="text/javascript">
function listfeature(qry1){


qry1=parseInt(qry1)+1;

$.ajax({
type: "GET",
url: "ajax_add_acf.php",
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
	function chenge_field_name(v)
	{
		
		key=$("#acf_field_label"+v).val();
		var key = key.toLowerCase();
		key=key.replace(/ /g,"-");
		$("#acf_field_name"+v).val(key);
	}
</script>


<script>
function get_sub_field(ctr,v)
{
	if(v=='Repeater')
{
	$("#repeater-sec"+ctr).show();
	}
}
</script>
<script type="text/javascript">
function listrepeatersub(row,ctr){


ctr=parseInt(ctr)+1;


$.ajax({
type: "GET",
url: "ajax_add_acf_sub.php",
dataType: 'html',
data: "row="+row+"&ctr="+ctr,
success: function(html){
	
	document.getElementById("subcount"+row).value=ctr;  
$("#repeater-sub-field-sec"+row).append(html);
},error: function(){
},complete: function(){
}
});

}
</script>
<script>
	function chenge_sub_field_name(row,ctr)
	{
		
		key=$("#acf_sub_field_label"+row+ctr).val();
		var key = key.toLowerCase();
		key=key.replace(/ /g,"-");
		$("#acf_sub_field_name"+row+ctr).val(key);
	}
</script>


<div class="x_panel">
                <div class="x_title">
                  <h2>Add New Field Group : </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_acf_form" action="" method="post" name="add_acf_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Group Name<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
							
							  <input type="text" name="acf_group_name" id="acf_group_name" class="form-control col-md-7 col-xs-12" required="required" />
                      </div>
                    </div>
                   
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Choose Template<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12 facilities1">
						<select name="acf_template[]" multiple="multiple" required="required">
						<option value="">Choose Template</option>	
						<?php
						$file_name=get_template();
						foreach($file_name as $key=>$value)
						{
						?>	
						<option value="<?= $key?>"><?= $value; ?></option>	
						<?php
						}
						?>
						</select>	  
                      </div>
                      
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Label<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="acf_field_label[]" id="acf_field_label1" class="form-control col-md-7 col-xs-12" required="required" onblur="chenge_field_name(1);"/>
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Name<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="acf_field_name[]" id="acf_field_name1" class="form-control col-md-7 col-xs-12" required="required" />
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
                       <select name="acf_field_type[]" class="form-control col-md-7 col-xs-12" onchange="get_sub_field(1,this.value);">
                       	<option value="TextBox" >TextBox</option>
                       	 	<option value="TextArea" >TextArea</option>
                       	 	<option value="Editor" >Editor</option>
                       	 	<option value="Image" >Image</option>
                       		<option value="File" >File</option>
                       		<!-- <option value="Gallery" >Gallery</option> -->
                       		<option value="Repeater" >Repeater</option>
                       </select>
                      </div>
                    </div>
                    
                    
                    
                    
                    
                    
                     <!-- Repeater FIELD -->
                   
                    
                   
                     <div class="item form-group" id="repeater-sec1" style="display:none;">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Sub Field<span class="required">*</span>
                      </label>
                      
                      <div class="col-md-6 col-sm-6 col-xs-12" >
                     <div id="repeater-sub-field-sec1">
                     <div id="repeater-sub-field11">	
	                <div class="item form-group sub-field">
	                  <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Label<span class="required">*</span>
	                  </label>
	                   <div class="col-md-6 col-sm-6 col-xs-12">
	                    <input type="text" name="acf_sub_field_label[]" id="acf_sub_field_label11" class="form-control col-md-7 col-xs-12" required="required" onblur="chenge_sub_field_name(1,1);"/>
	                   </div>
	                 </div>
	                <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Name<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="acf_sub_field_name[]" id="acf_sub_field_name11" class="form-control col-md-7 col-xs-12" required="required" />
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
                     <input type="hidden" name="subcount1" value="1" id="subcount1"> 
                   
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >&nbsp;</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      
                <input type="button" name="add_feature_plan" value="Add Sub Field" onclick="listrepeatersub(1,document.getElementById('subcount1').value);" class="btn btn-success btn-submit">
 
                      </div>
                    </div>
                	
                	
                       
                      </div>
                      
                    </div>
                    
                    
                   
                    
                                  
                        <span class="section">Add Field</span> 
                     <div id="add_feature_plan"></div>  
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Add Field
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<input type="hidden" name="hidden" value="1" id="hidden"> 
                <input type="button" name="add_feature_plan" value="Add Field" onclick="listfeature(document.getElementById('hidden').value);" class="btn btn-success btn-submit">
 
                      </div>
                    	</div>
                                    
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_acf" value="Save" onclick="return validate_form('add_acf_form');" class="btn btn-success btn-submit">
		<input type="button" name="save_attr_cancel" value="Cancel" onclick="goto();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>
  <script>
	
$(function() {
  // from http://stackoverflow.com/questions/45888/what-is-the-most-efficient-way-to-sort-an-html-selects-options-by-value-while
  var my_options = $('.facilities1 select option');
  var selected = $('.facilities1').find('select').val();

  my_options.sort(function(a,b) {
    if (a.text > b.text) return 1;
    if (a.text < b.text) return -1;
    return 0
  })

  $('.facilities1').find('select').empty().append( my_options );
  $('.facilities1').find('select').val(selected);
  
  // set it to multiple
  $('.facilities1').find('select').attr('multiple', true);
  
  // remove all option
  $('.facilities1').find('select option[value=""]').remove();
  // add multiple select checkbox feature.
  $('.facilities1').find('select').multiselect();
})



</script>            