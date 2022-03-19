<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http:/resources/demos/style.css">
<script type="text/javascript">
	function delconfirmcat(acf_id)
	{
		var ca = confirm("Are you sure to delete");
		if(ca==true)
		{
		location.href='acf.php?type=list_acf&lp=ac&acf_id='+acf_id+'&actnacf=delacf';
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
                  <h2>List  Field Groups</h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl No.</th>
                      	<th> Title</th>
                      	                        
                        <th> Action</th>
                      
                      </tr>
                    </thead>


                    <tbody>
                    	
                    <?php
					$list_acf_sql = 'SELECT * FROM tbl_acf  order by acf_id desc';
					$list_acf_query = g_db_query($list_acf_sql);
					$rowCount = 1;
					while($list_acf = g_db_fetch_array($list_acf_query)){
					?>
                    <tr>
                    <td><?php print $rowCount; ?>  </td>
                   
					<td><?php print $list_acf['acf_group_name']; ?> </td>
					
					

					<td>					
					<a class="btn btn-info btn-xs" href="acf.php?type=edit_acf&lp=ac&acf_id=<?php print $list_acf['acf_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
					
					<a class="btn btn-danger btn-xs" onclick="delconfirmcat(<?php print $list_acf['acf_id']; ?>)">Delete</a>	
					
					</td>
					</tr> 
					<?php
					$rowCount++;
					}
					?>
                      
                    </tbody>
                  </table>
                </div>
            </div>
           
      