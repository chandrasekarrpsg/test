<?php
include("include/apps_top.php");?>
<?php
if(isset($_REQUEST['action']) && $_REQUEST['action']=='showstock')
{
	$date_from=$_REQUEST['datefrom'];
	$date_to=$_REQUEST['dateto'];
?>

<?php	
  	$get_ash_stock_sql="select * from  tbl_ash_stock where ash_stock_date between '$date_from' and '$date_to' order by upload_date asc";
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
}
?>
</table>

