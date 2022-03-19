<script type="text/javascript">
	function listuser()
	{
		location.href = "userdetails.php?type=list_user&lp=cu";
	}
</script>
<script>
	function chenge_field_name()
	{
		key=$("#adminname").val();
		var key = key.toLowerCase();
		key=key.replace(/ /g,"-");
		$("#adminname").val(key);
	}
</script>
<div class="x_panel">
                <div class="x_title">
                  <h2>Add admin user</h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="add_user_form" action="" method="post" name="add_user_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
				  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Select Department <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
						<select name="department" class="form-control col-md-7 col-xs-12" >
						<?php
						$get_department_sql="select * from tbl_department where department_id!=1 order by department_name asc";
						$get_department_rs=mysqli_query($conn,$get_department_sql);
						while($get_department_row=mysqli_fetch_array($get_department_rs))
						{
						?>	
						<option value="<?= $get_department_row['department_name'];?>"><?= $get_department_row['department_name'];?></option>
						<?php
						}
						?>
						
						</select>
                      </div>
                    </div>
					
                  
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Show Name <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="text" name="name" id="name" class="form-control col-md-7 col-xs-12" value="" required  pattern="[A-Za-z+\s[A-Za-z-]+" title ="Enter Only Charectors." />
                      </div>
                    </div>

                      
                    
                     

                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Email Id <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="email" name="email" id="email" class="form-control col-md-7 col-xs-12" value="" required />
                      </div>
                    </div>
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Login Id
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                     <input type="text" name="adminname" id="adminname" class="form-control col-md-7 col-xs-12"  required  value="" onblur="chenge_field_name();"/>
                      
                      </div>
                    </div>
                    <div class="item form-group">

                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Password <span class="required">*</span>

                      </label>

                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="password" name="password" id="password" class="form-control col-md-7 col-xs-12" value="" required />
                     
                      </div>

                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Assign Role
                        
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<ul>
                      	<?php
                      	$get_role_sql="select * from tbl_role order by role_name asc";
                      	$get_role_rs=mysqli_query($conn,$get_role_sql);
						while($get_role_row=mysqli_fetch_array($get_role_rs))
						{
                      	?>
                    <li><input type="checkbox" name="role_id[]" id="role_id" class="flat" value="<?php echo $get_role_row['role_id'];?>"/><?php echo $get_role_row['role_name'];?></li>

                      	<?php
                      	}
                      	?>
 						</ul>
                      </div>
                    </div> 

                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Access Status 	<span class="required">*</span>
                        
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 <input type="radio" name="status" id="status" class="flat" value="1"   checked="chcked" />Yes

  <input type="radio" name="status" id="status" class="flat" value="0"  />No
                      </div>
                    </div> 
                
                   
                <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  
           <input type="submit" name="save_user" value="Save" onclick="return validate_form('add_user_form');" class="btn btn-success btn-submit">
						<input type="button" name="add_user_cancel" value="Cancel" onclick="listuser();" class="btn btn-success btn-submit">
                      	
                      </div>
                    </div>
                  </form>

                </div>
             </div>