<script type="text/javascript">
	function delconfirmash_stock(ash_stock_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='ash_stock.php?type=list_ash_stock&lp=ac&ash_stock_id='+ash_stock_id+'&actnash_stock=dellash_stock';
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
                  <h2>List Ash Stock </h2>
                  <!-- <div id="result"></div> -->
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	 <th>Date</th>
                      	 <th>Fly Ash Stock</th>
                      	 <th>Bottom Ash Stock</th>
                      	<!--  <th>ash_stock Order</th>   -->
                       	<th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_ash_stock";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td><?php print $result['ash_stock_date'];?></td>
                    	<td><?php print $result['fly_ash_closing_stock'];?></td>
                    	<td><?php print $result['bottom_ash_closing_stock'];?></td>
                    	<!-- <td><input type="text" id="ash_stock_order" name="ash_stock_order" value="<?php echo $result['ash_stock_order']; ?>" onblur="banorder(<?php print $result['ash_stock_id']; ?>,this.value)" class="form-control col-md-7 col-xs-12"/></td> -->


<td>					
			
	 <a class="btn btn-info btn-xs" href="ash_stock.php?type=edit_ash_stock&lp=ac&ash_stock_id=<?php print $result['ash_stock_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmash_stock(<?php print $result['ash_stock_id']; ?>)">Delete</a>	
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
           
      