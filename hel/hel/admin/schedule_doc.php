<?php require 'top_header.php'; ?>
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
		<?php if(isset($schedule_docmsg) && !empty($schedule_docmsg)): ?>
					<div class="" style="margin:2px;padding:3px;">
					<span style="margin-left:30px;"><?php echo $schedule_docmsg;?></span>
					</div>
		<?php endif;?>
      <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
         	<?php 
						if(isset($type) && ($type=='list_schedule_doc')) {
							require 'list_schedule_doc.php';
						}elseif(isset($type) && ($type=='add_schedule_doc')){
							require 'add_schedule_doc.php';
						}elseif(isset($type) && ($type=='edit_schedule_doc')){
							require 'edit_schedule_doc.php';
						}else{
							//Do Nothing......................
						} 
						?>
              
            </div>
      </div>
     </div> 
<?php require 'footer.php';?>