<script type="text/javascript">
	function delconfirmschedule_doc(schedule_doc_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='schedule_doc.php?type=list_schedule_doc&lp=ac&schedule_doc_id='+schedule_doc_id+'&actnschedule_doc=dellschedule_doc';
		//return true;
		}
		else
		{
		return false;
		}
	}
	function banorder (schedule_doc_id,val) {
	  
	  //alert(val);

		$.ajax({
		type: "GET",
		url: "ajax_ban_order.php",
		dataType: 'html',
		data:{
	       schedule_doc_id: schedule_doc_id,
	       value: val,
	    },
		//data: "schedule_doc_id="+schedule_doc_id+,
		success: function(response){
			console.log(response);
			
		 //$('#result').html(response);
		}
		});
			}
</script>
       
              <div class="x_panel">
                <div class="x_title">
                  <h2>List schedule doc </h2>
                  <!-- <div id="result"></div> -->
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	 <th>Title</th>
                      	<!--  <th>schedule_doc Order</th>   -->
                       	<th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_schedule_doc";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td><?php print $result['schedule_doc_title'];?></td>
                    	<!-- <td><input type="text" id="schedule_doc_order" name="schedule_doc_order" value="<?php echo $result['schedule_doc_order']; ?>" onblur="banorder(<?php print $result['schedule_doc_id']; ?>,this.value)" class="form-control col-md-7 col-xs-12"/></td> -->


<td>					
			
	 <a class="btn btn-info btn-xs" href="schedule_doc.php?type=edit_schedule_doc&lp=ac&schedule_doc_id=<?php print $result['schedule_doc_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmschedule_doc(<?php print $result['schedule_doc_id']; ?>)">Delete</a>	
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
           
      