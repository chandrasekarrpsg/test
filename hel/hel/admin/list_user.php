<script type="text/javascript">
function delconfirm(cid)
{
	
	var c = confirm('Are you sure to delete this item');
	if(c==true)
	{
	location.href="userdetails.php?type=list_user&action=delete&<?php echo function_session_name().'='.function_session_id();?>&usr_id="+cid+"&lp=usr";
	
	}
	else
	{
	return false;
	}
	
}
</script>
              <div class="x_panel">
                <div class="x_title">
                  <h2>List User </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Id</th>   
                      	<th>Department</th>
                      	 <th>Name</th>                   	
                        <th>Email ID</th>
                       
                          <th>Active/Inactive</th>
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                  <?php
$list_cat_sql = "SELECT * FROM tbl_user_profile order by uid desc";
$list_cat_query = g_db_query($list_cat_sql);
$rowCount = 0;
while($list_cat = g_db_fetch_array($list_cat_query)){
?>
                    	
                    <tr>
                    	
                    
                    	<td><?php echo $list_cat['id']; ?>  </td>
                    	<td><?php echo $list_cat['department']; ?>  </td>
                    	<td><?php echo stripcslashes(html_entity_decode($list_cat['name'])); ?>  </td>
                    	<td><?php echo stripcslashes(html_entity_decode($list_cat['email'])); ?>  </td>
                    	
                    	   <td align="center">
                     	
					<?php if($list_cat['u_active']=='0'){ ?>
					<a href="userdetails.php?type=list_user&action=active&<?php echo function_session_name().'='.function_session_id();?>&usr_id=<?php echo $list_cat['uid'];?>&lp=usr">
					<img src="images/disapprove.gif" border="0" title="Activate User"></a>
					<?php }else{ ?>
					<a href="userdetails.php?type=list_user&action=deactive&<?php echo function_session_name().'='.function_session_id();?>&usr_id=<?php echo $list_cat['uid'];?>&lp=usr">
					<img src="images/approve.gif" border="0" title="Deactivate User"></a>
					<?php }	?>
					
		</td>
                


<td>					
			
	 <a class="btn btn-info btn-xs" href="userdetails.php?type=edit_user&lp=ac&usr_id=<?php print $list_cat['uid']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirm(<?php print $list_cat['uid']; ?>)">Delete</a>	
	</td>

</tr> 
<?php
}
?>
                      
                    </tbody>
                  </table>
                </div>
              </div>