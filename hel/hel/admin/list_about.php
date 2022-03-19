<script type="text/javascript">
	function delconfirmabout(about_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='about.php?type=list_about&lp=ac&about_id='+about_id+'&actnabout=dellabout';
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
                  <h2>List Home Video </h2>
                 
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


$sql = "select * from tbl_about_slider";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    
                    	<td><?php echo $result['about_title']; ?>  </td>


<td>					
			
	 <a class="btn btn-info btn-xs" href="about.php?type=edit_about&lp=ac&about_id=<?php print $result['about_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<!-- <a class="btn btn-danger btn-xs" onclick="delconfirmabout(<?php print $result['about_id']; ?>)">Delete</a>	 -->
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
           
      