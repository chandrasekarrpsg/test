<?php
$tender_id = $_REQUEST['tender_id'];
$sl = 'SELECT * FROM  tbl_tender WHERE tender_id = "'.$tender_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listtender()
	{
		location.href = "tender.php?type=list_tender&lp=cu";
	}
</script>

			<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Tender  </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_tender_form" action="" method="post" name="edit_tender_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Title<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="tender_title" required="required" id="fly_ash_closing_stock" class="form-control col-md-7 col-xs-12" value="<?php print $rc['tender_title']; ?>" />
                      </div>
                    </div>
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Bottom Ash Closing Stock <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="bottom_ash_closing_stock" required="required" id="bottom_ash_closing_stock" class="form-control col-md-7 col-xs-12"  value="<?php print $rc['bottom_ash_closing_stock']; ?>" />
                      </div>
                    </div> -->
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Tender  Closing Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="date" name="tender_date" required="required" id="tender_date" class="form-control col-md-7 col-xs-12" value="<?php print $rc['tender_date']; ?>" />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Bid Opening Date<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="date" name="tender_date2" required="required" id="tender_date2" class="form-control col-md-7 col-xs-12" value="<?php print $rc['tender_date2']; ?>" />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Reference No <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <textarea name="tender_desc" required="required" id="tender_desc" class="form-control col-md-7 col-xs-12"><?php print $rc['tender_desc']; ?></textarea>
                      </div>
                    </div>
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > File
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<a href="post_img/<?php print $rc['tender_file']; ?>" target="_blank">Download</a>
 							<input type="file" name="tender_file" id="tender_file" value="" class="form-control col-md-7 col-xs-12"  />
 							
                      </div>
                    </div>
                    
                   
                       
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  		<input type="hidden" name="tender_id" value="<?php print $rc['tender_id']; ?>" />
                      	<input type="submit" name="edit_tender" value="Update" onclick="return validate_form('edit_tender_form');" class="btn btn-success btn-submit">
                      	<input type="button" name="add_tender_cancel" value="Cancel" onclick="listtender();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>