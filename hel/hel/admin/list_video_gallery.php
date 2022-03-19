<script type="text/javascript">
	function del_product_gallery(product_gallery_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='gallery.php?type=list_video_gallery&lp=ac&gallery_id='+product_gallery_id+'&actnvideo_gallery=dellvideo_gallery';
		
		}
		else
		{
		return false;
		}
	}
</script>
       
              <div class="x_panel">
              	

                <div class="x_title">
                	 
                  <h2>List  Gallery</h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
             <form id="edit_video_gallery_form" action="" method="post" name="edit_video_gallery_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
             	<!-- <div class="form-group">
                      
                      	
                 <input type="submit" name="edit_gallery" value="Update" onclick="return validate_form('edit_gallery_form');" class="btn btn-success btn-submit">
                           
                    </div> -->

                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th>                   	
                        <th>Name</th>

                      	<th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from   tbl_video_gallery ";
$exe =  mysqli_query($conn,$sql);
$count =  mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($product_gallery_res =  mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?></td>
                    	
                    	<td><?php echo $product_gallery_res['gallery_name'];?>
                    		
                    	</td>
					
			              
	 
	<td><a class="btn btn-info btn-xs" href="gallery.php?type=edit_video_gallery&lp=ac&gallery_id=<?php print $product_gallery_res['gallery_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
		
		
		<a class="btn btn-danger btn-xs" onclick="del_product_gallery(<?php print $product_gallery_res['gallery_id']; ?>)">Delete</a>	
	</td>

</tr>
<?php $rowCount ++ ; ?> 
<?php
}
?>
                      
                    </tbody>
                  </table>
                 </form>
                </div>
              </div>