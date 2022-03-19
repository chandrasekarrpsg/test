<script type="text/javascript">

	function del_prod_enquiry(enq_id)

	{

		var c = confirm("Are you sure to delete");

		if(c==true)

		{

		location.href='prod_enquiry.php?type=list_prod_enquiry&lp=ac&enq_id='+enq_id+'&actnenq_id=delenq_id';

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

                  <h2>List Product Enquiry </h2>

                 

                  <div class="clearfix"></div>

                </div>

                <div class="x_content">

                 

                  <table id="datatable-buttons" class="table table-striped table-bordered">

                    <thead>

                      <tr>

                      	<th>Sl</th>   

					<th>Enquiry Unique-Id</th>                	

                        <th>Product name</th> 

                        <th>Enquirer name</th> 
                        
                        

                        <th>Date</th>
                        

                   
                         <!--   <th>phone</th> -->
                                <!-- <th>catagory</th> 

                         <th>city</th>


                             <th>products</th>

                             <th>message</th> -->

                       <th>Action</th>

                      </tr>

                    </thead>





                    <tbody>

                    	

                    	<?php





$sql = "select * from tbl_product_enquiry  order by enq_id desc";

$exe = mysqli_query($conn,$sql);

$count = mysqli_num_rows($exe);

$rowCount = 1;

?>



<?php while($result = mysqli_fetch_array($exe)){?>

                    	

                    	

                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">

                    	

                    

                    	<td><?php print $rowCount; ?>  </td>

                    	<td><?php echo $result['enq_unique_id']; ?>  </td>

                   
				 			<td><?php echo $result['enq_product']; ?>  </td>

				 		<td><?php echo $result['enq_name']; ?>  </td>

				 		

				 		<!-- <td><?php if($result['prod_enquiry_aproval']=='1'){ echo "Yes";} else { echo "No";} ?></td> -->

				 		

				 		

						<td><?php echo $result['enq_date']; ?>  </td>

						

						<td><?php echo $result['enq_phone']; ?>  </td>
						
						<!-- <td><?php echo $result['catagory']; ?>  </td>

						<td><?php echo $result['city']; ?>  </td>

						<td><?php echo $result['products']; ?>  </td>

						<td><?php echo $result['message']; ?>  </td> -->

						

						

						<!-- <td><?php $usr_qry="select * from tbl_user_profile where uid='".$result['user_id']."'";

									$usr_sql=mysqli_query($conn,$usr_qry);

									$usr_res=mysqli_fetch_array($usr_sql);

									echo $usr_res['fname'];

									 ?>  </td> -->

						



<td>					

			

	 <a class="btn btn-info btn-xs" href="prod_enquiry.php?type=view_prod_enquiry&lp=ac&enq_id=<?php print $result['enq_id']; ?>&<?php echo session_name().'='.session_id();?>">View</a>	

	<a class="btn btn-danger btn-xs" onclick="del_prod_enquiry(<?php print $result['enq_id']; ?>)">Delete</a>	

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