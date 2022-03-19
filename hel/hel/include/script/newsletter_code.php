<?php
if(isset($_REQUEST['news_submit']))
{
	
	
	$email           = $_REQUEST["news_email"];
	$newsletter_name = $_REQUEST["newsletter_name"];
	$nws_sql         = mysqli_query($conn,"select * from tbl_newsletter where newsletter_email='$email'");
	$nws_rows        = mysqli_num_rows($nws_sql);
	if($nws_rows>0){
	$newsmsg="You are already subscribed.";			
	} else {
	$news_sql="insert into tbl_newsletter 
	set newsletter_email = '".$email."',newsletter_name = '".$newsletter_name."'";
	$news_query = mysqli_query($conn,$news_sql);
	
	$newsmsg="Thanks for subscribing to our Request Call Back.";
	
	
	
	$widgetExe2 = mysqli_query($conn,'SELECT * FROM `tbl_widget` where widget_id=1');
	$widgetRow2 = mysqli_fetch_array($widgetExe2);

	$to	 		= $widgetRow2['widget_admin_email'];
	
	$subject	=  "Request Call Back Feedback";
			$massege_body 		= "
			<table width='100%' border='0' cellspacing='0' cellpadding='0'>
			<tr><td><table width='100%' border='0' cellspacing='0' cellpadding='0'>
			<tr><td>Hi</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td>Following Person filled the Request Call Back form at DAMS</td></tr>
			<tr><td>Name</td><td>:</td><td>".$newsletter_name."</td></tr>
			<tr><td>Phone</td><td>:</td><td>".$email."</td></tr>
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
			
			
				
				
				$reply_email='info@webdesign-company.in';
				$headers ="From: ".$reply_email."\n";
				$headers.="MIME-Version: 1.0\n";
				$headers.="Content-type: text/html; charset=iso 8859-1";
				$body	 = $my_message;
				
				$send 	 = mail($to,$subject,$body,$headers,"-f$reply_email");
	
	
	
	
  
}
			
	
	
}
