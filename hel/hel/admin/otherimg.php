<div class="x_panel">
                <div class="x_title">
                  <h2>List Product </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <form name="frm" method="post" action="">
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<th> Id</th>
                      	<th> Image</th>
                   
                      </tr>
                    </thead>


                    <tbody>
                    	
                    	   <?php 
							$imgSql = "select * from tbl_prod_img where prod_id='".$_REQUEST['pid']."' and prod_col_id='".$_REQUEST['pid']."'";
							$imgExe = mysql_query($imgSql);
							while($imgRes = mysql_fetch_array($imgExe)){
							?>
                    	
                    	
                    <tr>
                    	
                    	<td><?php echo $imgRes['prod_img_id']; ?>  </td>
                    		<td><input type="checkbox" name="oimg[]" value="<?php echo $imgRes['prod_img_id'];?>" /><img src="post_img/<?php echo $imgRes['prod_image'];?>" height="60px" width="60px" /></td>



</tr> 
<?php
}
?>
 <input type="submit" name="delpic" value="Delete">
                      
                    </tbody>
                  </table>
                  </form>
                </div>
              </div>