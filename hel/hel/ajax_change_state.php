<?php
include("include/apps_top.php");

$state_name=mysqli_real_escape_string($conn,$_REQUEST['q']);
$stmt = mysqli_stmt_init($conn);
$query="select name from tbl_states where name=?";
mysqli_stmt_prepare($stmt, $query);
mysqli_stmt_bind_param($stmt, "s", $state_name);
mysqli_stmt_execute($stmt);
mysqli_stmt_bind_result($stmt, $name);
mysqli_stmt_fetch($stmt);
mysqli_stmt_close($stmt);

?>
<option value="">Select City</option>
<?php
$get_city_sql="select distinct name from tbl_cities where state_id=(select distinct id from tbl_states where name='".$name."') order by name asc";
$get_city_rs=mysqli_query($conn,$get_city_sql);
while($get_city_row=mysqli_fetch_array($get_city_rs))
{
?>
<option value="<?= $get_city_row['name'];?>"><?= $get_city_row['name'];?></option>
<?php 
}
?>