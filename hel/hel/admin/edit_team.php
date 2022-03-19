<?php
$team_id = $_REQUEST['team_id'];
$sl = 'SELECT * FROM  tbl_team WHERE team_id = "'.$team_id.'"';
$q  =mysqli_query($conn,$sl);
$rc =mysqli_fetch_array($q);
?>
<script type="text/javascript">
	function listteam()
	{
		location.href = "team.php?type=list_team&lp=cu";
	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Edit Board of Directors </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_team_form" action="" method="post" name="edit_team_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	   	<div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Name <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                     
                      <input type="text" name="team_title" value="<?php echo stripcslashes(html_entity_decode($rc['team_title']));?>" required="required" id="team_cat" class="form-control col-md-7 col-xs-12"  />
                     
                       
 
                      </div>
                    </div>
                        <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['team_image'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    
                    
                       <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    

 <input type="file" name="team_image" id="team_image" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
    
 <img src="post_img/<?php print $rc['team_image2'];?>" height="100" width="100" />
 
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Image hover
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="file" name="team_image2" id="team_image2" class="form-control col-md-7 col-xs-12" value=""   />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Designation <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                     
                      <input type="text" name="team_desg" value="<?php echo stripcslashes(html_entity_decode($rc['team_desg']));?>" required="required" id="team_cat" class="form-control col-md-7 col-xs-12"  />
                     
                       
 
                      </div>
                    </div>
                    
                    <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >team Link <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                     
                      <input type="text" name="team_link" value="<?php echo stripcslashes(html_entity_decode($rc['team_link']));?>" required="required" id="team_cat" class="form-control col-md-7 col-xs-12"  />
                     
                       
 
                      </div>
                    </div> -->
                     <!-- <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >team Link2 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                     
                      <input type="text" name="team_link2" value="<?php echo stripcslashes(html_entity_decode($rc['team_link2']));?>" required="required" id="team_cat" class="form-control col-md-7 col-xs-12"  />
                     
                       
 
                      </div>
                    </div> -->
                                
                 
            
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="team_id" value="<?php print $rc['team_id']; ?>" />
                      	
                      			
	
                      	
                      	<input type="submit" name="edit_team" value="Update" onclick="return validate_form('edit_team_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_team_cancel" value="Cancel" onclick="listteam();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>