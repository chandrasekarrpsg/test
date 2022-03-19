<?php
$supplier_id = $_REQUEST['supplier_id'];
$sl = 'SELECT * FROM  tbl_supplier WHERE supplier_id = "'.$supplier_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listsupplier()
	{
		location.href = "supplier.php?type=list_supplier&lp=cu";
	}
</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
$( "#datepicker" ).datepicker({
changeMonth: true,
changeYear: true,
dateFormat:"yy-mm-dd"
});
$( "#datepicker2" ).datepicker({
changeMonth: true,
changeYear: true,
dateFormat:"yy-mm-dd"
});
//$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd");
//$( "#datepicker2" ).datepicker( "option", "dateFormat", "yy-mm-dd");
});
</script>


<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Supplier </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_supplier_form" action="" method="post" name="edit_supplier_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  
                     
             
                        
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['supplier_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="supplier_image" id="supplier_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['logo_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Logo Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="logo_image" id="logo_image" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                    
                    
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Short Description
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12"><div class="txtarea-wysiwyg">
                		<?php
                			$oFCKeditor = new FCKeditor('short_desc') ;
                			$oFCKeditor->BasePath	= 'fckeditor/';
                			//$oFCKeditor->ToolbarSet = 'Basic';
                			$oFCKeditor->Width 		= '660px';
                			$oFCKeditor->Height 	= '500px';
                			$oFCKeditor->Value		= htmlspecialchars_decode($rc['short_desc']);
                			$oFCKeditor->Create() ;
                		?>
                		</div>
                    </div>
                    </div> 
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Show in home page<span class="required">*</span>
                      	
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="radio" name="show_home" id="show_home" class="flat" value="1" <?php if( $rc['show_home_page']==1){ echo "checked";}?> />Yes

  <input type="radio" name="show_home" id="show_home" class="flat" value="0" <?php if($rc['show_home_page']==0){ echo "checked";}?> />No
                      </div>
                    </div>
                
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="supplier_id" value="<?php print $rc['supplier_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_supplier" value="Update" onclick="return validate_form('edit_supplier_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_supplier_cancel" value="Cancel" onclick="listsupplier();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>