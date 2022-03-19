<?php
$login_id=$_SESSION['admin']['id'];
$department=$_SESSION['admin']['type'];

$get_user_id_sql="select * from tbl_administrator where id='".$login_id."'";
$get_user_id_rs=mysqli_query($conn,$get_user_id_sql);
$get_user_id_row=mysqli_fetch_array($get_user_id_rs);

$get_role_sql="select * from tbl_user_role where user_id='".$get_user_id_row['uid']."'";
$get_role_rs=mysqli_query($conn,$get_role_sql);
$user_role_arr=array();
while($get_user_role_row=mysqli_fetch_array($get_role_rs))
{
	$user_role_arr[]=$get_user_role_row['role_id'];
}

?>

<div class="col-md-3 left_col">
        <div class="left_col scroll-view">

          <div class="navbar nav_title" style="border: 0;">
            <a href="../admin/index.php" class="site_title"> <span>HEL</span></a>
          </div>
          <div class="clearfix"></div>
          <!-- sidebar menu -->
          <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">

            <div class="menu_section">
              <ul class="nav side-menu">
              	<?php if($department=='Admin' || in_array('1', $user_role_arr))
              	{ 
              	?>
                <li id="1"><a style="cursor: pointer;"><i class="fa fa-home"></i> Admin Settings <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li><a href="changepassword.php?lp=ad&<?php echo session_name().'='.session_id();?>">Change Password</a>
                    </li>
                    <li><a href="logout.php?lp=ad&<?php echo session_name().'='.session_id();?>">Logout</a>
                    </li>
                      <li><a href="widget.php?type=edit_widget&widget_id=1&lp=ac&<?php echo session_name().'='.session_id();?>">Manage Widget</a></li>
                       <li><a href="cmspage.php?type=list_cms&lp=ord&<?php echo session_name().'='.session_id();?>&select=managepage">Manage CMS Page</a></li>
                       <li><a href="contacts.php?type=edit_contacts&contact_id=1&lp=ac&<?php echo session_name().'='.session_id();?>">Manage Contact</a></li>
                       <li><a href="site_feature.php?type=list_site_feature&lp=ac&<?php echo session_name().'='.session_id();?>">Manage Site Feature</a></li>
                       <li><a href="department.php?type=list_department&lp=ac&<?php echo session_name().'='.session_id();?>">Manage Department</a></li>
                       <li><a href="role.php?type=list_role&lp=ac&<?php echo session_name().'='.session_id();?>">Manage Role</a></li>
                       
                    
                  </ul>
                </li>
                <?php 
				} 
				?>
                
                 <!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i>Manage Department <span class="fa fa-chevron-down"></span></a>
				  <ul class="nav child_menu" style="display: none">
				
				<li><a href="department.php?type=list_department&lp=ac&<?php echo session_name().'='.session_id();?>">All Department</a></li>
				<li><a href="department.php?type=add_department&lp=ac&<?php echo session_name().'='.session_id();?>">Add Department</a></li>
				  </ul>
				</li>  -->
				
				<!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i>Manage Role <span class="fa fa-chevron-down"></span></a>
				  <ul class="nav child_menu" style="display: none">
				
				<li><a href="role.php?type=list_role&lp=ac&<?php echo session_name().'='.session_id();?>">All Role</a></li>
				<li><a href="role.php?type=add_role&lp=ac&<?php echo session_name().'='.session_id();?>">Add Role</a></li>
				  </ul>
				</li>  -->
				<?php if($department=='Admin' || in_array('2', $user_role_arr))
				{ 
				?>
                <li id="2"><a style="cursor: pointer;"><i class="fa fa-edit"></i>Manage User<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
 	             	 <li><a href="userdetails.php?type=add_user&lp=ac&<?php echo session_name().'='.session_id();?>">Add User</a></li>
                    <li><a href="userdetails.php?type=list_user&lp=ac&<?php echo session_name().'='.session_id();?>">All User</a></li>
                  
                  </ul>
                </li>
                <?php 
				} 
				?>
				<!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Custom Field <span class="fa fa-chevron-down"></span></a>
				  <ul class="nav child_menu" style="display: none">
				        
                    <li><a href="acf.php?type=list_acf&lp=ac&<?php echo session_name().'='.session_id();?>">All Group</a></li>
                    <li><a href="acf.php?type=add_acf&lp=ac&<?php echo session_name().'='.session_id();?>">Add Group</a></li>
				  </ul>
				</li> 
				 <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage CMS Page <span class="fa fa-chevron-down"></span></a>
				  <ul class="nav child_menu" style="display: none">
				  		 <li><a href="page.php?type=add_page&lp=ord&<?php echo session_name().'='.session_id();?>&select=managepage">Add Page</a></li>
				         <li><a href="page.php?type=list_page&lp=ord&<?php echo session_name().'='.session_id();?>&select=managepage">List Page</a></li>
				  </ul>
				</li>  -->
				<?php if($department=='Admin' || in_array('3', $user_role_arr))
				{ 
				?>
				<li id="3"><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage CSR Page <span class="fa fa-chevron-down"></span></a>
				  <ul class="nav child_menu" style="display: none">
				  		 <li><a href="csr_page.php?type=add_csr_page&lp=ord&<?php echo session_name().'='.session_id();?>&select=managepage">Add CSR Page</a></li>
				         <li><a href="csr_page.php?type=list_csr_page&lp=ord&<?php echo session_name().'='.session_id();?>&select=managepage">List CSR Page</a></li>
				  </ul>
				</li> 
         		<?php 
				} 
				?>
         <?php if($department=='Admin' || in_array('4', $user_role_arr))
         { 
         ?>       
		<li id="4"><a style="cursor: pointer;"><i class="fa fa-edit"></i>Manage  Slider <span class="fa fa-chevron-down"></span></a>
		  <ul class="nav child_menu" style="display: none">
		
		<li><a href="slider.php?type=list_slider&lp=ac&<?php echo session_name().'='.session_id();?>">All CSR Slider</a></li>
		<li><a href="slider.php?type=add_slider&lp=ac&<?php echo session_name().'='.session_id();?>">Add CSR Slider</a></li>
		<li><a href="welfare_slider.php?type=list_welfare_slider&lp=ac&<?php echo session_name().'='.session_id();?>">All Employee Welfare Slider</a></li>
		<li><a href="welfare_slider.php?type=add_welfare_slider&lp=ac&<?php echo session_name().'='.session_id();?>">Add Employee Welfare Slider</a></li>
		  </ul>
		</li> 
		<?php 
		 } 
		 ?>
		<?php if($department=='Admin' || in_array('5', $user_role_arr))
		{
		?>
		<li id="5"><a style="cursor: pointer;"><i class="fa fa-edit"></i>Asset Management <span class="fa fa-chevron-down"></span></a>
		  <ul class="nav child_menu" style="display: none">
		
		<li><a href="asset_management.php?type=list_asset_management&lp=ac&<?php echo session_name().'='.session_id();?>">All Asset Management</a></li>
		<li><a href="asset_management.php?type=add_asset_management&lp=ac&<?php echo session_name().'='.session_id();?>">Add Asset Management</a></li>
		
		  </ul>
		</li> 		
			
		<?php 
		} 
		?>
		<?php if($department=='Admin' || in_array('6', $user_role_arr))
		{ 
		?>
		<li id="6"><a style="cursor: pointer;"><i class="fa fa-edit"></i>Daily Shedule Document <span class="fa fa-chevron-down"></span></a>
		  <ul class="nav child_menu" style="display: none">
		
		<li><a href="schedule_doc.php?type=list_schedule_doc&lp=ac&<?php echo session_name().'='.session_id();?>">All Document</a></li>
		<li><a href="schedule_doc.php?type=add_schedule_doc&lp=ac&<?php echo session_name().'='.session_id();?>">Add Document</a></li>
		  </ul>
		</li> 
		
		<?php 
		} 
		?>
		<?php if($department=='Admin' || in_array('7', $user_role_arr))
		{ 
		?>
<li id="7"><a style="cursor: pointer;"><i class="fa fa-edit"></i>Manage Tariff Category <span class="fa fa-chevron-down"></span></a>
		  <ul class="nav child_menu" style="display: none">
		
		<li><a href="tariff_category.php?type=list_tariff_category&lp=ac&<?php echo session_name().'='.session_id();?>">All Tariff Category</a></li>
		<li><a href="tariff_category.php?type=add_tariff_category&lp=ac&<?php echo session_name().'='.session_id();?>">Add Tariff Category</a></li>
		  </ul>
		</li> 
	<?php 
		} 
		?>
		<?php if($department=='Admin' || in_array('8', $user_role_arr))
		{ 
		?>	
<li id="8"><a style="cursor: pointer;"><i class="fa fa-edit"></i>Manage Tariff  <span class="fa fa-chevron-down"></span></a>
		  <ul class="nav child_menu" style="display: none">
		
		<li><a href="tariff.php?type=list_tariff&lp=ac&<?php echo session_name().'='.session_id();?>">All Tariff</a></li>
		<li><a href="tariff.php?type=add_tariff&lp=ac&<?php echo session_name().'='.session_id();?>">Add Tariff</a></li>
		  </ul>
		</li> 
	<?php 
		} 
		?>
		<?php if($department=='Admin' || in_array('9', $user_role_arr))
		{
		 ?>	
		<li id="9"><a style="cursor: pointer;"><i class="fa fa-edit"></i>Manage Ash Stock <span class="fa fa-chevron-down"></span></a>
		  <ul class="nav child_menu" style="display: none">
		
		<li><a href="ash_stock.php?type=list_ash_stock&lp=ac&<?php echo session_name().'='.session_id();?>">All Ash Stock</a></li>
		<li><a href="ash_stock.php?type=add_ash_stock&lp=ac&<?php echo session_name().'='.session_id();?>">Add Ash Stock</a></li>
		  </ul>
		</li> 
		<?php 
		} 
		?>
		<?php if($department=='Admin' || in_array(10, $user_role_arr))
		{
		 ?>
		<li id="10"><a style="cursor: pointer;"><i class="fa fa-edit"></i>Manage Tender<span class="fa fa-chevron-down"></span></a>
		  <ul class="nav child_menu" style="display: none">
		
		<li><a href="tender.php?type=list_tender&lp=ac&<?php echo session_name().'='.session_id();?>">All Tender</a></li>
		<li><a href="tender.php?type=add_tender&lp=ac&<?php echo session_name().'='.session_id();?>">Add Tender</a></li>
		  </ul>
		</li> 
		<?php 
		}
		 ?>
		<?php if($department=='Admin' || in_array('11', $user_role_arr))
		{
		 ?>
		<li id="11"><a style="cursor: pointer;"><i class="fa fa-edit"></i>Manage EC Compliance<span class="fa fa-chevron-down"></span></a>
		  <ul class="nav child_menu" style="display: none">
		
		<li><a href="ec_compliance.php?type=list_ec_compliance&lp=ac&<?php echo session_name().'='.session_id();?>">All EC Compliance</a></li>
		<li><a href="ec_compliance.php?type=add_ec_compliance&lp=ac&<?php echo session_name().'='.session_id();?>">Add EC Compliance</a></li>
		  </ul>
		</li>
		<?php 
		} 
		?>
		<?php if($department=='Admin' || in_array('12', $user_role_arr))
		{ 
		?>
		<li id="12"><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Gallery <span class="fa fa-chevron-down"></span></a>
  <ul class="nav child_menu" style="display: none">
<li><a href="gallery.php?type=list_gal_cat&lp=ac&<?php echo session_name().'='.session_id();?>">List Gallery Category</a></li>
<li><a href="gallery.php?type=add_gal_cat&lp=ac&<?php echo session_name().'='.session_id();?>">Add Gallery Category</a></li>
<li><a href="gallery.php?type=list_gallery&lp=ac&<?php echo session_name().'='.session_id();?>">List Gallery</a></li>
<li><a href="gallery.php?type=add_gallery&lp=ac&<?php echo session_name().'='.session_id();?>">Add Gallery</a></li>
  </ul>
</li>
		<?php 
		} 
		?>
		<?php if($department=='Admin' || in_array('13', $user_role_arr))
		{ 
		?>
<li id="13"><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Board of Directors <span class="fa fa-chevron-down"></span></a>
		  <ul class="nav child_menu" style="display: none">
		
		<li><a href="team.php?type=list_team&lp=ac&<?php echo session_name().'='.session_id();?>">All Board of Directors</a></li>
		<li><a href="team.php?type=add_team&lp=ac&<?php echo session_name().'='.session_id();?>">Add Board of Directors</a></li>
		  </ul>
		</li>  
		<?php 
		} 
		?>
		
                <!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Social <span class="fa fa-chevron-down"></span></a>
  <ul class="nav child_menu" style="display: none">
