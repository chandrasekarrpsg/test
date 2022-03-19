<script type="text/javascript">
	function delconfirmcsr_page(csr_page_id)
	{
		var c = confirm("Are you sure to delete");
		if(c==true)
		{
		location.href='csr_page.php?type=list_csr_page&lp=ac&csr_page_id='+csr_page_id+'&actncsr_page=dellcsr_page';
		//return true;
		}
		else
		{
		return false;
		}
	}
</script>
<script>
		function duplicate_page(v)
		{
		
		$.ajax({
		type: "POST",
		url: "ajax_duplicate_csr_page.php",
		dataType: 'html',
		data:"q="+v,
		success: function(html){
		alert(html);	
		location.reload();
		},error: function(){
		},complete: function(){
		}
		});
		}
		</script>
       
              <div class="x_panel">
                <div class="x_title">
                  <h2>List CSR page </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th>Sl</th>   
                      	                   	
                        <th>Page Name</th>
                      
                       <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	<?php


$sql = "select * from tbl_csr_page";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                    	
                    	
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                    	
                    
                    	<td><?php print $rowCount; ?>  </td>
                    	
                    	<td><?php echo $result['page_name'];?></td>
				

<td>					
			
	 <a class="btn btn-info btn-xs" href="csr_page.php?type=edit_csr_page&lp=ac&csr_page_id=<?php print $result['id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>
	 <a class="btn btn-success btn-xs" onclick="duplicate_page(<?php print $result['id']; ?>)">Dulicate Page</a>		
	<a class="btn btn-danger btn-xs" onclick="delconfirmcsr_page(<?php print $result['id']; ?>)">Delete</a>	
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
           
      