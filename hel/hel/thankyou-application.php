<?php
include("include/apps_top.php");
if(empty($_SESSION['reff_no']))
{
	header("Location:".SITE_URL);
	exit();
}
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
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/fonts.css" rel="stylesheet">
	<link href="assets/css/doc.css" rel="stylesheet">
	<link rel="shortcut icon" href="assets/images/favicon.ico" type="image/x-icon" />
</head>
<body>



<?php
if(isset($_SESSION['reff_no']) && $_SESSION['reff_no']!='')
{
?>

<div class="thankoupage">
	<div class="container">
		<h1>Thank You</h1>
		<strong>Your application has been successfully submitted.</strong>
		<p>Your reference number is <a><?= $_SESSION['reff_no'];?></a> </p>
	</div>
</div>

<?php
}
unset($_SESSION['reff_no']);
?>















<!-- Bootstrap core JavaScript -->
<script src="assets/js/jquerymin.js"></script>
<script src="assets/js/bootstrap.js"></script>

<script>
 	 window.setTimeout(function(){
        window.location.href = "<?= SITE_URL;?>";
    }, 20000);
 </script>

</body>
</html>
