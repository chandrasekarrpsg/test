<script type="text/javascript">
	function delconfirmesg(esg_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='esg.php?type=list_esg&lp=ac&esg_id='+esg_id+'&actnesg=dellesg';
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
                  <h2>List ESG </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	<th>Image</th>
                      	 <th>Title</th>                   	
                        
                         <!-- <th>Featured Post</th>       -->
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_esg order by show_home desc,esg_date desc";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td> <img src="post_img/<?php print $result['esg_image'];?>" height="50" width="50" /></td>
                    	<td><?php echo $result['esg_title']; ?>  </td>
						
						<!-- <td><?php  if($result['show_home']==1){ echo "Yes"; }else{ echo "No";} ?>  </td> -->

<td>					
			
	 <a class="btn btn-info btn-xs" href="esg.php?type=edit_esg&lp=ac&esg_id=<?php print $result['esg_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmesg(<?php print $result['esg_id']; ?>)">Delete</a>	
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
           
      