<script type="text/javascript">
	function delconfirmrole(role_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='role.php?type=list_role&lp=ac&role_id='+role_id+'&actnrole=dellrole';
		//return true;
		}
		else
		{
		return false;
		}
	}
	
</script>
       
              <div class="x_panel">
                <div class="x_title">
                  <h2>List Role </h2>
                  <!-- <div id="result"></div> -->
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	 <th>Role Name</th>
                      	 
                       	<th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_role order by role_id asc";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td><?php print $result['role_name'];?></td>
                    	


<td>					
			
	 <a class="btn btn-info btn-xs" href="role.php?type=edit_role&lp=ac&role_id=<?php print $result['role_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	 
	<!-- <a class="btn btn-danger btn-xs" onclick="delconfirmrole(<?php print $result['role_id']; ?>)">Delete</a>	 -->
	
	</td>

</tr> 
<?php $rowCount ++ ; ?>
<?php
}
?>
                      
                    </tbody>
                  </table>
                </div>
              </div>
           
      