<script type="text/javascript">
	function delconfirmlogo(logo_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='logo.php?type=list_logo&lp=ac&logo_id='+logo_id+'&actnlogo=delllogo';
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
                  <h2>List Logo </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	<th>Image</th>
                      	 
                      	 <!-- <th>Price</th>
                      	 <th>Stock</th> -->                     	
                        
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_logo";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td> <img src="post_img/<?php print $result['logo_image'];?>" height="50" width="50" /></td>
                    	
                    	
						<!-- <td><?php echo $result['logo_price']; ?>  </td>
						<td><?php echo $result['logo_stock']; ?>  </td> -->

<td>					
			
	 <a class="btn btn-info btn-xs" href="logo.php?type=edit_logo&lp=ac&logo_id=<?php print $result['logo_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmlogo(<?php print $result['logo_id']; ?>)">Delete</a>	
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
           
      