<script type="text/javascript">
	function listtariff2()
	{
		location.href = "tariff.php?type=list_tariff";
	}
</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<div class="x_panel">
                <div class="x_title">
                  <h2>Add Tariff </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_tariff_form" action="" method="post" name="add_tariff_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select category<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<select name="category" class="form-control col-md-7 col-xs-12">
                      		<option value="">Select</option><?php
			
				$sqlcatagory="select * from tbl_tariff_category";
                  $rcatagory=mysqli_query($conn, $sqlcatagory);              
				while($aboutrow = mysqli_fetch_assoc($rcatagory)) 
				
			{
				
				?>
                      	<option value="<?php print $aboutrow['category_id'] ;?>" 
			<?php if (isset($_POST['category'])){ if ($_POST['category']== $aboutrow['category_id']) {	echo "selected" ; }}?>> <?php print $aboutrow['category_name'] ;?></option>
				<?php	
			}	
				
             ?> 
                      	</select>
                        
                      </div>
                    </div> 
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >tariff title<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="tariff_title" required="required" id="tariff_title" class="form-control col-md-7 col-xs-12"  />
                     
 
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >tariff short desc <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="text" name="tariff_short_desc"  id="tariff_short_desc" class="form-control col-md-7 col-xs-12"  />
                     
 
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >tariff file<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="file" name="tariff_file" required="required"  id="tariff_file" class="form-control col-md-7 col-xs-12"  />
                     
 
                      </div>
                    </div>
                    
                    
                    
                    
                     
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="submittariff" value="Save" onclick="return validate_form('add_tariff_form');" class="btn btn-success btn-submit">
		<input type="button" name="add_tariff" value="Cancel" onclick="listtariff2();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>