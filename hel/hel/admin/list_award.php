<script type="text/javascript">
	function delconfirmaward(award_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='award.php?type=list_award&lp=ac&award_id='+award_id+'&actnaward=dellaward';
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
                  <h2>List Awards </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	<th>Header Award Image</th>
                      	<th>Footer Award Image</th>
                      	                	
                        
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_award";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td> <img src="post_img/<?php print $result['head_award_image'];?>" height="50" width="50" /></td>
                    	<td> <img src="post_img/<?php print $result['foot_award_image'];?>" height="50" width="50" /></td>
                    	


<td>					
			
	 <a class="btn btn-info btn-xs" href="award.php?type=edit_award&lp=ac&award_id=<?php print $result['award_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmaward(<?php print $result['award_id']; ?>)">Delete</a>	
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
           
      