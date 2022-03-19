<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_POST['submittariff']) && $_POST['submittariff']=="Save" )
{
	
	
										
						 $tariff_category=mysqli_real_escape_string($conn,$_POST['category']); 				
                      $tariff_title=mysqli_real_escape_string($conn,$_POST['tariff_title']); 
					 $tariff_short_desc=mysqli_real_escape_string($conn,$_POST['tariff_short_desc']); 
                    
						
			$sql="select * from  tbl_tariff  WHERE  tariff_title='$tariff_title'";
        $run=mysqli_query($conn, $sql);
         $count = mysqli_num_rows($run);
       if($count == 0)
  {		
					if(!empty($_FILES['tariff_file']['name']))
                    {
   	
	                        $file_name = time().$_FILES['tariff_file']['name'];
							$file_type=$_FILES['tariff_file']['type'];
							$type=explode("/","$image_type");
							$file_size=$_FILES['tariff_file']['size'];
							$tempname = $_FILES["tariff_file"]["tmp_name"];    
							$dir="post_img/";
							$uploadfile=$dir.$file_name; 
                           move_uploaded_file($tempname, $uploadfile);
	
                      }
             else 
                      {
                            $image_name = "";  
                       }			
									
			       $sql="insert ignore into tbl_tariff set 
			            tariff_title  ='$tariff_title', tariff_file  ='$file_name',  category_id  ='$tariff_category',
			            tariff_short_desc  ='$tariff_short_desc'";
                           $run= mysqli_query($conn, $sql);							
							
										
						 if($run)
                             {
		                         $taariffmsg.= showMessage("tariff has been added successfully",'success');
	
                             }
							 else
								{
								         $taariffmsg.= showMessage("There is an problem to added data",'error');
								}
	
 } 	
else
{
         $taariffmsg.= showMessage('There is an tariff with same name.','error');
}
	              			
										
}								
 	                         		
									
	
	############  update  #########

if (isset($_POST['submittariff']) && ($_POST['submittariff'])=="Update" ) {
	
		
             
 $tariff_category=mysqli_real_escape_string($conn,$_POST['category']); 	
                    $tariff_title=mysqli_real_escape_string($conn,$_POST['tariff_title']); 
					 $tariff_short_desc=mysqli_real_escape_string($conn,$_POST['tariff_short_desc']); 
					$tariff_id = mysqli_real_escape_string($conn,$_POST['tariff_id']);
				  
				  					
					$updatesql1="select * from  tbl_tariff  WHERE  tariff_title='$tariff_title' and tariff_id!='$tariff_id'";
                     $run=mysqli_query($conn, $updatesql1);
                     $count = mysqli_num_rows($run);
				 
				    if($count == 0)
             {
				
                    $sql = "UPDATE ignore tbl_tariff SET 
                    tariff_title='$tariff_title' , category_id='$tariff_category' ,
                    tariff_short_desc='$tariff_short_desc'   WHERE tariff_id='$tariff_id'";
                 $bb = mysqli_query($conn, $sql);
				 if(isset($_FILES["tariff_file"]["name"]) && $_FILES["tariff_file"]["name"]!="")
                              {
	                        $file_name = time().$_FILES['tariff_file']['name'];
							$file_type=$_FILES['tariff_file']['type'];
							$type=explode("/","$image_type");
							$file_size=$_FILES['tariff_file']['size'];
							$tempname = $_FILES["tariff_file"]["tmp_name"];    
							$dir="post_img/";
							$uploadfile=$dir.$file_name; 
                           move_uploaded_file($tempname, $uploadfile);
                                         $sql1 = "UPDATE ignore tbl_tariff SET tariff_file='$file_name' WHERE tariff_id='$tariff_id'";
                                         $bb1 =mysqli_query($conn, $sql1);
                             }
			                
                   if($bb)
                              {
	                                  $taariffmsg.= showMessage("tariff has been updated successfully",'success');	
                              }       
						 else
								{
								         $taariffmsg.= showMessage("There is an problem to updated data",'error');
								}	  
           }	    
   else
        {
            $taariffmsg.= showMessage('There is an tariff with same name.','error');
         }
    
}

									
	######## delete ###########
if (isset($_GET['action']) && $_GET['action']=="delete_tariff") {
	                               $tariff_id= $_GET['tariff_id'];
	
                                  $sql = "DELETE FROM  tbl_tariff WHERE tariff_id='$tariff_id'";
                                   $aa=mysqli_query($conn, $sql);
                 if($aa)
                            {
	                             
	                             $taariffmsg.=showMessage('The tariff Has Been Deleted','success');

                              }

              }								
									
													