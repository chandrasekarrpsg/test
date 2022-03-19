<script type="text/javascript">
	function delconfirmsupplier(supplier_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='supplier.php?type=list_supplier&lp=ac&supplier_id='+supplier_id+'&actnsupplier=dellsupplier';
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
                  <h2>List Supplier </h2>
                 
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


$sql = "select * from tbl_supplier";
$exe =  mysqli_query($conn,$sql);
$count =  mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result =  mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td> <img src="post_img/<?php print $result['supplier_image'];?>" height="50" width="50" /></td>
                    	
                    	
						<!-- <td><?php echo $result['supplier_price']; ?>  </td>
						<td><?php echo $result['supplier_stock']; ?>  </td> -->

<td>					
			
	 <a class="btn btn-info btn-xs" href="supplier.php?type=edit_supplier&lp=ac&supplier_id=<?php print $result['supplier_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmsupplier(<?php print $result['supplier_id']; ?>)">Delete</a>	
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
           
      