<script type="text/javascript">
	function delconfirmasset_management(asset_management_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='asset_management.php?type=list_asset_management&lp=ac&asset_management_id='+asset_management_id+'&actnasset_management=dellasset_management';
		//return true;
		}
		else
		{
		return false;
		}
	}
	function banorder (asset_management_id,val) {
	  
	  //alert(val);

		$.ajax({
		type: "GET",
		url: "ajax_ban_order.php",
		dataType: 'html',
		data:{
	       asset_management_id: asset_management_id,
	       value: val,
	    },
		//data: "asset_management_id="+asset_management_id+,
		success: function(response){
			console.log(response);
			
		 //$('#result').html(response);
		}
		});
			}
</script>
       
              <div class="x_panel">
                <div class="x_title">
                  <h2>List Asset Management </h2>
                  <!-- <div id="result"></div> -->
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	
                      	 <th>Image</th>
                      	  <th>Title</th>
                      	<!--  <th>Asset Management Order</th>   -->
                       	<th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_asset_management";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td> <img src="post_img/<?php print $result['asset_management_image'];?>" height="50" width="50" /></td>
                    		<td><?php print $result['asset_management_title'];?></td>
                    	<!-- <td><input type="text" id="asset_management_order" name="asset_management_order" value="<?php echo $result['asset_management_order']; ?>" onblur="banorder(<?php print $result['asset_management_id']; ?>,this.value)" class="form-control col-md-7 col-xs-12"/></td> -->


	<td>					
			
	 <a class="btn btn-info btn-xs" href="asset_management.php?type=edit_asset_management&lp=ac&asset_management_id=<?php print $result['asset_management_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmasset_management(<?php print $result['asset_management_id']; ?>)">Delete</a>	
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
           
      