<li><a href="social.php?type=edit_social&lp=ac&<?php echo session_name().'='.session_id();?>">Edit Social</a></li>
  </ul>
</li> 

<li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Service <span class="fa fa-chevron-down"></span></a>
      <ul class="nav child_menu" style="display: none">
     	
        <li><a href="service.php?type=list_service&lp=ac&<?php echo session_name().'='.session_id();?>">All Service</a></li>
        <li><a href="service.php?type=add_service&lp=ac&<?php echo session_name().'='.session_id();?>">Add Service</a></li>
      </ul>
 </li>
  <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Clients <span class="fa fa-chevron-down"></span></a>
		  <ul class="nav child_menu" style="display: none">
		
		<li><a href="client.php?type=list_client&lp=ac&<?php echo session_name().'='.session_id();?>">All Clients</a></li>
		<li><a href="client.php?type=add_client&lp=ac&<?php echo session_name().'='.session_id();?>">Add Clients</a></li>
		  </ul>
		</li> 
		
		
		  
		
      <li><a style="cursor: pointer;"><i class="fa fa-edit"></i>Manage Contact<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
 	             	
                    <li><a href="contacts.php?type=edit_contacts&contact_id=1&lp=ac&<?php echo session_name().'='.session_id();?>">Edit Contact</a></li>
                      </ul>
                </li>
                
    
                 -->
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                <!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Slider <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
 	             	
                    <li><a href="slider.php?type=list_slider&lp=ac&<?php echo session_name().'='.session_id();?>">All Slider</a></li>
                    <li><a href="slider.php?type=add_slider&lp=ac&<?php echo session_name().'='.session_id();?>">Add Slider</a></li>
                  </ul>
                </li> -->
                 <!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Home Video <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
 	             	
                    <li><a href="about.php?type=list_about&lp=ac&<?php echo session_name().'='.session_id();?>">All Home Video </a></li>
                    <li><a href="about.php?type=add_about&lp=ac&<?php echo session_name().'='.session_id();?>">Add Home Video </a></li>
                  </ul>
                </li> -->
