<script type="text/javascript">
function delbanner1(newsletter_id)
{
	
	var bn = confirm('Are you sure to delete this item');
	if(bn==true)
	{
	
	location.href='newsletter.php?type=list_newsletter&lp=ac&newsletter_id='+newsletter_id+'&actnnewsletter=dellnewsletter';
	}
	else
	{
	return false;
	}
	
}
function forceenable(newsletter_id)
{
	
	var bn = confirm(' This user is unsubscribed now. Are you sure to Enable this user.');
	if(bn==true)
	{
	
	location.href='newsletter.php?type=list_newsletter&lp=ac&newsletter_id='+newsletter_id+'&actnnewsletter=enablenewsletter';
	}
	else
	{
	return false;
	}
	
}
</script>
<script type="text/javascript">
checked = false;
function checkedAll () {
if (checked == false){checked = true}else{checked = false}
for (var i = 0; i < document.getElementById('from1').elements.length; i++) {
document.getElementById('from1').elements[i].checked = checked;
}
}
</script>
       
              <div class="x_panel">
                <div class="x_title">
                  <h2>List Request Call Back </h2>
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                	
                 <form name="from1" id="from1" action="send.php" method="post">
                 	 <!-- <input name="submitnews" type="submit" id="submitnews" value="Send"> -->
                 	
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                      	<!-- <th><input type="checkbox" name="chkall" onclick='checkedAll();'/>Check All</th> -->
                      	 <th>Name</th>
                        <th>Phone</th>
                       
                        <th>Action</th>
                      </tr>
                    </thead>


                    <tbody>
                    	
<?php $list_che_sql1 = 'SELECT * FROM  tbl_newsletter';
$list_che_query1 = mysqli_query($conn,$list_che_sql1);
$rowCount1 = 1;
while($list_che1 = mysqli_fetch_array($list_che_query1)){?>
                    	
                    	
                    <tr>
                    	
                    	<!-- <td>
                    		<?php
                    		if($list_che1['unsubscribe']==1)
                    		{
                    		?>
                    		<input type="checkbox" name="chksel[]" value="<?php print $list_che1['newsletter_id']; ?>" disabled="disabled"/> 
                    		
                    		<?php
							}
							else
							{
							?>
                    		<input type="checkbox" name="chksel[]" value="<?php print $list_che1['newsletter_id']; ?>" /> 
                    		<?php
							}
                    		?>
                    	</td> -->
<td><span <?php if($list_che1['unsubscribe']==1){?>style="color:red"<?php }?>><?php echo $list_che1['newsletter_name']; ?></span>  </td>                    	
<td><span <?php if($list_che1['unsubscribe']==1){?>style="color:red"<?php }?>><?php echo $list_che1['newsletter_email']; ?></span>  </td>

<td>					
		
		<a class="btn btn-danger btn-xs" onClick="delbanner1(<?php print $list_che1['newsletter_id']; ?>);">Delete</a>	
		<?php
		if($list_che1['unsubscribe']==1)
		{
		?>
		<a class="btn btn-info btn-xs" onClick="forceenable(<?php print $list_che1['newsletter_id']; ?>);">Force Enable</a>	
		<?php
		}
		?>
	</td>

</tr> 
<?php 
}
?>
                      
                    </tbody>
                  </table>
                 
</form>
                </div>
              </div>
           
 <?php
if(isset($_REQUEST['xl']) && $_REQUEST['xl']=='save')
{
	error_reporting (E_ALL ^ E_NOTICE);
	require_once("excelwriter.class.php");	
	$t=time();
	$excel=new ExcelWriter("Newsletter_".$t.".xls");
	if($excel==false)	
	echo $excel->error;
	$myArr=array("");
	$excel->writeLine($myArr);
	$myArr=array("Email");
	$excel->writeLine($myArr);	
		$qry=mysqli_query($conn,"select * from tbl_newsletter where nws_stat=1");
	if($qry!=false)
	{
		$i=1;
		while($res=mysqli_fetch_array($qry))
		{	
		
			
$myArr=array($res['email']);
			$excel->writeLine($myArr);
			$i++;
		}
}
?>
<script>
window.location='Newsletter_'+<?php echo $t;?>+'.xls';
</script>
<?php
}
?>     