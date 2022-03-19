<script type="text/javascript">
	function delconfirmorder(oid)
	{
		var o = confirm("Are you sure to delete");
		if(o==true)
		{
		location.href='order.php?type=list_order&lp=ac&oid='+oid+'&actnorder=delorder';
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
                  <h2>List Order </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
       
                      <tr>
                      	<th>S.No</th>   
                          	<th>Order Date</th>            	
                       <th>Order No</th> 
                        <th>Payment Mode</th> 
                        
                          <th>Amount</th>
                           <th>Status</th> 
                         <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                 	
    <?php
	$i=1;
	$sql = "select distinct order_unique_id from tbl_order order by order_id desc";
	$exe =mysqli_query($conn,$sql);
	
	while($result =mysqli_fetch_array($exe))
	{
		
		$sql1 = "select * from tbl_order where order_unique_id='".$result['order_unique_id']."'";
	$exe1 =mysqli_query($conn,$sql1);
	
	$result1 =mysqli_fetch_array($exe1);
		?>
		
		
		
		<tr>
			
			<td><?php echo $i; ?>  </td>
			<td><?php echo $result1['order_date']; ?>  </td>
			
				<td><?php echo $result1['order_unique_id']; ?>  </td>
				<td><?php echo $result1['payment_method']; ?></td>
				
				<td><?php echo $result1['order_total']; ?>  </td>
				<td><?php echo $result1['payment_status']; ?>  </td>
				
		
		
<td>					
			
	 <a class="btn btn-info btn-xs" href="order.php?type=edit_order&lp=ac&order_id=<?php echo $result1['order_unique_id']; ?>&<?php echo session_name().'='.session_id();?>">Invoice</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmorder(<?php echo $result1['order_unique_id']; ?>)">Delete</a>	
	
	 
	</td>

		
</tr> 
		
<?php 
	$i++;
	} 
?>
                      
                    </tbody>
                  </table>
                </div>
              </div> 