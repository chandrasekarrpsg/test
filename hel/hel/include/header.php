<?php include("apps_top.php");
//error_reporting(E_ALL);
$page=basename($_SERVER['PHP_SELF']);
//date_default_timezone_set('Asia/Calcutta'); 
  ?>
  <?php 
$social_sql="select * from tbl_social where social_id='1'";
$social_run=mysqli_query($conn,$social_sql);
$social_rows=mysqli_fetch_array($social_run);

$contact_sql="select * from tbl_contact where contact_id=1";
$contact_run=mysqli_query($conn,$contact_sql);
$contact_rows=mysqli_fetch_array($contact_run);


$widget_sql = "select * from  tbl_widget where widget_id='1'";
$widget_run = mysqli_query($conn,$widget_sql);
$widget_rows = mysqli_fetch_array($widget_run);
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>HEL</title>
    <link href="<?= SITE_URL; ?>assets/css/bootstrap.css" rel="stylesheet">
    <link href="<?= SITE_URL; ?>assets/css/fonts.css" rel="stylesheet">
	<link href="<?= SITE_URL; ?>assets/css/doc.css" rel="stylesheet">
	<link href="<?= SITE_URL; ?>assets/css/animate.css" rel="stylesheet">
	<link href="<?= SITE_URL; ?>assets/css/jquery.fancybox.css" rel="stylesheet">
	<link href="<?= SITE_URL; ?>assets/css/videopopup.css" rel="stylesheet">
	<link href="<?= SITE_URL; ?>assets/css/owl.carousel.css" rel="stylesheet">
	<link href="<?= SITE_URL; ?>assets/css/jquery-ui.css" rel="stylesheet">
	<script src="<?= SITE_URL; ?>assets/js/jquerymin.js"></script>
		<link href="<?= SITE_URL; ?>assets/css/component.css" rel="stylesheet">
	<link rel="shortcut icon" href="<?= SITE_URL; ?>assets/images/favicon.ico" type="image/x-icon" />
	<link href="<?= SITE_URL; ?>assets/css/fancybox.css" rel="stylesheet">
	<link href="<?= SITE_URL; ?>assets/css/fancyboxjquery.css" rel="stylesheet">
</head>
<body>


