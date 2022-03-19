<?php
$enq_id = $_REQUEST['enq_id'];
$sl = 'SELECT * FROM  tbl_product_enquiry WHERE enq_id = "'.$enq_id.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function list_prod_enquiry()
	{
		location.href = "prod_enquiry.php?type=list_prod_enquiry&lp=cu";
	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>View Product Enquiry </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="view_prod_enquiry_form" action="" method="post" name="view_prod_enquiry_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	   	
  
  						
  			<!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >advertiser Name<span class="required"></span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	 <?php 
									$qry="select * from  tbl_manage_advertiser where enq_id='".$rc['enq_id']."'";
									$sl=mysqli_query($conn,$qry);
										$rw=mysqli_fetch_array($sl);
                    echo stripcslashes(html_entity_decode($rw['advertiser_name']));?>
                      </div>
                    </div> -->
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Enquiry Unique-Id<span class="required"></span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                    <?php echo stripcslashes(html_entity_decode($rc['enq_unique_id']));?>
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Product name<span class="required"></span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                    <?php echo stripcslashes(html_entity_decode($rc['enq_product']));?>
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Enquirer name<span class="required"></span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                    <?php echo stripcslashes(html_entity_decode($rc['enq_name']));?>
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Email<span class="required"></span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
            <?php echo stripcslashes(html_entity_decode($rc['enq_email']));?>
                      </div>
                    </div>
                    
                    
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Phone <span class="required"></span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                    <?php echo stripcslashes(html_entity_decode($rc['enq_phone']));?>
                      </div>
                    </div>
                    
                    
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Date<span class="required"></span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
            <?php echo stripcslashes(html_entity_decode($rc['enq_date']));?>
                      </div>
                    </div>
                     
                   
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Message <span class="required"></span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                    <?php echo stripcslashes(html_entity_decode($rc['enq_msg']));?>
                      </div>
                    </div>

                       

                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >advertiser Feedback Approval<span class="required">*</span>
                      </label>
                      YES  <input type="radio" name="prod_enquiry_aproval" required="required" id="prod_enquiry_aproval" value="1" <?php if($rc[prod_enquiry_aproval]=='1') {echo 'checked';} ?> />
                      NO  <input type="radio" name="prod_enquiry_aproval" required="required" id="prod_enquiry_aproval" value="0" <?php if($rc[prod_enquiry_aproval]=='0') {echo 'checked'; }?>/>
                    </div> --> 
                    
                    
                        
                    
                    
                   
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="enq_id" value="<?php print $rc['enq_id']; ?>" />
                      	
                  <!-- <input type="submit" name="edit_prod_enquiry" value="Update" onclick="return validate_form('edit_prod_enquiry_form');" class="btn btn-success btn-submit"> -->
                      	
		    	  <input type="button" name="list_prod_enquiry_cancel" value="Cancel" onclick="list_prod_enquiry();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>