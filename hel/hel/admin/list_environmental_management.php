<script type="text/javascript">
	function delconfirmenvironmental_management(environmental_management_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='environmental_management.php?type=list_environmental_management&lp=ac&environmental_management_id='+environmental_management_id+'&actnenvironmental_management=dellenvironmental_management';
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
                  <h2>List Environmental Management </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	<th>Image</th>
                      	 <th>Title</th>                   	
                        
                         <!-- <th>Featured Post</th>       -->
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_environmental_management order by show_home desc,environmental_management_date desc";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td> <img src="post_img/<?php print $result['environmental_management_image'];?>" height="50" width="50" /></td>
                    	<td><?php echo $result['environmental_management_title']; ?>  </td>
						
						<!-- <td><?php  if($result['show_home']==1){ echo "Yes"; }else{ echo "No";} ?>  </td> -->

<td>					
			
	 <a class="btn btn-info btn-xs" href="environmental_management.php?type=edit_environmental_management&lp=ac&environmental_management_id=<?php print $result['environmental_management_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmenvironmental_management(<?php print $result['environmental_management_id']; ?>)">Delete</a>	
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
           
      