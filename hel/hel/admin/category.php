<?php require 'top_header.php'; ?>
<?php
if($_SESSION['admin']['dept']!=0)
{
	
	unset($_SESSION['admin']);
	
	header('Location:index.php');
}
?>
<body class="nav-md">

  <div class="container body">

    <div class="main_container">
<?php require 'left_panel.php';?>
 <?php require 'header_banner.php';?>      
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
		<?php if(isset($catmessage1) && !empty($catmessage1)): ?>
					<div class="" style="margin:2px;padding:3px;">
					<span style="margin-left:30px;"><?php echo $catmessage1;?></span>
					</div>
		<?php endif;?>
      <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
         	<?php 
						if(isset($type) && ($type=='listcat')) {
							require 'listcat.php';
						}elseif(isset($type) && ($type=='adcat')){
							require 'adcat.php';
						}elseif(isset($type) && ($type=='editcat')){
							require 'editcat.php';
						}else{
							//Do Nothing......................
						} 
						?>
              
            </div>
      </div>
     </div> 
<?php require 'footer.php';?>