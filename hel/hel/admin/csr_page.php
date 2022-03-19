<?php require 'top_header.php'; ?>
<body class="nav-md">

  <div class="container body">

    <div class="main_container">
<?php require 'left_panel.php';?>
 <?php require 'header_banner.php';?>      
      <!-- csr_page content -->
      <div class="right_col" role="main">
      	<div class="">
      	<div class="csr_page-title">
            <div class="title_left">
              <h3>
                   Admin Panel
                </h3>
            </div>

            
          </div>
          <div class="clearfix"></div>
		<?php if(isset($cmsmessage) && !empty($cmsmessage)): ?>
					<div class="" style="margin:2px;padding:3px;">
					<span style="margin-left:30px;"><?php echo $cmsmessage;?></span>
					</div>
		<?php endif;?>
      <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
         	<?php 
						if(isset($type) && ($type=='edit_csr_page')) {
							require 'edit_csr_page.php';
						
						}else if(isset($type) && ($type=='add_csr_page')) {
							require 'add_csr_page.php';
						
						}else if(isset($type) && ($type=='list_csr_page')) {
							require 'list_csr_page.php';
						
						}else{
							//Do Nothing......................
						} 
						?>
              
            </div>
      </div>
     </div> 
<?php require 'footer.php';?>