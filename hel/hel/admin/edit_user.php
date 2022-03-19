<script type="text/javascript">

function closeView()
{
	
	location.href="userdetails.php?type=list_user&lp=usr&pro=raim65vo62b83ebcn8sm7ponc0";	
}

</script>
<script>
function showpass() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>

<?php
$usr_id = $_REQUEST['usr_id'];
$sl = 'SELECT * FROM tbl_user_profile WHERE uid = "'.$usr_id.'"';
$q  = g_db_query($sl);
$rc1 = g_db_fetch_array($q);

$sl2 = 'SELECT * FROM tbl_administrator WHERE uid = "'.$usr_id.'"';
$q2  = g_db_query($sl2);
$rc2 = g_db_fetch_array($q2);
?>
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
                  <h2>View User </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_user_form" action="" method="post" name="edit_user_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                       
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
						<option value="<?= $get_department_row['department_name'];?>" <?php if($rc1['department']==$get_department_row['department_name']){ echo "selected";} ?>><?= $get_department_row['department_name'];?></option>
						<?php
						}
						?>	
						
						</select>
                      </div>
                    </div>
                      
                                 
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Show Name 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 
  <input type="text" name="name" id="name" class="form-control col-md-7 col-xs-12"  required  pattern="[A-Za-z+\s[A-Za-z-]+" title ="Enter Only Charectors." value="<?php print $rc1['name']; ?>" />
                      </div>
                    </div>
                     
                    
          
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Email Id
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <input type="email" name="email" id="email" class="form-control col-md-7 col-xs-12" value="<?php print $rc1['email']; ?>" required />
                     
                      
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Login Id
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                     <input type="text" name="adminname" id="adminname" class="form-control col-md-7 col-xs-12"  required  value="<?php print $rc2['adminname']; ?>" onblur="chenge_field_name();"/>
                      
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Passowrd
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                     
                      	 <input type="password" name="password" id="password" class="form-control col-md-7 col-xs-12" value="<?php print $rc1['password']; ?>" required /><br><a href="javascript:void(0);" onclick="showpass();">View</a>
                      
                      </div>
                    </div>
                   
                    
                    
                    
                    
                    
                    
                    <?php
                    $get_role_sql="select * from tbl_user_role where user_id='".$rc1['uid']."'";
					$get_role_rs=mysqli_query($conn,$get_role_sql);
					$role_arr=array();
					while($get_role_row=mysqli_fetch_array($get_role_rs))
					{
						$role_arr[]=$get_role_row['role_id'];
					}
                    ?>
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
                    <li><input type="checkbox" name="role_id[]" id="role_id" class="flat" value="<?php echo $get_role_row['role_id'];?>" <?php if(in_array($get_role_row['role_id'], $role_arr)){ echo "checked"; }?>/><?php echo $get_role_row['role_name'];?></li>

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
 <input type="radio" name="status" id="status" class="flat" value="1" <?php if($rc1['u_active']==1){ echo "checked"; } ?>  />Yes

  <input type="radio" name="status" id="status" class="flat" value="0"  <?php if($rc1['u_active']==0){ echo "checked"; } ?> />No
                      </div>
                    </div> 
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="uid" value="<?php print $rc1['uid']; ?>" />
                      	
                      			
	
                      	
                      	
                      	<input type="submit" name="edit_user" value="Save" onclick="return validate_form('edit_user_form');" class="btn btn-success btn-submit">
                      	<input type="button" name="Close" value="Close" onclick="closeView();" class="btn btn-success btn-submit">
              
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>