<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Content-type: application/json; charset=UTF-8");




if($valid_flag == 0)
{
	$params = array(
	"data" =>'Show'
	);
	echo json_encode($params);
	exit();
} */




//PHP function defined to compute the consumer id check digit
function consumer_id_cdg($pvc_val)
{
	$vnm_mul = 0;
	$vnm_rem = 0;
	$vnm_factor = 0;
	$vcr_char = "";

	$vint_length = strlen($pvc_val);
	$vnm_factor = $vint_length;

	//For loop starts
	for($i=0;$i<$vint_length;$i++)
	{
		$vch_char = substr($pvc_val,$i,1);
		$vnm_mul = $vnm_mul + intval($vch_char) * $vnm_factor;
		$vnm_factor = $vnm_factor - 1;
	}// end of for loop
		
	$vnm_rem = $vnm_mul % 11;

	if($vnm_rem > 1)
	{
		$vint_chk_dgt = 11 - $vnm_rem;
	}
	else
	{
		$vint_chk_dgt = $vnm_rem;
	}
	
	return $vint_chk_dgt;
}

//Application number passed stored in variable
$consid=$_POST['ApplNo'];
$strip_val_cons_id = intval($consid);
$strip_val_cons_id_len = strlen($strip_val_cons_id);
$consumer_id_it = substr($strip_val_cons_id,0,$strip_val_cons_id_len-1);

