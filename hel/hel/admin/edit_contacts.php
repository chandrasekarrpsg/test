<?php $sl = 'SELECT * FROM  tbl_contact WHERE contact_id = 1';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>


<div class="x_panel">
                <div class="x_title">
                  <h2>Edi Contact </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_contacts_form" action="" method="post" name="edit_contacts_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                       
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Phone Number <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="contact_phone" required="required" rows="5" cols="100"><?php echo stripslashes(html_entity_decode($rc['contact_phone']));?></textarea>
                      </div>
                    </div> -->
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Phone Number Inner <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="contact_phone_inner" required="required" rows="5" cols="100"><?php echo stripslashes(html_entity_decode($rc['contact_phone_inner']));?></textarea>
                      </div>
                    </div> -->
                     
                       <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Phone no2 <span class="required">*</span>
                      </label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
                      <textarea name="contact_phone2" required="required" rows="5" cols="100"><?php echo stripslashes(html_entity_decode($rc['contact_phone2']));?></textarea>
 
                      </div>
                    </div> -->
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Phone Number2 Inner <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="contact_phone2_inner" required="required" rows="5" cols="100"><?php echo stripslashes(html_entity_decode($rc['contact_phone2_inner']));?></textarea>
                      </div>
                    </div> -->
                    
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Phone no3 <span class="required">*</span>
                      </label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
                      <textarea name="contact_phone3" required="required" rows="5" cols="100"><?php echo stripslashes(html_entity_decode($rc['contact_phone3']));?></textarea>
 
                      </div>
                    </div> -->
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Phone Number3 Inner <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="contact_phone3_inner" required="required" rows="5" cols="100"><?php echo stripslashes(html_entity_decode($rc['contact_phone3_inner']));?></textarea>
                      </div>
                    </div> -->
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Phone no4 <span class="required">*</span>
                      </label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
                      <textarea name="contact_phone4" required="required" rows="5" cols="100"><?php echo stripslashes(html_entity_decode($rc['contact_phone4']));?></textarea>
 
                      </div>
                    </div> -->
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Phone Number4 Inner <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <textarea name="contact_phone4_inner" required="required" rows="5" cols="100"><?php echo stripslashes(html_entity_decode($rc['contact_phone4_inner']));?></textarea>
                      </div>
                    </div> -->
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Email <span class="required">*</span>
                      </label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
 
 <textarea name="contact_email" required="required" rows="5" cols="100"><?php echo stripslashes(html_entity_decode($rc['contact_email']));?></textarea>
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Email2 <span class="required">*</span>
                      </label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
 
 <textarea name="contact_email2" required="required" rows="5" cols="100"><?php echo stripslashes(html_entity_decode($rc['contact_email2']));?></textarea>
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Address 1 <span class="required">*</span>
                      </label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
                      <textarea name="contact_address" required="required" rows="5" cols="100"><?php echo stripslashes(html_entity_decode($rc['contact_address']));?></textarea>
 
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Address 2<span class="required">*</span>
                      </label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
                      <textarea name="contact_address2" required="required"><?php echo stripslashes(html_entity_decode($rc['contact_address2']));?></textarea>
 
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Map Link<span class="required">*</span>
                      </label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
                      <textarea name="contact_map" required="required"><?php echo stripslashes(html_entity_decode($rc['contact_map']));?></textarea>
 
                      </div>
                    </div>
                   
                  
                 <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                      	<input type="submit" name="edit_contacts" value="Update" onclick="return validate_form('edit_contacts_form');" class="btn btn-success btn-submit">
                      	
                      	
                   
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>