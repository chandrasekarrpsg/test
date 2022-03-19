<?php
include("include/apps_top.php");
if(isset($_REQUEST['action']) && $_REQUEST['action']=='download')
{
	$date_from=$_REQUEST['datefrom'];
	$date_to=$_REQUEST['dateto'];
	
  $get_schedule_doc_sql="select * from tbl_schedule_doc where report_date between '$date_from' and '$date_to' order by upload_date asc";
	$get_schedule_doc_rs=mysqli_query($conn,$get_schedule_doc_sql);
	$get_schedule_doc_num=mysqli_num_rows($get_schedule_doc_rs);	
	if($get_schedule_doc_num>0)
	{
?>
	<ul class="clsscheduledoc">
	<?php	
		
		while($get_schedule_doc_row=mysqli_fetch_array($get_schedule_doc_rs))
		{
			 
		?>
		<li><a href="<?= SITE_URL; ?>admin/post_img/<?php echo $get_schedule_doc_row['schedule_doc_file'];?>" target="_blank" download><?php echo $get_schedule_doc_row['schedule_doc_title'];?></a></li>
		<?php	
		}
	?>
	</ul>
<?php
	}
	else
	{
	echo "<p>No data Found</p>";	
	}	
}
?>
