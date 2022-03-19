<script type="text/javascript">
	function delconfirmbanner(banner_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='slider.php?type=list_slider&lp=ac&banner_id='+banner_id+'&actnbanner=dellbanner';
		//return true;
		}
		else
		{
		return false;
		}
	}
	function banorder (banner_id,val) {
	  
	  //alert(val);

		$.ajax({
		type: "GET",
		url: "ajax_ban_order.php",
		dataType: 'html',
		data:{
	       banner_id: banner_id,
	       value: val,
	    },
		//data: "banner_id="+banner_id+,
		success: function(response){
			console.log(response);
			
		 //$('#result').html(response);
		}
		});
			}
</script>
       
              <div class="x_panel">
                <div class="x_title">
                  <h2>List Slider </h2>
                  <!-- <div id="result"></div> -->
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	 <th>Image</th>
                      	<!--  <th>Banner Order</th>   -->
                       	<th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_banner";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td> <img src="slider/<?php print $result['banner_image'];?>" height="50" width="50" /></td>
                    	<!-- <td><input type="text" id="banner_order" name="banner_order" value="<?php echo $result['banner_order']; ?>" onblur="banorder(<?php print $result['banner_id']; ?>,this.value)" class="form-control col-md-7 col-xs-12"/></td> -->


<td>					
			
	 <a class="btn btn-info btn-xs" href="slider.php?type=edit_slider&lp=ac&banner_id=<?php print $result['banner_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmbanner(<?php print $result['banner_id']; ?>)">Delete</a>	
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
           
      