<script type="text/javascript">
	function delconfirmclient(client_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='infrastructure.php?type=list_infrastructure&lp=ac&infrastructure_id='+client_id+'&actninfrastructure=dellinfrastructure';
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
                  <h2>List Infrastructure </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th>  
                      	 
                      	 <th>Title</th>
                      	                   	
                        <th>Image</th>
                       
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_infrastructure";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?>  </td>
                    	<td><?php print $result['infrastructure_title']; ?></td>
                    	
                    	<td><img src="post_img/<?php echo $result['infrastructure_image'];?>" width="100" height="100"></td>
						

<td>					
			
	 <a class="btn btn-info btn-xs" href="infrastructure.php?type=edit_infrastructure&lp=ac&infrastructure_id=<?php print $result['infrastructure_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmclient(<?php print $result['infrastructure_id']; ?>)">Delete</a>	
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
           
      