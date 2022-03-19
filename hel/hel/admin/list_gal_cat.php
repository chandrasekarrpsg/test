<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http:/resources/demos/style.css">
<script type="text/javascript">
	function delconfirmcat(cid)
	{
		var ca = confirm("Are you sure to delete");
		if(ca==true)
		{
		location.href='gallery.php?type=list_gal_cat&lp=ac&gcid='+cid+'&actngalcat=delgalcat';
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
                  <h2>List  gallery category</h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl No.</th>
                      	<th>  category Image</th>
                        <th>  category Name</th>
                         <th> Action</th>
                      
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php
$list_cat_sql = 'SELECT * FROM '.TABLE_PREFIX.'gallery_category';
$list_cat_query = g_db_query($list_cat_sql);
$rowCount = 1;
while($list_cat = g_db_fetch_array($list_cat_query)){
?>
                    	
                    	
                    <tr>
                    	
                    	<td><?php print $rowCount; ?>  </td>
 	<td><img src="post_img/<?php echo $list_cat['category_image'];?>" width="50" height="50"></td>
<td><?php print $list_cat['gallery_category_name']; ?> </td>

<td>					
			
	 <a class="btn btn-info btn-xs" href="gallery.php?type=edit_gal_cat&lp=ac&cid=<?php print $list_cat['gallery_category_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmcat(<?php print $list_cat['gallery_category_id']; ?>)">Delete</a>	
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
           
      