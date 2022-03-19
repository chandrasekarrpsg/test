<script type="text/javascript">
	function delconfirmcourse(course_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='course.php?type=list_course&lp=ac&course_id='+course_id+'&actncourse=dellcourse';
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
                  <h2>List course </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th>   
                      	                   	
                        
                        <th>Name</th> 
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_course order by course_id desc";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?>  </td>
                    	
                    	
						<td><?php echo $result['course_title']; ?>  </td>

<td>					
			
	 <a class="btn btn-info btn-xs" href="course.php?type=edit_course&lp=ac&course_id=<?php print $result['course_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmcourse(<?php print $result['course_id']; ?>)">Delete</a>	
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
           
      