if(strlen($consid) > 0)
{
	$check_consid = is_numeric($consid);
	
	//Check user input
	 if($check_consid != 1)
	{
		$params = array(
			"data" =>'Invalid Request1'
		);
		echo json_encode($params);
		exit();
	}
	
	//Computing the consumer id check digit
	$ora_cons_id_compute_cdg = consumer_id_cdg($consumer_id_it);
	$original_consumer_id_cdg = substr($consid,10,1);
	
	//Consumer ID check digit validation
	if($ora_cons_id_compute_cdg != $original_consumer_id_cdg)
	{
		$params = array(
			"data" =>'Invalid Request2'
		);
		echo json_encode($params);
		exit();
	}
	
	//Web service called to fetch the customer details
	$params1 = array(
	"cons_id" => $consumer_id_it
	);

	$curlop1 = httpcurlpost("http://itwebscn1z2:8037/ciswspmnt/ws_bill_info_tds.jsp",$params1);
	$json1 = $curlop1;
	$json1 = utf8_encode($json1); 
	$data1 = json_decode($json1);
	$data_billinfo_array = $data1->BILLINFO;
	$data_billinfo_status = $data1->STATUS;
	$data_tdsinfo = $data1->TDSINFORMATION;
		
	if($data_billinfo_status == "OK")
	{
		foreach ($data1->BILLINFO as $condtl)
		{
			$intermediate_cons_num = $condtl->CONS_NUM;
			$intermediate_chk_dgt = $condtl->CHK_DGT;
			$intermediate_cons_id = $condtl->CONS_ID;
			
			$intermediate_mmyy = $condtl->MMYY;
			$intermediate_mmyycd = $condtl->MMYYCD;
					
			$ret_acmm = substr($intermediate_mmyy,0,2);
			$ret_acyy = substr($intermediate_mmyy,2,2);
			$concat_tds_acmmyy = '20'.$ret_acyy.$ret_acmm;
			
			$concat_retrieved_consumer_no = $intermediate_cons_num.$intermediate_chk_dgt;
			

		}//end of for loop
		
		if(strlen($intermediate_cons_num) == 10)
		{
			if($consumer_id_it == $intermediate_cons_id)
			{
				$str_month = substr($intermediate_mmyy,0,2);
				$str_year = substr($intermediate_mmyy,2,2);
				$str_year_ql_pmnt = "20".substr($intermediate_mmyy,2,2);
				
				//Flag value initialised
				$it_paydate_dtl_disp = "";
				
				//Calling web service to fetch the payment details from QL_PMNT_DTL
				$params2 = array(
					"cons_id" => $consumer_id_it,
					"pmnt_mm" => $str_month,
					"pmnt_yy" => $str_year_ql_pmnt
				);
				
				$curlop2 = httpcurlpost("http://itwebscn1z2:8037/ciswspmnt/ws_pmnt_info_tds.jsp",$params2);
				$json2 = $curlop2;
				$json2 = utf8_encode($json2); 
				$data2 = json_decode($json2);
				$data_pmntinfo_array = $data2->PMNTDTLINFO;
				$data_pmntinfo_status = $data2->STATUS;
				$data_pmntinfo_tdsinfo = $data2->TDSINFORMATION;
				
				if($data_pmntinfo_status == "OK")
				{
					foreach ($data2->PMNTDTLINFO as $qlpmntdtl)
					{
						$it_payamount_dtl = $qlpmntdtl->pmnt_amt;
						$it_paydate_dtl = $qlpmntdtl->pmnt_dt;
					}
				}
				else
				{
					$params = array(
						"data" =>'Invalid Request3'
					);
					echo json_encode($params);
					exit();
				}
				
				$pieces_qlpmntdtl = explode("-", @$it_paydate_dtl);
				@$pieces_qlpmntdtl_year = $pieces_qlpmntdtl[0];
				@$pieces_qlpmntdtl_month = $pieces_qlpmntdtl[1];
				@$pieces_qlpmntdtl_day = $pieces_qlpmntdtl[2];
				$it_paydate_dtl_disp = $pieces_qlpmntdtl_day.".".$pieces_qlpmntdtl_month.".".$pieces_qlpmntdtl_year;
										
				if(strlen(@$it_payamount_dtl) > 0 && strlen($it_paydate_dtl) > 0)
				{
					$payment_made_flag = 1;
					
					$disp_paydate = $it_paydate_dtl;
					$disp_payamt = $it_payamount_dtl;
				}
				
				//If no records are retrieved from above
				if($payment_made_flag == 0)
				{
					//Calling web service to fetch the payment details from QL_PAYONLINE
					$params3 = array(
						"cons_num" => $intermediate_cons_num,
						"pmnt_mm" => $str_month,
						"pmnt_yy" => $str_year
					);

					$curlop3 = httpcurlpost("http://itwebscn1z2:8037/ciswspmnt/ws_online_pmnt_info_tds.jsp",$params3);
					$json3 = $curlop3;
					$json3 = utf8_encode($json3); 
					$data3 = json_decode($json3);
					$data_pmntonlineinfo_array = $data3->ONLINEPMNTINFO;
					$data_pmntonlineinfo_status = $data3->STATUS;
					$data_pmntonlineinfo_tdsinfo = $data3->TDSINFORMATION;
					
					if($data_pmntonlineinfo_status == "OK")
					{
						foreach ($data3->ONLINEPMNTINFO as $qlpayonline)
						{
							$it_payamount = $qlpayonline->pmnt_amt;
							$it_paydate = $qlpayonline->pmnt_dt;
						}
					}
					else
					{
						$params = array(
							"data" =>'Invalid Request4'
						);
						echo json_encode($params);
						exit();
					}
					
					$pieces_qlpayonline = explode("-", @$it_paydate);
					@$pieces_qlpayonline_year = $pieces_qlpayonline[0];
					@$pieces_qlpayonline_month = $pieces_qlpayonline[1];
					@$pieces_qlpayonline_day = $pieces_qlpayonline[2];
					$it_paydate_dtl_disp = $pieces_qlpayonline_day.".".$pieces_qlpayonline_month.".".$pieces_qlpayonline_year;
								
					if(strlen(@$it_payamount) > 0 && strlen($it_paydate) > 0)
					{
						$payment_made_flag = 1;
						
						$disp_paydate = $it_paydate;
						$disp_payamt = $it_payamount;
					}
												
				}
				
			}
			else
			{
				$params = array(
					"data" =>'Invalid Request5'
				);
				echo json_encode($params);
				exit();
			}
				
		}
		else
		{
			$params = array(
				"data" =>'Invalid Request6'
			);
			echo json_encode($params);
			exit();
		}
			
	}
	else
	{
		$params = array(
			"data" =>'Invalid Request7'
		);
		echo json_encode($params);
		exit();
	}
		
}
else
{
	$params = array(
		"data" =>'Invalid Request8'
	);
	echo json_encode($params);
	exit();
	
}


if($payment_made_flag == 1)
{
	$tckt_no = 'NA';
	$resultJsonData[]=array(
		'appno'=>$consid,
		'TicktNo'=>$tckt_no,
		'Appl_Status'=>'Paid',
		'UpdatedOn'=>$disp_paydate,
		'deptpayrefno'=>'NA',
		'pgtxn'=>'NA',
		'bankrefno'=>'NA'
		);
		
		$params = array(
			"data" =>$resultJsonData,
		);
		echo json_encode($params);
}
else
{
	$params = array(
		"data" =>'No Payment Data'
	);
	echo json_encode($params);
	
}
 
?>
