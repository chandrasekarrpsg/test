<?php 
$galid = $_REQUEST['parent_gal_id']; 
$sql1 = "select * from tbl_gallery_image where parent_gal_id='".$galid."'";
$exe1 = mysqli_query($conn,$sql1);
$result1 = mysqli_fetch_array($exe1);
?>
<script type="text/javascript">
    function delconfirmmulgallery(mul_gal_id , parent_gal_id)
    {
        
        var c = confirm("Are you sure to delete");
        if(c==true)
        {
        location.href='gallery.php?type=list_gallery_images&lp&lp=ac&mul_gal_id='+mul_gal_id+'&parent_gal_id='+parent_gal_id+'&actnmultiplegallery=dellmultiplegallery';
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
                  <h2>List multiple gallery </h2>
                  <a class="btn btn-info btn-xs" href="gallery.php?type=edit_gallery&lp=ac&gallery_id=<?php echo $_REQUEST['parent_gal_id'];?>">Back</a>  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                        <th>Sl</th> 
                         <th>Image</th>  
                         <!-- <th>Name</th>    -->                   
                        <th>Action  </th>
                      </tr>
                    </thead>


                    <tbody>
                        
<?php

$sql = "select * from tbl_gallery_image where parent_gal_id='".$_REQUEST['parent_gal_id']."'";
$exe = mysqli_query($conn,$sql);
$count = mysqli_num_rows($exe);
$rowCount = 1;
?>

<?php while($result = mysqli_fetch_array($exe)){?>
                        
                        
                    <tr class="<?php print ($rowCount % 2) == 0 ? 'alt1' : 'alt2';?>">
                        
                    
                        <td><?php print $rowCount; ?> </td>
                        <td> <img src="post_img/<?php print $result['mul_gal_image'];?>" height="50" width="50" /></td>
                        <!-- <td><?php echo $result['gallery_name']; ?>  </td> -->


<td>                    
            
     <a class="btn btn-info btn-xs" href="gallery.php?type=edit_gallery_images&lp=ac&mul_gal_id=<?php print $result['mul_gal_id']; ?>&<?php echo session_name().'='.session_id();?>">Edit</a>  
    <a class="btn btn-danger btn-xs" onclick="delconfirmmulgallery(<?php print $result['mul_gal_id']; ?>,<?php print $result['parent_gal_id']; ?>)">Delete</a>  
    
     
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
           
      