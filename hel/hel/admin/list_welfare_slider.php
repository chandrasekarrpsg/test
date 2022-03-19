<script type="text/javascript">
	function delconfirmwelfare_banner(welfare_banner_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='welfare_slider.php?type=list_welfare_slider&lp=ac&welfare_banner_id='+welfare_banner_id+'&actnwelfare_banner=dellwelfare_banner';
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
                  <h2>List Slider </h2>
                 
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


$sql = "select * from tbl_welfare_banner";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td> <img src="slider/<?php print $result['welfare_banner_image'];?>" height="50" width="50" /></td>
                    	
                    	
						<!-- <td><?php echo $result['welfare_banner_price']; ?>  </td>
						<td><?php echo $result['welfare_banner_stock']; ?>  </td> -->

<td>					
			
	 <a class="btn btn-info btn-xs" href="welfare_slider.php?type=edit_welfare_slider&lp=ac&welfare_banner_id=<?php print $result['welfare_banner_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmwelfare_banner(<?php print $result['welfare_banner_id']; ?>)">Delete</a>	
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
           
      