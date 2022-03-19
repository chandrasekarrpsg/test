<script type="text/javascript">
	function delconfirminternship(internship_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='internship.php?type=list_internship&lp=ac&internship_id='+internship_id+'&actninternship=dellinternship';
		//return true;
		}
		else
		{
		return false;
		}
	}
	function change_order(qry,id)
	{
		$.ajax({
type: "GET",
url: "ajax_change_internship_order.php",
dataType: 'html',
data: "q="+qry+"&id="+id,
success: function(html){


},error: function(){
},complete: function(){
}
});
	}
</script>
       
              <div class="x_panel">
                <div class="x_title">
                  <h2>List Internship Post </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	 <th>Title</th>                   	
                        <!-- <th>Order</th>        -->   
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_internship order by internship_order=0, internship_order asc";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td><?php echo $result['internship_title']; ?>  </td>
                    	<!-- <td><input type="text" name="internship_order" value="<?php echo $result['internship_order']; ?>" onkeyup="change_order(this.value,<?php print $result['internship_id']; ?>);"> </td> -->

<td>					
			
	 <a class="btn btn-info btn-xs" href="internship.php?type=edit_internship&lp=ac&internship_id=<?php print $result['internship_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirminternship(<?php print $result['internship_id']; ?>)">Delete</a>	
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
           
      