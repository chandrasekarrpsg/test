<script type="text/javascript">
function delconfirm(cid)
{
	
	var c = confirm('Are you sure to delete this item');
	if(c==true)
	{
	location.href="job_application.php?type=list_job_application&action=deletejobapplication&<?php echo function_session_name().'='.function_session_id();?>&application_id="+cid+"&lp=usr";
	
	}
	else
	{
	return false;
	}
	
}
</script>
              <div class="x_panel">
                <div class="x_title">
                  <h2>List Job Application </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>SL</th>   
                      	<th>Reff No.</th> 
                      	 <th>Application date</th>
                      	 <th>Name</th> 
                      	 <th>Mobile no.</th>                      	
                        <th>Email ID</th>
                       <th>Job Apply For</th>
                         
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                  <?php
$list_cat_sql = "SELECT * FROM tbl_job_application order by application_id desc";
$list_cat_query = g_db_query($list_cat_sql);
$rowCount = 0;
while($list_cat = g_db_fetch_array($list_cat_query)){
?>
                    	
                    <tr>
                    	<td><?php echo ++$rowCount; ?>  </td>
                    	<td><?php echo $list_cat['reff_no']; ?>  </td>
                    <td><?php echo $list_cat['application_date']; ?>  </td>
                    	
                    	<td><?php echo $list_cat['candidate_name']; ?>  </td>
                    	<td><?php echo $list_cat['candidate_mobile']; ?>  </td>
                    	<td><?php echo $list_cat['candidate_email']; ?>  </td>
                    	<td><?php echo $list_cat['candidate_job_apply_for']; ?>  </td>
                    	
                    	
                    	   


<td>					
			
	 <a class="btn btn-info btn-xs" href="job_application.php?type=view_job_application&lp=ac&application_id=<?php print $list_cat['application_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirm(<?php print $list_cat['application_id']; ?>)">Delete</a>	
	</td>

</tr> 
<?php
}
?>
                      
                    </tbody>
                  </table>
                </div>
              </div>