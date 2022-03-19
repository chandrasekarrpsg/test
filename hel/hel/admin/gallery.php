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
		<?php if(isset($gallerymsg1) && !empty($gallerymsg1)): ?>
					<div class="" style="margin:2px;padding:3px;">
					<span style="margin-left:30px;"><?php echo $gallerymsg1;?></span>
					</div>
		<?php endif;?>
      <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
         	<?php 
						if(isset($type) && ($type=='list_gallery')) {
							require 'list_gallery.php';
						}elseif(isset($type) && ($type=='add_gallery')){
							require 'add_gallery.php';
						}elseif(isset($type) && ($type=='edit_gallery')){
							require 'edit_gallery.php';
						}elseif(isset($type) && ($type=='add_gal_cat')){
							require 'add_gal_cat.php';
						}elseif(isset($type) && ($type=='list_gal_cat')) {
							require 'list_gal_cat.php';
						}elseif(isset($type) && ($type=='edit_gal_cat')){
							require 'edit_gal_cat.php';
						}
						else if(isset($type) && ($type=='list_video_gallery')) {
							require 'list_video_gallery.php';
						}elseif(isset($type) && ($type=='add_video_gallery')){
							require 'add_video_gallery.php';
						}elseif(isset($type) && ($type=='edit_video_gallery')){
							require 'edit_video_gallery.php';
						}elseif(isset($type) && ($type=='list_gallery_images')){
                            require 'list_gallery_images.php';
                        }elseif(isset($type) && ($type=='edit_gallery_images')){
                            require 'edit_gallery_images.php';
                        }elseif(isset($type) && ($type=='list_home_gallery')) {
							require 'list_home_gallery.php';
						}elseif(isset($type) && ($type=='add_home_gallery')){
							require 'add_home_gallery.php';
						}elseif(isset($type) && ($type=='edit_home_gallery')){
							require 'edit_home_gallery.php';
						}else{
							//Do Nothing......................
						} 
						?>
              
            </div>
      </div>
     </div> 
<?php require 'footer.php';?>