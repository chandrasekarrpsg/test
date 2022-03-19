<script type="text/javascript">
	function listash_stock()
	{
		location.href = "ash_stock.php?type=list_ash_stock&lp=cu";
	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Add Ash Stock  </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_ash_stock_form" action="" method="post" name="add_ash_stock_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                    
                   
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Fly Ash Closing Stock <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="fly_ash_closing_stock" required="required" id="fly_ash_closing_stock" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Bottom Ash Closing Stock <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="bottom_ash_closing_stock" required="required" id="bottom_ash_closing_stock" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Ash Stock  Date <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="date" name="ash_stock_date" required="required" id="ash_stock_date" class="form-control col-md-7 col-xs-12" value="" />
                      </div>
                    </div>
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Short Description <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <textarea name="ash_stock_desc" required="required" id="ash_stock_desc" class="form-control col-md-7 col-xs-12"></textarea>
                      </div>
                    </div> -->
                    
                      <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > File
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 							<input type="file" name="ash_stock_file" id="ash_stock_file" value="" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div> -->
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="save_ash_stock" value="Save" onclick="return validate_form('add_ash_stock_form');" class="btn btn-success btn-submit">
						<input type="button" name="add_ash_stock_cancel" value="Cancel" onclick="listash_stock();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
              </div>