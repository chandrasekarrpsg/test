<script type="text/javascript">
	function delconfirmec_compliance(ec_compliance_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='ec_compliance.php?type=list_ec_compliance&lp=ac&ec_compliance_id='+ec_compliance_id+'&actnec_compliance=dellec_compliance';
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
                  <h2>List Ec Compliance </h2>
                  <!-- <div id="result"></div> -->
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	 <th>Year</th>
                      	 
                      	<!--  <th>ec_compliance Order</th>   -->
                       	<th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_ec_compliance";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td><?php echo $result['year_start']."-".$result['year_end'];?></td>
                    	
                    	
                    	<!-- <td><input type="text" id="ec_compliance_order" name="ec_compliance_order" value="<?php echo $result['ec_compliance_order']; ?>" onblur="banorder(<?php print $result['ec_compliance_id']; ?>,this.value)" class="form-control col-md-7 col-xs-12"/></td> -->


<td>					
			
	 <a class="btn btn-info btn-xs" href="ec_compliance.php?type=edit_ec_compliance&lp=ac&ec_compliance_id=<?php print $result['ec_compliance_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmec_compliance(<?php print $result['ec_compliance_id']; ?>)">Delete</a>	
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
           
      