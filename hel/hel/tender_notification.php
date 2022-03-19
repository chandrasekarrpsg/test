<?php include "include/header.php"; ?>

<?php
$get_page_sql="select * from tbl_pagecontent where id=6";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>

<div class="bannersec innerbanner">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>)">
		<div class="bantxt">
			<div class="container">
				<div class="txtb wow fadeInUp">
<?= $get_page_row['banner_heading'];?>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="carrerpagess corporFormspage">
	<div class="container">
		<div class="carrerpBox">
			<div class="table-responsive tablehel tabletenders">
				<table class="table">
					<tr>
						<th>Tender Title</th>
						<th>Reference No</th>
						<th>Closing Date</th>
						<th>Ref. Date</th>
					</tr>
					<?php
					$today=date('Y-m-d');
					$get_tender_sql="select * from tbl_tender order by tender_id desc";
					$get_tender_rs=mysqli_query($conn,$get_tender_sql);
					while($get_tender_row=mysqli_fetch_array($get_tender_rs))
					{
					?>
					<tr>
						<td><a href="<?= SITE_URL;?>admin/post_img/<?= $get_tender_row['tender_file']; ?>" target="_blank"><?= $get_tender_row['tender_title']; ?> <i class="fa fa-file-pdf-o" aria-hidden="true"></i></a></td>
						<td><?= $get_tender_row['tender_desc']; ?></td>
						<td <?php if($today>$get_tender_row['tender_date']){?>class="passw"<?php } ?>><?= date("d-M-Y",strtotime($get_tender_row['tender_date'])); ?></td>
						<td <?php if($today>$get_tender_row['tender_date2']){?>class="passw"<?php } ?>><?= date("d-M-Y",strtotime($get_tender_row['tender_date2'])); ?></td>
					</tr>
					<?php
					}
					?>
					
				</table>
			</div>
		</div>
	</div>
</div>

<?php include "include/footer-inner.php"; ?>