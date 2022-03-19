<?php include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=3";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>

<div class="bannersec innerbanner">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>)">
		<div class="bantxt text-center">
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
			<div class="applicForm">
				<form method="post" action="" id="frmdailyschedule">
					<div class="appfld">
						
							<?= $get_page_row['content'];?>
					</div>
					
					<div class="appfld">
						<label>Select date range</label>
						<div class="row">
							<div class="col-sm-6 colm">
								<div class="opencal">
									<h4>From</h4>
									<div id="datepickerform"></div>
									
								</div>
							</div>
							<div class="col-sm-6 colm">
								<div class="opencal">
									<h4>To</h4>
									<div id="datepickerform1"></div>
									
								</div>
							</div>
						</div>
						<input type="hidden" name="action" value="download">
						<a href="javascript:void(0);" onclick="get_dailyschedule();"  class="addmor">Download</a>
					</div>
					
				</form>
				<span id="dailyscheduleresult"></span>
			</div>
			
		</div>
	</div>
</div>

<script>
	function get_dailyschedule()
	{
		
		var fromdate = $("#datepickerform").datepicker().val();
		var todate = $("#datepickerform1").datepicker().val();
		
		
		
		$.ajax({
		type: "POST",
		url: "<?= SITE_URL;?>ajax_get_dailyschedule.php",
		dataType: 'html',
		data:"datefrom="+fromdate+"&dateto="+todate+"&action=download",
		success: function(html){
		
		$("#dailyscheduleresult").html(html);
		},error: function(){
		},complete: function(){
		}
		});
	}
</script>




<?php include "include/footer-inner.php"; ?>
