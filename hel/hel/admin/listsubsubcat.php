<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http:/resources/demos/style.css">
<script type="text/javascript">
	function delconfirmcat(sscid)
	{
		var ca = confirm("Are you sure to delete");
		if(ca==true)
		{
		location.href='subsubcategory.php?type=listsubsubcat&lp=ac&sscid='+sscid+'&actn=del';
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
                  <h2>List Sub Sub Category</h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl No.</th>
                      	<th> Category Name</th>
                      	<th> Sub Category Name</th>
                        <th> Sub Sub Category Name</th>
                         <th> Action</th>
                      
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php
$list_cat_sql = 'SELECT * FROM '.TABLE_PREFIX.'subsubcategory';
$list_cat_query = g_db_query($list_cat_sql);
$rowCount = 1;
while($list_cat = g_db_fetch_array($list_cat_query)){
?>
                    	
                    	
                    <tr>
                    	
                    	<td><?php print $rowCount; ?>  </td>
                    
<td><?php $cat_sql=mysqli_query($conn,"select * from tbl_category where category_id='".$list_cat['cat_id']."'");
           $cat_row=mysqli_fetch_array($cat_sql);
           print $cat_row['category_name']; ?> </td> 
<td><?php $cat_sql=mysqli_query($conn,"select * from tbl_subcategory where sub_cat_id='".$list_cat['sub_cat_id']."'");
           $cat_row=mysqli_fetch_array($cat_sql);
           print $cat_row['sub_cat_name']; ?> </td> 
<td><?php print $list_cat['sub_sub_cat_name']; ?> </td>

<td>					
			
	 <a class="btn btn-info btn-xs" href="subsubcategory.php?type=editsubsubcat&lp=ac&sscid=<?php print $list_cat['sub_sub_cat_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>	
	<a class="btn btn-danger btn-xs" onclick="delconfirmcat(<?php print $list_cat['sub_sub_cat_id']; ?>)">Delete</a>	
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
           
      