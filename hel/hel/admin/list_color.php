<script type="text/javascript">
	function delconfirmcolor(color_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='color.php?type=list_color&lp=ac&color_id='+color_id+'&actncolor=dellcolor';
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
                  <h2>List color </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th>   
                      	                   	
                        
                        <th>Name</th> 
                        <th>Color Code</th>
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_color";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?>  </td>
                    	
                    	
						<td><?php echo $result['color_title']; ?>  </td>
						<td><?php echo $result['color_code']; ?>  </td>

<td>					
			
	 <a class="btn btn-info btn-xs" href="color.php?type=edit_color&lp=ac&color_id=<?php print $result['color_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmcolor(<?php print $result['color_id']; ?>)">Delete</a>	
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
           
      