<header class="header_sec">
	<div class="container">
		<nav class="navbar navbar-expand-lg nav_top">
			<a class="navbar-brand" href="<?= SITE_URL; ?>">
			<img src="<?= SITE_URL; ?>assets/images/logo2.png" alt="logo" class="logoa"/><img src="<?= SITE_URL; ?>assets/images/logo.png" alt="logo"  class="logob"/></a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			  </button>
			  <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
			  	<!-- <ul class="mr-auto">
			  	</ul> -->
		        <ul class="navbar-nav menu_sec">
		        	<li><a href="<?= SITE_URL; ?>">Home</a></li>    
		             <li><a href="<?= SITE_URL; ?>plant.php">Plant</a></li>        
		             <li><a href="<?= SITE_URL; ?>performance.php">Performance</a></li>        
		             <li class="dropdown">
		             	<a href="<?= SITE_URL; ?>esg.php">ESG</a><span class="dropdown-toggle drop-arw" data-toggle="dropdown"></span>
		             	<ul class="dropdown-menu">
		                    <li class="dropdown-submenu">
		                    	<a href="<?= SITE_URL; ?>environmental_management.php">Environment Management</a><span class="dropdown-toggle drop-arw" data-toggle="dropdown"></span>
		                    	<ul class="dropdown-menu">
		                    		<li><a href="<?= SITE_URL; ?>climate_change_migration.php">Climate Change Mitigation</a></li>
		                    		<li><a href="<?= SITE_URL; ?>water_conservation.php">Water Conservation</a></li>
		                    		<li><a href="<?= SITE_URL; ?>emission_management.php">Emission Management</a></li>
		                    		<li><a href="<?= SITE_URL; ?>biodiversity.php">Biodiversity</a></li>
		                    		<li><a href="<?= SITE_URL; ?>effluent_management.php">Effluent Management</a></li>
		                    		<li><a href="<?= SITE_URL; ?>solidwastemanagement.php">Solid Waste Management</a></li>
		                    		<li><a href="<?= SITE_URL; ?>bio_and_ewaste.php">Bio & E Waste</a></li>
		                    		<li><a href="<?= SITE_URL; ?>environmentpolicy.php">Environmental Policy</a></li>
		                    		<li><a href="<?= SITE_URL; ?>environmentawareness.php">Environmental Awareness</a></li>
		                    	</ul>
		                    </li>
		                    <li><a href="<?= SITE_URL; ?>csr.php">Social Welfare & Responsibility</a></li>
		                    <li class="dropdown-submenu">
		                    	<a href="<?= SITE_URL; ?>occupationalhealthsafety.php">Occupational Health & Safety</a><span class="dropdown-toggle drop-arw" data-toggle="dropdown"></span>
		                    	<ul class="dropdown-menu">
		                    		<li><a href="<?= SITE_URL; ?>safetyinitiatives.php">Safety Practices</a></li>
		                    		<li><a href="<?= SITE_URL; ?>occupationalhealth.php">Occupational Health</a></li>
		                    	</ul>
		                    </li>
		                    <li><a href="<?= SITE_URL; ?>employeewelfare.php">Employee Welfare</a></li>
		                    <li><a href="<?= SITE_URL; ?>learningdevelopment.php">Learning & Development</a></li>
		                    <li><a href="<?= SITE_URL; ?>qualityassurance.php">Quality Assurance</a></li>
		                    <li><a href="<?= SITE_URL; ?>assetmanagement.php">Asset Management</a></li>
		                    <li><a href="<?= SITE_URL; ?>digitalinitiatives.php">Digital Initiatives</a></li>
		                    <li><a href="<?= SITE_URL; ?>leadership.php">Leadership</a></li> 
		                </ul>
		             </li>        
		            
		             <li class="dropdown">
		             	<a href="<?= SITE_URL; ?>csr.php">CSR</a><span class="dropdown-toggle drop-arw" data-toggle="dropdown"></span>
		             	<ul class="dropdown-menu">
		             		<?php
		             		$get_csr_page="select * from tbl_csr_page where active=1 order by id asc";
							$get_csr_rs=mysqli_query($conn,$get_csr_page);
							while($get_csr_row=mysqli_fetch_array($get_csr_rs))
							{
		             		?>
		             		 <li><a href="<?= SITE_URL; ?><?= $get_csr_row['acf_template']?>?csr_id=<?= $get_csr_row['alise']?>"><?= $get_csr_row['page_name']?></a></li>
		                    <?php
							}
		             		?>
		                    <!-- <li><a href="livelihood.html">Livelihood &  Income  Generation</a></li>
		                    <li><a href="healthsanitation.html">Health,  Sanitation  and Water</a></li>
		                    <li><a href="rehabilitation.html">Rehabilitation</a></li>
		                    <li><a href="educationproject.html">Educational  Project </a></li>
		                    <li><a href="socialmobilization.html">Social  Mobilization  and Institution Building</a></li> -->
		                </ul>
		             </li>       
		             <li><a href="<?= SITE_URL; ?>awardsaccolades.php">Awards</a></li>  
		              <li><a href="<?= SITE_URL; ?>gallery.php">Gallery</a></li>       
		             <li><a href="<?= SITE_URL; ?>career.php">Career</a></li> 
		             <li><a href="<?= SITE_URL; ?>news.php">HEL News</a></li>        
		             <li class="dropdown">
		             	<a href="javascript:void(0);">Corporate Information</a><span class="dropdown-toggle drop-arw" data-toggle="dropdown"></span>
		             	<ul class="dropdown-menu">
		                    <li><a href="<?= SITE_URL; ?>ec-compliance-report.php">EC Compliance Report</a></li>
		                    <li><a href="<?= SITE_URL; ?>ash-stock-report.php">Ash Stock Report</a></li>
		                    <li class="dropdown-submenu">
		                    	<a href="<?= SITE_URL; ?>tariff.php">Tariff</a><span class="dropdown-toggle drop-arw" data-toggle="dropdown"></span>
		                    	<ul class="dropdown-menu">
		                    		<?php
		                    		$get_tarrif_category_sql="select * from tbl_tariff_category order by category_id asc";
									$get_tarrif_category_rs=mysqli_query($conn,$get_tarrif_category_sql);
									while($get_tarrif_category_row=mysqli_fetch_array($get_tarrif_category_rs))
									{
		                    		?>
		                    		<li><a href="<?= SITE_URL; ?>tariff.php#tariff<?= $get_tarrif_category_row['category_id'];?>"><?= $get_tarrif_category_row['category_title'];?></a></li>
		                    		<?php
									}
		                    		?>
									
		                    	</ul>
		                    </li>
		                    <li><a href="<?= SITE_URL; ?>daily-schedule.php">Daily Schedule</a></li>
		                    <li><a href="<?= SITE_URL; ?>boardofdirectors.php">Board of Directors</a></li>
		                </ul>
		             </li>        
		             <li><a href="<?= SITE_URL; ?>tender_notification.php">Tender</a></li>
		        </ul>
			  </div>
		</nav>
	</div>
</header>


