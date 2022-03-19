<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_POST['submitcategory']) && $_POST['submitcategory']=="Save" )
{
	
	
										
										
                      $category_name=mysqli_real_escape_string($conn,$_POST['category_name']); 
					 $category_title=mysqli_real_escape_string($conn,$_POST['category_title']); 
                     
						
		$sql="select * from  tbl_tariff_category  WHERE  category_name='$category_name'";
        $run=mysqli_query($conn, $sql);
         $count = mysqli_num_rows($run);
       if($count == 0)
  {		
					
									
			         $sql="insert ignore into tbl_tariff_category set 
			            category_name  ='$category_name', 
			            category_title  ='$category_title'";
                           $run= mysqli_query($conn, $sql);							
										
										
						 if($run)
                             {
		                         $tariffmsg.= showMessage("category has been added successfully",'success');
	
                             }
							 else
								{
								         $tariffmsg.= showMessage("There is an problem to added data",'error');
								}
	
 } 	
else
{
         $tariffmsg.= showMessage('There is an category with same name.','error');
}
	              			
										
}								
 	                         		
									
	
	############  update  #########

if (isset($_POST['submitcategory']) && ($_POST['submitcategory'])=="Update" ) {
	
		
             

                    $category_name=mysqli_real_escape_string($conn,$_POST['category_name']); 
					 $category_title=mysqli_real_escape_string($conn,$_POST['category_title']); 
					$category_id = mysqli_real_escape_string($conn,$_POST['category_id']);
				  
				  					
					$updatesql1="select * from  tbl_tariff_category  WHERE  category_name='$category_name' and category_id!='$category_id' ";
                     $run=mysqli_query($conn, $updatesql1);
                     $count = mysqli_num_rows($run);
				 
				    if($count == 0)
             {
				
                    $sql = "UPDATE ignore tbl_tariff_category SET 
                    category_name='$category_name' , 
                    category_title='$category_title'   WHERE category_id='$category_id'";
                 $bb = mysqli_query($conn, $sql);
				 
			                
                   if($bb)
                              {
	                                  $tariffmsg.= showMessage("category has been updated successfully",'success');	
                              }       
						 else
								{
								         $tariffmsg.= showMessage("There is an problem to updated data",'error');
								}	  
           }	    
   else
        {
            $tariffmsg.= showMessage('There is an category with same name.','error');
         }
    
}

									
	######## delete ###########
if (isset($_GET['action']) && $_GET['action']=="delete_tariff_category") {
	                               $category_id= $_GET['category_id'];
	
                                  $sql = "DELETE FROM  tbl_tariff_category WHERE category_id='$category_id'";
                                   $aa=mysqli_query($conn, $sql);
                 if($aa)
                            {
	                             
	                             $tariffmsg.=showMessage('The category Has Been Deleted','success');

                              }

              }								
									
													