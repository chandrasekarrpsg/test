              <div class="x_panel">
                <div class="x_title">
                  <h2>List Site Feature </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	 <th>Image</th>  
                      	  <th>Title</th>  
                       	<th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_site_feature";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?> </td>
                    	<td><img src="post_img/<?php print $result['site_image'];?>" height="50" width="50" /></td>
                    	<td><?php print $result['site_title'];?></td>


<td>					
			
	 <a class="btn btn-info btn-xs" href="site_feature.php?type=edit_site_feature&lp=ac&site_id=<?php print $result['site_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
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
           
      