<!--<li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Color <span class="fa fa-chevron-down"></span></a>
  <ul class="nav child_menu" style="display: none">
ft
<li><a href="color.php?type=list_color&lp=ac&<?php echo session_name().'='.session_id();?>">All Color</a></li>
<li><a href="color.php?type=add_color&lp=ac&<?php echo session_name().'='.session_id();?>">Add Color</a></li>
  </ul>
</li>-->
                <!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Category <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
 	             	<li><a href="category.php?type=listcat&lp=ac&<?php echo session_name().'='.session_id();?>">All Category</a></li>
                    <li><a href="category.php?type=adcat&lp=adc&<?php echo session_name().'='.session_id();?>">Add Category</a></li>
                  </ul>
                </li> 
               <!--  <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Sub Category <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
 	             	<li><a href="subcategory.php?type=listsubcat&lp=ac&<?php echo session_name().'='.session_id();?>">All Sub Category</a></li>
                    <li><a href="subcategory.php?type=adsubcat&lp=adc&<?php echo session_name().'='.session_id();?>">Add Sub Category</a></li>
                  </ul>
                </li> -->
              <!--   <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Sub SubCategory <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
 	             	<li><a href="subsubcategory.php?type=listsubsubcat&lp=ac&<?php echo session_name().'='.session_id();?>">All Sub Sub Category</a></li>
                    <li><a href="subsubcategory.php?type=adsubsubcat&lp=adc&<?php echo session_name().'='.session_id();?>">Add Sub Sub Category</a></li>
                  </ul>
                </li> -->
                <!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Product <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
 	             	
                    <li><a href="product.php?type=list_product&lp=ac&<?php echo session_name().'='.session_id();?>">All Product</a></li>
                    <li><a href="product.php?type=add_product&lp=ac&<?php echo session_name().'='.session_id();?>">Add Product</a></li>
                  </ul>
                </li> -->
             <!--    <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Award <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
 	             	
                    <li><a href="award.php?type=list_award&lp=ac&<?php echo session_name().'='.session_id();?>">All Award</a></li>
                    <li><a href="award.php?type=add_award&lp=ac&<?php echo session_name().'='.session_id();?>">Add Award</a></li>
                  </ul>
                </li> -->
                
                
                
                
               <?php if($department=='Admin' || in_array('14', $user_role_arr))
               { 
               	?>
                 <li id="14"><a style="cursor: pointer;"><i class="fa fa-edit"></i>Manage Internship<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
 	             	
                    <li><a href="internship.php?type=list_internship&lp=ac&<?php echo session_name().'='.session_id();?>">All Internship</a></li>
                  	<li><a href="internship.php?type=add_internship&lp=ac&<?php echo session_name().'='.session_id();?>">Add Internship</a></li>
                  </ul>
                </li>
                <?php 
			   } 
			   ?>
                <?php if($department=='Admin' || in_array('15', $user_role_arr))
                { 
                	?>
                <li id="15"><a style="cursor: pointer;"><i class="fa fa-edit"></i>Manage Job<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
 	             	
                    <li><a href="job.php?type=list_job&lp=ac&<?php echo session_name().'='.session_id();?>">All Job</a></li>
                  	<li><a href="job.php?type=add_job&lp=ac&<?php echo session_name().'='.session_id();?>">Add Job</a></li>
                  </ul>
                </li>
				<?php 
				} 
				?>
                <?php if($department=='Admin' || in_array('16', $user_role_arr))
                {
                 ?>
                <li id="16"><a style="cursor: pointer;"><i class="fa fa-edit"></i>Manage  Application<span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
 	             	
                    <li><a href="job_application.php?type=list_job_application&lp=ac&<?php echo session_name().'='.session_id();?>">All Job Application</a></li>
                     <li><a href="job_application.php?type=list_internship_application&lp=ac&<?php echo session_name().'='.session_id();?>">All Internship Application</a></li>
                  
                  </ul>
                </li>
                <?php 
				} 
				?>
                <?php if($department=='Admin' || in_array('17', $user_role_arr))
                { 
                ?>
                <li id="17"><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Awards <span class="fa fa-chevron-down"></span></a>
      <ul class="nav child_menu" style="display: none">
     	
        <li><a href="awards.php?type=list_awards&lp=ac&<?php echo session_name().'='.session_id();?>">All Awards</a></li>
        <li><a href="awards.php?type=add_awards&lp=ac&<?php echo session_name().'='.session_id();?>">Add Awards</a></li>
      </ul>
 </li> 
  				<?php 
				} 
				?>
                <?php if($department=='Admin' || in_array('18', $user_role_arr))
                { 
                ?>
 <li id="18"><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage ESG <span class="fa fa-chevron-down"></span></a>
      <ul class="nav child_menu" style="display: none">
     	
        <li><a href="esg.php?type=list_esg&lp=ac&<?php echo session_name().'='.session_id();?>">All ESG</a></li>
        <li><a href="esg.php?type=add_esg&lp=ac&<?php echo session_name().'='.session_id();?>">Add ESG</a></li>
      </ul>
 </li> 
  				<?php 
				} 
				?>
                <?php if($department=='Admin' || in_array('19', $user_role_arr))
                { 
                ?>
 <li id="19"><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Environmental Management <span class="fa fa-chevron-down"></span></a>
      <ul class="nav child_menu" style="display: none">
     	
        <li><a href="environmental_management.php?type=list_environmental_management&lp=ac&<?php echo session_name().'='.session_id();?>">All Environmental Management</a></li>
        <li><a href="environmental_management.php?type=add_environmental_management&lp=ac&<?php echo session_name().'='.session_id();?>">Add Environmental Management</a></li>
      </ul>
 </li> 
 				<?php 
				} 
				?>
                <?php if($department=='Admin' || in_array('20', $user_role_arr))
                { 
                ?>				
<li id="20"><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage News <span class="fa fa-chevron-down"></span></a>
      <ul class="nav child_menu" style="display: none">
     	
        <li><a href="post.php?type=list_post&lp=ac&<?php echo session_name().'='.session_id();?>">All News</a></li>
        <li><a href="post.php?type=add_post&lp=ac&<?php echo session_name().'='.session_id();?>">Add News</a></li>
      </ul>
 </li> 
				<?php 
				} 
				?>
            <!--  <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Partner Logo <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
 	             	
                    <li><a href="logo.php?type=list_logo&lp=ac&<?php echo session_name().'='.session_id();?>">All Partner Logo</a></li>
                    <li><a href="logo.php?type=add_logo&lp=ac&<?php echo session_name().'='.session_id();?>">Add Partner Logo</a></li>
                  </ul>
             </li>  -->
 
