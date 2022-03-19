<script type="text/javascript">
	function delconfirmdepartment(department_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='department.php?type=list_department&lp=ac&department_id='+department_id+'&actndepartment=delldepartment';
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
                  <h2>List Department </h2>
                  <!-- <div id="result"></div> -->
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	 <th>Department Name</th>
                      	 
                       	<th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_department";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td><?php print $result['department_name'];?></td>
                    	


<td>					
			
	 <a class="btn btn-info btn-xs" href="department.php?type=edit_department&lp=ac&department_id=<?php print $result['department_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	 <!-- <?php
	 if( $result['department_id']!=1)
	 {
	 ?>
	<a class="btn btn-danger btn-xs" onclick="delconfirmdepartment(<?php print $result['department_id']; ?>)">Delete</a>	
	<?php
	 }
	?> -->
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
           
      