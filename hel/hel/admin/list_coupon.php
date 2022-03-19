<script type="text/javascript">
function delconfirm5(coupon_id){
	var cb = confirm('Are you sure to delete this item');
	if(cb==true){
	location.href='coupon.php?type=list_coupon&lp=ac&coupon_id='+coupon_id+'&actncoupon=delcoupon';
	}else{
	return false;
	}
	
}
</script>
       
              <div class="x_panel">
                <div class="x_title">
                  <h2>List Coupon </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Id</th>   
                      	<th>Coupon Code</th>
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_coupon";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);?>

<?php while($result = mysqli_fetch_array($exe)){	?>
                    	
                    	
                    <tr>
                    	
                    
                    	<td><?php echo $result['id']; ?>  </td>
                    	<td><?php echo $result['coupon_code']; ?>  </td>
                    	

<td>					
			
	 <a class="btn btn-info btn-xs" href="coupon.php?type=edit_coupon&lp=ac&id=<?php print $result['id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirm5(<?php print $result['id']; ?>)">Delete</a>	
	</td>

</tr> 
<?php
}
?>
                      
                    </tbody>
                  </table>
                </div>
              </div>