<!--<li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Coupon <span class="fa fa-chevron-down"></span></a>
  <ul class="nav child_menu" style="display: none">

<li><a href="coupon.php?type=list_coupon&lp=ac&<?php echo session_name().'='.session_id();?>">All Coupon</a></li>
<li><a href="coupon.php?type=add_coupon&lp=ac&<?php echo session_name().'='.session_id();?>">Add Coupon</a></li>
  </ul>
</li>-->





            <!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Testimonial <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
 	             	
                    <li><a href="testimonial.php?type=list_testimonial&lp=ac&<?php echo session_name().'='.session_id();?>">All Testimonial</a></li>
                    <li><a href="testimonial.php?type=add_testimonial&lp=ac&<?php echo session_name().'='.session_id();?>">Add Testimonial</a></li>
                  </ul>
                </li> -->
                
          <!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Product Enquiry <span class="fa fa-chevron-down"></span></a>
          <ul class="nav child_menu" style="display: none">
         	
            <li><a href="prod_enquiry.php?type=list_prod_enquiry&lp=ac&<?php echo session_name().'='.session_id();?>">All Enquiry</a></li>
            <li><a href="prod_enquiry.php?type=view_prod_enquiry&lp=ac&<?php echo session_name().'='.session_id();?>">Add Enquiry</a></li>
          </ul>
        </li> -->
       
		 <!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Faculty <span class="fa fa-chevron-down"></span></a>
		  <ul class="nav child_menu" style="display: none">
		
		<li><a href="faculty.php?type=list_faculty&lp=ac&<?php echo session_name().'='.session_id();?>">All Faculty</a></li>
		<li><a href="faculty.php?type=add_faculty&lp=ac&<?php echo session_name().'='.session_id();?>">Add Faculty</a></li>
		  </ul>
		</li>  -->
		 <!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Topper <span class="fa fa-chevron-down"></span></a>
		  <ul class="nav child_menu" style="display: none">
		
		<li><a href="topper.php?type=list_topper&lp=ac&<?php echo session_name().'='.session_id();?>">All Topper</a></li>
		<li><a href="topper.php?type=add_topper&lp=ac&<?php echo session_name().'='.session_id();?>">Add Topper</a></li>
		  </ul>
		</li> -->

 <!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Infrastructure <span class="fa fa-chevron-down"></span></a>
  <ul class="nav child_menu" style="display: none">

