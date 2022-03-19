<script type="text/javascript">
	function delconfirmtariff_category(category_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='tariff_category.php?type=list_tariff_category&category_id='+category_id+'&action=delete_tariff_category';
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
                  <h2>List Tariff category</h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	
                      	 <th>Title</th>                   	
                        
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_tariff_category order by category_id desc";

$result = mysqli_query($conn, $sql); 
  $no=1;
  while($row =mysqli_fetch_assoc($result)) 
  {
  	
	?>


                    	
                  <td> <?php $a1=$no++;   print $a1;?></td>
                    	
         <td><?php print $row["category_name"]; ?></td>
                    
     <td><a class="btn btn-info btn-xs" href="tariff_category.php?type=edit_tariff_category&tariffid=<?php  print $row["category_id"]; ?>&<?php echo session_name().'='.session_id();?>">Edit</a><a class="btn btn-danger btn-xs" onclick="delconfirmtariff_category(<?php print $row["category_id"]; ?>)">Delete</a>	</td>                	
			
	

</tr> 

<?php
}
?>
                      
                    </tbody>
                  </table>
                </div>
              </div>
           
      