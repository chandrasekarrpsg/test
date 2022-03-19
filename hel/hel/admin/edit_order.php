<?php
if(isset($_REQUEST['updstat']) && ($_REQUEST['updstat']=='Update')){
	echo $updstatSql = "update tbl_order set payment_status='".$_REQUEST['ord']."' where order_unique_id='".$_REQUEST['ordid']."'";
	mysqli_query($conn,$updstatSql);
	
}
$cid = $_REQUEST['order_id'];
$sl = 'SELECT * from tbl_order WHERE order_unique_id = "'.$cid.'"';
$q  = mysqli_query($conn,$sl);
$rc = mysqli_fetch_array($q);
?>
<div class="data-content">
	
	<div class="order_details">
							<h2>Order Details <?php echo $rc['order_unique_id'];?></h2>
						

							<div class="order_details_part ">
								<div class="top_bg2"></div>
								<div class="mdl_bg2 dt_inner">
									<div class="user_name dt_inner">
										<div class="user_name_inner">						
											<div class="sec_order">
											<label class="tmain">Order Id:</label>
											<label><?php echo $rc['order_unique_id'];?></label>
                                            </div>
                                            
                                           <div class="sec_order">
											<label class="tmain">Order Date:</label>
											<label><?php echo $rc['order_date'];?></label>
                                            </div>
                                           
                                            <div class="sec_order">
											<label class="tmain2">Billing Details:</label>
											<label class="ttm2">Name : <?php echo $rc['order_by'];?>&nbsp;</br>	
												Email : <?php echo $rc['order_email'];?>&nbsp;	</br>	
												Phone : <?php echo $rc['order_phone'];?>&nbsp;	</br>													
											</label>
											<label class="ttm3">	
											<?php echo $rc['order_address'];?>&nbsp;</br>										
											<?php echo $rc['order_city'];?>&nbsp;</br>
											<?php echo $rc['order_zip'];?>&nbsp;	</br>
											
											</label>
                                            </div>
                                            
                                             <div class="sec_order">
											<label class="tmain2">Shipping Details:</label>
											<label class="ttm2">
											Name : <?php echo $rc['order_ship_by'];?>&nbsp;</br>	
											Email : <?php echo $rc['order_ship_email'];?>&nbsp;	</br>															
											Phone : <?php echo $rc['order_ship_phone'];?>&nbsp;	</br>													
											</label>
											<label class="ttm3">
											<?php echo $rc['order_ship_address'];?>&nbsp;</br>
											<?php echo $rc['order_ship_city'];?>&nbsp;</br>
											<?php echo $rc['order_ship_zip'];?>&nbsp;</br>
											</label>
                                            </div>
                                            
                                            
<?php $sl1 = 'SELECT * from tbl_order WHERE order_unique_id = "'.$cid.'"';
$q1  = mysqli_query($conn,$sl1);
$rc1 = mysqli_fetch_array($q1);?>      
                                            
                                           
											
											
<table style="width:100%">
<tr class="hedtxt_table">
 
  <td class="ft251">Product Name</td>
  <td class="ft252">Price</td>
    <td class="ft253">Qty</td>

  
</tr>

<?php 
$i=1;
$order_sql1 = "SELECT * from tbl_order WHERE order_unique_id = '".$cid."'";
$order_exe1 = mysqli_query($conn,$order_sql1); 
while($order_rows1 = mysqli_fetch_array($order_exe1)){
	
$prod_sql="select * from tbl_product where product_id='".$order_rows1['order_prod_id']."'";
	$prod_res=mysqli_query($conn,$prod_sql);
		$prod_row=mysqli_fetch_array($prod_res);
		$comb0='';
	
	
?>
<tr>
  
   	
  <td class="ft251"> <?php echo $order_rows1['order_prod_name'];	if($prod_row['prod_cobmo_name']!=''){ ?>
  	
	Combo Of <?php echo $prod_row['prod_cobmo_name'];
	
		}?>
  	</td>
  <td class="ft252">Rs.<?php echo $order_rows1['order_prod_price'];?></td>
  <td class="ft253"><?php echo $order_rows1['order_prod_qnt'];?></td>
  
 
</tr>
<?php
$total =  $total + $price;
$i++;
$comb0='';
} ?>


	


</table>
<?php if($rc['message_gift']!=''){?>
<div class="gtotal">Message Gift</div>
<div class="gvalue"> <?php echo $rc['message_gift'];?></div>
<?php } ?>
<?php if($rc['notes']!=''){?>
<div class="gtotal">Note</div>
<div class="gvalue"> <?php echo $rc['notes'];?></div>
<?php } ?>

<div class="gtotal">Shipping Price</div>
<div class="gvalue">Rs. <?php echo $rc['shipping'];?></div>

<?php if($rc['order_cupon_discount']!='0.00'){?>
<div class="gtotal">Coupon Discount</div>
<div class="gvalue">Rs. <?php echo $rc['order_cupon_discount'];?></div>
<?php } ?>

<div class="gtotal">Total</div>
<div class="gvalue">Rs. <?php echo $rc['order_total'];?></div>

										
											
										</div>

<br/><br/><br/><br/>
<form name="ord_cancel" action="" method="post" >
	<div class="pdt">
		<input type="hidden" name="type" value="edit_order" />
		<input type="hidden" name="order_id" value="<?php echo $rc['order_unique_id'];?>" />
		<input type="hidden" name="cid" value="<?php echo $rc['order_unique_id'];?>" />
		<input type="hidden" name="ordid" value="<?php echo $rc['order_unique_id'];?>" />
		<input type="radio" name="ord" value="Unpaid" <?php if(($rc['payment_status']=='') || ($rc['payment_status']=='Unpaid')){echo 'checked';}?> /> Unpaid
		<input type="radio" name="ord" value="Paid" <?php if($rc['payment_status']=='Paid'){echo 'checked';}?> /> Paid
		
	</div>
	
	<div class="back_to_btn"> <input name="updstat" type="submit" value="Update" /> </div>
</form>

									</div>
								</div>
								<div class="botm_bg2"></div>
							</div>
						</div>
			
	
	

</div>