<li><a href="infrastructure.php?type=list_infrastructure&lp=ac&<?php echo session_name().'='.session_id();?>">All Infrastructure</a></li>
<li><a href="infrastructure.php?type=add_infrastructure&lp=ac&<?php echo session_name().'='.session_id();?>">Add Infrastructure</a></li>
  </ul>
</li> -->
<!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Course <span class="fa fa-chevron-down"></span></a>
  <ul class="nav child_menu" style="display: none">

<li><a href="course.php?type=list_course&lp=ac&<?php echo session_name().'='.session_id();?>">All Course</a></li>
<li><a href="course.php?type=add_course&lp=ac&<?php echo session_name().'='.session_id();?>">Add Course</a></li>
  </ul>
</li> -->

<!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Video Gallery <span class="fa fa-chevron-down"></span></a>
  <ul class="nav child_menu" style="display: none">

<li><a href="gallery.php?type=list_video_gallery&lp=ac&<?php echo session_name().'='.session_id();?>">List Video Gallery</a></li>
<li><a href="gallery.php?type=add_video_gallery&lp=ac&<?php echo session_name().'='.session_id();?>">Add Video Gallery</a></li>
  </ul>
</li> -->

<!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Home Gallery <span class="fa fa-chevron-down"></span></a>
  <ul class="nav child_menu" style="display: none">

<li><a href="gallery.php?type=list_home_gallery&lp=ac&<?php echo session_name().'='.session_id();?>">List Home Gallery</a></li>
<li><a href="gallery.php?type=add_home_gallery&lp=ac&<?php echo session_name().'='.session_id();?>">Add Home Gallery</a></li>
  </ul>
</li> -->
              
                <!-- <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Manage Request Call Back <span class="fa fa-chevron-down"></span></a>
  <ul class="nav child_menu" style="display: none">
<li><a href="newsletter.php?type=list_newsletter&lp=ac&<?php echo session_name().'='.session_id();?>">List Request Call Back</a></li>
  </ul>
</li>  -->
             
  
         
              <!--   <li><a style="cursor: pointer;"><i class="fa fa-edit"></i> Order History <span class="fa fa-chevron-down"></span></a>
  <ul class="nav child_menu" style="display: none">

<li><a href="order.php?type=list_order&lp=ac&<?php echo session_name().'='.session_id();?>">List Order</a></li>


  </ul>
</li>-->
                            
              </ul>
            </div>
          </div>
          <!-- /sidebar menu -->
       </div>
      </div>