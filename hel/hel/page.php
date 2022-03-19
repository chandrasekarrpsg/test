<?php include "include/header.php"; ?>
<?php

$alise=mysqli_real_escape_string($conn,$_REQUEST['alise']);
$stmt = mysqli_stmt_init($conn);
$query="select id from tbl_pagecontent where alise=?";
mysqli_stmt_prepare($stmt, $query);
mysqli_stmt_bind_param($stmt, "s", $alise);
mysqli_stmt_execute($stmt);
mysqli_stmt_bind_result($stmt, $page_id);
mysqli_stmt_fetch($stmt);
mysqli_stmt_close($stmt);

$get_page_sql="select * from tbl_pagecontent where id='".$page_id."'";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>

<div class="bannersec innerbanner carrerban">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>)">
		<div class="bantxt text-right">
			<div class="container">
				<div class="txtb wow fadeInUp">
<?= $get_page_row['banner_heading'];?>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="aboutpage carrerpagess">
	<div class="container heading2">
		<div class="aboutTpara">
<?= $get_page_row['content'];?>
		</div>
		<?php
		if($get_page_row['add_cont1']!='')
		{
		?>
		<div class="aboutTpara">
<?= $get_page_row['add_cont1'];?>
		</div>
		<?php
		}
		?>
		<?php
		if($get_page_row['add_cont2']!='')
		{
		?>
		<div class="aboutTpara">
<?= $get_page_row['add_cont2'];?>
		</div>
		<?php
		}
		?>
		<?php
		if($get_page_row['add_cont3']!='')
		{
		?>
		<div class="aboutTpara">
<?= $get_page_row['add_cont3'];?>
		</div>
		<?php
		}
		?>
		<?php
		if($get_page_row['add_cont4']!='')
		{
		?>
		<div class="aboutTpara">
<?= $get_page_row['add_cont4'];?>
		</div>
		<?php
		}
		?>
	</div>
</div>





<?php include "include/footer-inner.php"; ?>