<?php include 'conn.php'; ?>
<?php include 'fckeditor/fckeditor.php'; ?>
<?php  $_REQUEST['counter']; ?>

                    
<div class="item form-group">
  <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Color Code <span class="required">*</span>
  </label>
  <div class="col-md-6 col-sm-6 col-xs-12">
 <!-- <input type="text" name="product_color<?php echo $_REQUEST['counter']; ?>" id="product_color<?php echo $_REQUEST['counter']; ?>" class="form-control col-md-7 col-xs-12" value="" /> -->
   <select name="product_color<?php echo $_REQUEST['counter']; ?>" id="product_color<?php echo $_REQUEST['counter']; ?>">
 	<?php
 	$get_color_sql="select * from tbl_color order by color_title";
	$get_color_rs=mysqli_query($conn,$get_color_sql);
	while($get_color_row=mysqli_fetch_array($get_color_rs))
	{
 	?>
 	<option value="<?php echo $get_color_row['color_id'];?>"><?php echo $get_color_row['color_title'];?></option>
 	<?php
	}
 	?>
 </select>
  
  </div>
</div>

                   
  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product Other Image  </label>
		   <div class="col-md-6 col-sm-6 col-xs-12"><input type="file" class="form-control col-md-7 col-xs-12" name="prod_other_image<?php echo $_REQUEST['counter']; ?>[]" multiple="multiple" value="" />(Press Ctrl and Upload multiple image)</div>
</div>                   
