<script type="text/javascript">
	function delconfirmtender(tender_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='tender.php?type=list_tender&lp=ac&tender_id='+tender_id+'&actntender=delltender';
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
                      	 <th>Tender Title</th>
                      	 <th>Closing Date</th>
                      	<th>Bid Opening Date</th>
                      	<!--  <th>tender Order</th>   -->
                       	<th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_tender";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td><?php print $result['tender_title'];?></td>
                    	<td><?php print $result['tender_date'];?></td>
                    	<td><?php print $result['tender_date2'];?></td>
                    	
                    	<!-- <td><input type="text" id="tender_order" name="tender_order" value="<?php echo $result['tender_order']; ?>" onblur="banorder(<?php print $result['tender_id']; ?>,this.value)" class="form-control col-md-7 col-xs-12"/></td> -->


<td>					
			
	 <a class="btn btn-info btn-xs" href="tender.php?type=edit_tender&lp=ac&tender_id=<?php print $result['tender_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmtender(<?php print $result['tender_id']; ?>)">Delete</a>	
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
           
      