<script type="text/javascript">
	function delconfirmfaculty(faculty_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='faculty.php?type=list_faculty&lp=ac&faculty_id='+faculty_id+'&actnfaculty=dellfaculty';
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
                  <h2>List faculty </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th>   
                      	                   	
                        <th>Image</th>
                        <th>Name</th> 
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_faculty";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?>  </td>
                    	
                    	<td><img src="post_img/<?php echo $result['faculty_image'];?>" width="100" height="100"></td>
						<td><?php echo $result['faculty_title']; ?>  </td>

<td>					
			
	 <a class="btn btn-info btn-xs" href="faculty.php?type=edit_faculty&lp=ac&faculty_id=<?php print $result['faculty_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmfaculty(<?php print $result['faculty_id']; ?>)">Delete</a>	
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
           
      