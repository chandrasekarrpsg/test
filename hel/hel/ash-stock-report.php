<?php include "include/header.php"; ?>
<?php
$get_page_sql="select * from tbl_pagecontent where id=5";
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
				<form>
					<!-- <div class="appfld">
						<label>Select date range</label>
						<div class="row">
							<div class="col-sm-6 colm">
								<div class="opencal">
									<h4>Form</h4>
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
						<input type="button" class="addmor" value="Submit" onclick="get_ash_stock();"/>
					</div> -->
					<div class="opensubmittablee graybg">
						<?= $get_page_row['content'];?>
						<div class="table-responsive tablehel" id="getstockresult">
							<?php	
  	$get_ash_stock_sql="select * from  tbl_ash_stock  order by upload_date asc";
	$get_ash_stock_rs=mysqli_query($conn,$get_ash_stock_sql);
	$get_ash_stock_num=mysqli_num_rows($get_ash_stock_rs);	
	
?>
							<table class="table">
<tr>
<th>Date</th>
<th>Day Closing Stock of Fly Ash (MT)</th>
<th>Day Closing Stock of Bottom Ash (MT)</th>
</tr>
								
							
	
	<?php
	if($get_ash_stock_num>0)
	{	
	while($get_ash_stock_row=mysqli_fetch_array($get_ash_stock_rs))
	{
	?>
		<tr>
		<td><?php echo date("d/m/Y",strtotime($get_ash_stock_row['ash_stock_date']));?></td>
		<td><?php echo $get_ash_stock_row['fly_ash_closing_stock'];?></td>
		<td><?php echo $get_ash_stock_row['bottom_ash_closing_stock'];?></td>
		</tr>
	<?php	
	}
	?>
	<?php
	}
	else
	{
	echo "<tr><td align='center' colspan='3'>No data found</td></tr>";	
	}	

?>
</table>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	function get_ash_stock()
	{
		
		var fromdate = $("#datepickerform").datepicker().val();
		var todate = $("#datepickerform1").datepicker().val();
		
		
		
		$.ajax({
		type: "POST",
		url: "<?= SITE_URL;?>ajax_get_ash_stock.php",
		dataType: 'html',
		data:"datefrom="+fromdate+"&dateto="+todate+"&action=showstock",
		success: function(html){
		
		$("#getstockresult").html(html);
		},error: function(){
		},complete: function(){
		}
		});
	}
</script>




<?php include "include/footer-inner.php"; ?>