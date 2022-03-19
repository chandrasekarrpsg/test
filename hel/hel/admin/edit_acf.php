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
function del_attr_val(attr)
{

		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		$.ajax({
type: "GET",
url: "ajax_del_acf.php",
dataType: 'html',
data: "q="+attr,
success: function(html){

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
<script>
	function chenge_field_name(v)
	{
		key=$("#acf_field_label_edit"+v).val();
		var key = key.toLowerCase();
		key=key.replace(/ /g,"-");
		$("#acf_field_name_edit"+v).val(key);
	}
</script>
<?php
$cid = $_REQUEST['acf_id'];
$sl = 'SELECT * FROM '.TABLE_PREFIX.'acf  WHERE acf_id = "'.$cid.'"';
$q  = g_db_query($sl);
$rc = g_db_fetch_array($q);
?>
<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Field Group : </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_acf_form" action="" method="post" name="add_acf_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                  	
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Group Name<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
							
							  <input type="text" name="acf_group_name" id="acf_group_name" value="<?php echo $rc['acf_group_name'];?>" class="form-control col-md-7 col-xs-12" required="required" />
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Choose Template<span class="required">*</span>
                      </label>
                      <?php
                      $get_acf_template_sql="select * from  tbl_acf_template where acf_id='".$cid."'";
						$get_acf_template_rs=mysqli_query($conn,$get_acf_template_sql);
						$acf_template_arr[]=array();
						while($get_acf_template_row=mysqli_fetch_array($get_acf_template_rs))
						{
							$acf_template_arr[]=$get_acf_template_row['acf_template'];
						}
                      ?>
                      <div class="col-md-6 col-sm-6 col-xs-12 facilities1">
						<select name="acf_template[]" multiple="multiple" required="required">
						<option value="">Choose Template</option>	
						<?php
						
						$file_name=get_template();
						foreach($file_name as $key=>$value)
						{
						?>	
						<option value="<?= $key?>" <?php if(in_array($key, $acf_template_arr)){ echo "selected";}?>><?= $value; ?></option>	
						<?php
						}
						?>
						</select>	  
                      </div>
                      
                    </div>
                    
                    
                    <?php
 	$get_prod_attr_val_sql="select * from  tbl_acf_field where acf_id='".$rc['acf_id']."'";
	$get_prod_attr_val_rs=mysqli_query($conn,$get_prod_attr_val_sql);
	$get_prod_attr_val_arr=array();
	while($get_prod_attr_val_row=mysqli_fetch_array($get_prod_attr_val_rs))
	{
		?>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Label<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="acf_field_label_edit[]" id="acf_field_label_edit<?php echo $get_prod_attr_val_row['acf_field_id'];?>" value="<?php echo $get_prod_attr_val_row['acf_field_label'];?>"  class="form-control col-md-7 col-xs-12" required="required" onblur="chenge_field_name(<?php echo $get_prod_attr_val_row['acf_field_id'];?>);" />
                        <input type="button" name="del_attribute_val" value="Delete" onclick="del_attr_val(<?php echo $get_prod_attr_val_row['acf_field_id'];?>);" style="float:left;">   
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Name<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="acf_field_name_edit[]" id="acf_field_name_edit<?php echo $get_prod_attr_val_row['acf_field_id'];?>" value="<?php echo $get_prod_attr_val_row['acf_field_name'];?>" class="form-control col-md-7 col-xs-12" required="required" />
                       (Single word, no spaces. Underscores and dashes allowed)
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Field Type<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                       <select name="acf_field_type_edit[]" class="form-control col-md-7 col-xs-12">
                       	<option value="TextBox" <?php if($get_prod_attr_val_row['acf_field_type']=='TextBox'){ echo "selected";}?>>TextBox</option>
                       	 	<option value="TextArea" <?php if($get_prod_attr_val_row['acf_field_type']=='TextArea'){ echo "selected";}?>>TextArea</option>
                       	 	<option value="Editor" <?php if($get_prod_attr_val_row['acf_field_type']=='Editor'){ echo "selected";}?>>Editor</option>
                       	 	<option value="Image" <?php if($get_prod_attr_val_row['acf_field_type']=='Image'){ echo "selected";}?>>Image</option>
                       	<option value="File" <?php if($get_prod_attr_val_row['acf_field_type']=='File'){ echo "selected";}?>>File</option>
                       		<!-- <option value="Gallery" <?php if($get_prod_attr_val_row['acf_field_type']=='Gallery'){ echo "selected";}?>>Gallery</option> -->
                       			<option value="Repeater" <?php if($get_prod_attr_val_row['acf_field_type']=='Repeater'){ echo "selected";}?>>Repeater</option>
                       	
                       </select>
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Required?<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                       <select name="acf_required_edit[]" class="form-control col-md-7 col-xs-12">
                       		<option value="1" <?php if($get_prod_attr_val_row['acf_required']=='1'){ echo "selected";}?>>Yes</option>
                       		<option value="0" <?php if($get_prod_attr_val_row['acf_required']=='0'){ echo "selected";}?>>No</option>
                       </select>
                      </div>
                    </div>
                    
                    
                     <input type="hidden" name="acf_field_id[]" value="<?php print $get_prod_attr_val_row['acf_field_id']; ?>" />
                      <span class="section"></span>  
                    	<?php
	}
 	?>
                                  
                        <span class="section">Add Field</span> 
                     <div id="add_feature_plan"></div>  
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Add Field
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<input type="hidden" name="hidden" value="0" id="hidden"> 
                <input type="button" name="add_feature_plan" value="Add Field" onclick="listfeature(document.getElementById('hidden').value);" class="btn btn-success btn-submit">
 
                      </div>
                    	</div>
                                    
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	 <input type="hidden" name="acf_id" value="<?php print $rc['acf_id']; ?>" />
                      	<input type="submit" name="edit_acf" value="Update" onclick="return validate_form('add_acf_form');" class="btn btn-success btn-submit">
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