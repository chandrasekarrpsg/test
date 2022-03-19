<?php
include("include/apps_top.php");?>
<?php
if(isset($_POST['action']) && $_POST['action']=='application_submit')
{

	extract($_POST);
	
	if (is_uploaded_file($_FILES['candidate_image']['tmp_name'])) 
	{
		 $mime_type = mime_content_type($_FILES['candidate_image']['tmp_name']);
		 $allowed_file_types = array('image/png', 'image/jpeg', 'image/gif', 'image/bmp');
		 
		  if (in_array($mime_type, $allowed_file_types)) 
		  {
			$image_name=time()."_".$_FILES['candidate_image']['name'];
			$image_type=$_FILES['candidate_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['candidate_image']['size'];
			$temp_name=$_FILES['candidate_image']['tmp_name'];
			$dir="admin/uploads/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
		  }
		  else
		  {
		  	$image_name="noimage.jpg";
		  }
		
	}
	else
	{
		$image_name="noimage.jpg";
	}
	
	
	
	if (is_uploaded_file($_FILES['candidate_image']['tmp_name'])) 
	{
    // Notice how to grab MIME type.
   

    // If you want to allow certain files
    
    if (! in_array($mime_type, $allowed_file_types)) {
        // File type is NOT allowed.
    }

    // Set up destination of the file
    $destination = '/path/to/move/your/file/';

    // Now you move/upload your file
    if (move_uploaded_file ($_FILES['candidate_image']['tmp_name'] , $destination)) {
        // File moved to the destination
    }
}	
	

$reff_number=time();
$_SESSION['reff_no']=$reff_number;
$application_date=date('Y-m-d');
	
$job_application_sql="insert into tbl_job_application set
application_date='".$application_date."',
reff_no='".$reff_number."',

candidate_name='".mysqli_real_escape_string($conn,$candidate_name)."',
candidate_image='".mysqli_real_escape_string($conn,$image_name)."',
candidate_address='".mysqli_real_escape_string($conn,$candidate_address)."',
candidate_city='".mysqli_real_escape_string($conn,$candidate_city)."',
candidate_state='".mysqli_real_escape_string($conn,$candidate_state)."',
candidate_pincode='".mysqli_real_escape_string($conn,$candidate_pincode)."',
candidate_phone='".mysqli_real_escape_string($conn,$candidate_phone)."',
candidate_mobile='".mysqli_real_escape_string($conn,$candidate_mobile)."',
candidate_email='".mysqli_real_escape_string($conn,$candidate_email)."',
candidate_indian_status='".mysqli_real_escape_string($conn,$candidate_indian_status)."',
candidate_convicted_status='".mysqli_real_escape_string($conn,$candidate_convicted_status)."',
candidate_medical_test='".mysqli_real_escape_string($conn,$candidate_medical_test)."',
candidate_job_apply_for='".mysqli_real_escape_string($conn,$candidate_job_apply_for)."',
candidate_notice_period='".mysqli_real_escape_string($conn,$candidate_notice_period)."',
candidate_ctc='".mysqli_real_escape_string($conn,$candidate_ctc)."'";	

$job_application_rs=mysqli_query($conn,$job_application_sql);

$last_id=mysqli_insert_id($conn);


$count_education=count($_POST['insttute']);
for($i=0;$i<$count_education;$i++)
{
	if($_POST['insttute'][$i]!='')
	{
	$job_application_education_sql="insert into tbl_job_application_education set
	application_id='".$last_id."',
	insttute='".mysqli_real_escape_string($conn,$_POST['insttute'][$i])."',
	location='".mysqli_real_escape_string($conn,$_POST['location'][$i])."',
	year='".mysqli_real_escape_string($conn,$_POST['year'][$i])."',
	degree='".mysqli_real_escape_string($conn,$_POST['degree'][$i])."',
	subject='".mysqli_real_escape_string($conn,$_POST['subject'][$i])."'
	
	";
	
	$job_application_education_rs=mysqli_query($conn,$job_application_education_sql);
	
	}
}

$count_reference=count($_POST['reff_name']);
for($i=0;$i<$count_reference;$i++)
{
	if($_POST['reff_name'][$i]!='')
	{
	$job_application_reference_sql="insert into tbl_job_application_reference set
	application_id='".$last_id."',
	reff_name='".mysqli_real_escape_string($conn,$_POST['reff_name'][$i])."',
	reff_designation='".mysqli_real_escape_string($conn,$_POST['reff_designation'][$i])."',
	reff_company='".mysqli_real_escape_string($conn,$_POST['reff_company'][$i])."',
	reff_phone='".mysqli_real_escape_string($conn,$_POST['reff_phone'][$i])."'
	
	";
	$job_application_reference_rs=mysqli_query($conn,$job_application_reference_sql);
	}
}

$count_employer=count($_POST['job_title']);
for($i=0;$i<$count_employer;$i++)
{
	if($_POST['job_title'][$i]!='')
	{
	$job_application_employer_sql="insert into tbl_job_application_employer set
	application_id='".$last_id."',
	job_title='".mysqli_real_escape_string($conn,$_POST['job_title'][$i])."',
	job_start='".mysqli_real_escape_string($conn,$_POST['job_start'][$i])."',
	job_end='".mysqli_real_escape_string($conn,$_POST['job_end'][$i])."',
	job_organisation='".mysqli_real_escape_string($conn,$_POST['job_organisation'][$i])."',
	job_start_ctc='".mysqli_real_escape_string($conn,$_POST['job_start_ctc'][$i])."',
	job_end_ctc='".mysqli_real_escape_string($conn,$_POST['job_end_ctc'][$i])."',
	job_address='".mysqli_real_escape_string($conn,$_POST['job_address'][$i])."',
	job_city='".mysqli_real_escape_string($conn,$_POST['job_city'][$i])."',
	job_state='".mysqli_real_escape_string($conn,$_POST['job_state'][$i])."',
	job_pin='".mysqli_real_escape_string($conn,$_POST['job_pin'][$i])."'
	
	";
	$job_application_employer_rs=mysqli_query($conn,$job_application_employer_sql);
	}
}




if($job_application_rs)
{
	echo "1";
	
			$widgetExe2 = mysqli_query($conn,'SELECT * FROM `tbl_widget` where widget_id=1');
			$widgetRow2 = mysqli_fetch_array($widgetExe2);

			$to	 		= $widgetRow2['widget_admin_email'];
			
			$subject	=  "Application for Employment Feedback";
			$massege_body 		= "
			<table width='100%' border='0' cellspacing='0' cellpadding='0'>
			<tr><td><table width='100%' border='0' cellspacing='0' cellpadding='0'>
			<tr><td>Hi</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td>Following Person filled the Application for Employment form at HEL</td></tr>
			<tr><td>Reference No.:</td><td>".$reff_number." </td></tr>
			<tr><td>Application date.:</td><td>".$application_date." </td></tr>
			<tr><td>Name:</td><td>".$candidate_name." </td></tr>
		    <tr><td>Address:</td><td>".$candidate_address."</td></tr>
			<tr><td>City:</td><td>".$candidate_city."</td></tr>
			<tr><td>State:</td><td>".$candidate_state."</td></tr>
			<tr><td> PIN Code:</td><td>".$candidate_pincode."</td></tr>
			<tr><td> Phone Number:</td><td>".$candidate_phone."</td></tr>
			<tr><td>Mobile Number:</td><td>".$candidate_mobile."</td></tr>
			<tr><td>Email Address:</td><td>".$candidate_email."</td></tr>
			<tr><td>Are You an Indian Citizen?:</td><td>".$candidate_indian_status."</td></tr>
			<tr><td>Have You Ever Been convicted in a Court of Law?:</td><td>".$candidate_convicted_status."</td></tr>
			<tr><td>If Selected For Employment are you willing undergo a Pre-Employment Medical Test?:</td><td>".$candidate_medical_test."</td></tr>
			<tr><td> Position You Are Applying For:</td><td>".$candidate_job_apply_for."</td></tr>
			<tr><td>Notice Period (in days):</td><td>".$candidate_notice_period."</td></tr>
			<tr><td>Expected CTC:</td><td>".$candidate_ctc."</td></tr>
			
			<tr><td>&nbsp;</td></tr>
			<tr><td>Thanks</td></tr>
			<tr><td>&nbsp;</td></tr>";
			
			$massege_body .= "</table></td></tr></table>";
			
			$my_message 		= "
			<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
			<html xmlns=\"http://www.w3.org/1999/xhtml\">
			<head>
			<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />
			<title>Message For Administrator</title>
			</head>
			<body>
			<table width='100%' border='0' cellspacing='0' cellpadding='0'>
			<tr><td>".$massege_body."</td></tr>
			</table></body></html>";
			
			
				
				$reply_email='info@workinprogress.co.in';
				$headers ="From: ".$reply_email."\n";
				$headers.="MIME-Version: 1.0\n";
				$headers.="Content-type: text/html; charset=iso 8859-1";
				$body	 = $my_message;
				
				$send 	 = mail($to,$subject,$body,$headers,"-f$reply_email");
	
	
}
else
{
	echo "An error occured during submitting your application";
}


}	
?>

