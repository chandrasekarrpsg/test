<script type="text/javascript">
	function delconfirmtopper(topper_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='topper.php?type=list_topper&lp=ac&topper_id='+topper_id+'&actntopper=delltopper';
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
                  <h2>List Topper Year</h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th>   
                      	                   	
                      
                        <th>Year</th> 
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_topper order  by topper_id desc";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?>  </td>
                    	
                    	
						<td><?php echo $result['topper_title']; ?>  </td>

<td>					
			
	 <a class="btn btn-info btn-xs" href="topper.php?type=edit_topper&lp=ac&topper_id=<?php print $result['topper_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmtopper(<?php print $result['topper_id']; ?>)">Delete</a>	
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
           
      