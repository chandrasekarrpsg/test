<script type="text/javascript">
	function delconfirmproduct(product_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='product.php?type=list_product&lp=ac&product_id='+product_id+'&actnproduct=dellproduct';
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
                  <h2>List Product </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	<th>Image</th>
                      	 <th>Title</th>   
                      	 <th>Category</th>
                      	
                      	 <!-- <th>Price</th>
                      	 <th>Stock</th> -->                     	
                        
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_product order by product_title asc";
$exe =mysqli_query($conn,$sql);
$count =mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result =mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td> <img src="post_img/<?php print $result['product_image'];?>" height="50" width="50" /></td>
                    	<td><?php echo $result['product_title']; ?>  </td>
                    	<td><?php 
                    	$get_cat_sql="select * from tbl_category where category_id=(select cat_id from  tbl_product where product_id='".$result['product_id']."')";
						$get_cat_row=mysqli_fetch_array(mysqli_query($conn,$get_cat_sql));
                    	
                    	echo $get_cat_row['category_name']; 
                    	?>  
                    	</td>
                    
                       
						<!-- <td><?php echo $result['product_price']; ?>  </td>
						<td><?php echo $result['product_stock']; ?>  </td> -->

<td>					
			
	 <a class="btn btn-info btn-xs" href="product.php?type=edit_product&lp=ac&product_id=<?php print $result['product_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmproduct(<?php print $result['product_id']; ?>)">Delete</a>	
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
           
      