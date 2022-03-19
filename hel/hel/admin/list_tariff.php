<script type="text/javascript">
	function delconfirmtariff(tariff_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='tariff.php?type=list_tariff&tariff_id='+tariff_id+'&action=delete_tariff';
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
                  <h2>List Tariff </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th> 
                      	<th>Category</th>  
                      	 <th>Title</th>                   	
                        
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_tariff order by tariff_id desc";

$result = mysqli_query($conn, $sql); 
  $no=1;
  while($row =mysqli_fetch_assoc($result)) 
  {
  	
	?>


                    	
                  <td> <?php $a1=$no++;   print $a1;?></td>
                   <td><?php 
                  $get_tarrif_category_sql="select * from tbl_tariff_category where category_id='".$row["category_id"]."'";
		$get_tarrif_category_rs=mysqli_query($conn,$get_tarrif_category_sql);
		$get_tarrif_category_row=mysqli_fetch_array($get_tarrif_category_rs);
                   print $get_tarrif_category_row["category_name"]; ?>
                   </td>
                    	
         <td><?php print $row["tariff_title"]; ?></td>
                    
     <td><a class="btn btn-info btn-xs" href="tariff.php?type=edit_tariff&tariffid=<?php  print $row["tariff_id"]; ?>&<?php echo session_name().'='.session_id();?>">Edit</a><a class="btn btn-danger btn-xs" onclick="delconfirmtariff(<?php print $row["tariff_id"]; ?>)">Delete</a>	</td>                	
			
	

</tr> 

<?php
}
?>
                      
                    </tbody>
                  </table>
                </div>
              </div>
           
      