<?php require 'top_header.php'; ?>
<body class="nav-md">

  <div class="container body">

    <div class="main_container">
<?php require 'left_panel.php';?>
 <?php require 'header_banner.php';?>
 <?php $submitnews=$_REQUEST['submitnews'];
if($submitnews=='Send'){
$chksel=$_REQUEST['chksel'];
$countcheck=count($_REQUEST['chksel']);	
for($i=0;$i<$countcheck;$i++){
$check_id = $chksel[$i];
$newssqlsql = 'Select * FROM tbl_newsletter WHERE newsletter_id= "'.$check_id.'"';
$newsrow = mysqli_query($conn,$newssqlsql);
$newsRes = mysqli_fetch_array($newsrow);
$to .= $newsRes['newsletter_email'].","; 
}
}

if(isset($_REQUEST['sendmail']) && $_REQUEST['sendmail']=='Send'){
	$toemail1 = $_REQUEST['toemail'];
$toemail = rtrim($toemail1,",");
$toemail_arr=explode(",",$toemail);

foreach($toemail_arr as $toemail)
{
	
			$desc          = $_POST['desc'];
		
	
			$to	 		= $toemail;
			$subject	=  $_POST['subject'];
			$massege_body 		= "
			<table width='100%' border='0' cellspacing='0' cellpadding='0'>
			<tr><td><table width='100%' border='0' cellspacing='0' cellpadding='0'>".$_POST['desc'];
			//$massege_body .= ($check != '') ? "<tr><td>".$check."</td></tr>" : '<tr><td>I am Interested in Future Crawshaws Marketing, Please contact with me.</td></tr>';
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
			
		
								
				$reply_email='info@work-update.com';
				$headers ="From: ".$reply_email."\n";
				$headers.="MIME-Version: 1.0\n";
				$headers.="Content-type: text/html; charset=iso 8859-1";
				$body	 = $my_message;
				
				$send 	 = mail($to,$subject,$body,$headers,"-f$reply_email");
}				
				if($send){
					  $newsmsg = "Mail sent succussfully";
				}else{
					 $newsmsg = "Error Occured Mail not send";
					}


}
?>      
<script type="text/javascript">
	function send()
	{
		location.href = "newsletter.php?type=list_newsletter&lp=cu";
	}
</script>
      <!-- page content -->
      <div class="right_col" role="main">
      	<div class="">
      	<div class="page-title">
            <div class="title_left">
              <h3>
                   Admin Panel
                </h3>
            </div>

            
          </div>
          <div class="clearfix"></div>
		<?php if(isset($newsmsg) && !empty($newsmsg)): ?>
					<div class="" style="margin:2px;padding:3px;">
					<span style="margin-left:30px;"><?php echo $newsmsg;?></span>
					</div>
		<?php endif;?>
      <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
       



<div class="x_panel">
                <div class="x_title">
                  <h2>Add Here</h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_newsletter_form" action="" method="post" name="edit_newsletter_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                       
                    
                    
                  <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Mail Subject <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" name="subject" required="required" id="subject" class="form-control col-md-7 col-xs-12"  />
                      </div>
                    </div>
                                 
                    
                    
          
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Mail Body
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<?php
$oFCKeditor = new FCKeditor('desc') ;
$oFCKeditor->BasePath	= 'fckeditor/';
$oFCKeditor->Width 		= '550px';
$oFCKeditor->Height 	= '300px';
$oFCKeditor->Value		= '';
$oFCKeditor->Create() ;
?>
                      	
                      
                      </div>
                    </div>
                    
                    
                   
                    
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	<input type="hidden" name="toemail" value="<?php echo $to;?>">		
                  
                      			
		
                      	<input type="submit" name="sendmail" value="Send" onclick="return validate_form('edit_newsletter_form');" class="btn btn-success btn-submit">
                      	
                      	
                      	
		<input type="button" name="add_send_cancel" value="Cancel" onclick="send();" class="btn btn-success btn-submit">
                 
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>
             

 </div>
      </div>
     </div> 
<?php require 'footer.php';?>