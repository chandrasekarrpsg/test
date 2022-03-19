<script type="text/javascript">

function closeView()
{
	
	location.href="job_application.php?type=list_job_application&lp=usr";	
}

</script>


<?php
$application_id = $_REQUEST['application_id'];
$sl = 'SELECT * FROM tbl_job_application WHERE application_id = "'.$application_id.'"';
$q  = g_db_query($sl);
$rc1 = g_db_fetch_array($q);
?>


<div class="x_panel print_container">
                <div class="x_title">
                  <h2>View Job Application </h2>
                   <div class="prt_ico" style="float:right"><a href="#" onclick="javascript:window.print();"><img src="images/prnt.png" alt=""></a></div>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <form id="edit_testimonial_form" action="" method="post" name="edit_testimonial_form" class="form-horizontal form-label-left" novalidate enctype="multipart/form-data">
                  	
                       
                    
                      <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 					<img src="uploads/<?php print $rc1['candidate_image']; ?>" width="100">
                      </div>
                    </div>
                                 
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Name 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 					<?php print $rc1['candidate_name']; ?>
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Reference Number 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
 					<?php print $rc1['reff_no']; ?>
                      </div>
                    </div>
                     
                    
          
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Email
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <?php print $rc1['candidate_email']; ?>
                      	
                      
                      </div>
                    </div>
                    
                    
                   <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Phone
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <?php print $rc1['candidate_phone']; ?>
                      	
                      
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Mobile Number
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <?php print $rc1['candidate_mobile']; ?>
                      	
                      
                      </div>
                    </div>
                   
                    
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Address
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <?php print $rc1['candidate_address']; ?>
                      	
                      
                      </div>
                    </div>
                    
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >City
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <?php print $rc1['candidate_city']; ?>
                      
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Zip
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <?php print $rc1['candidate_pincode']; ?>
                      	
                      
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >State
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <?php print $rc1['candidate_state']; ?>
                      	
                      
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Job Apply For
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <?php print $rc1['candidate_job_apply_for']; ?>
                      	
                      
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Application Date
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <?php print $rc1['application_date']; ?>
                      	
                      
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >Notice Period (in days)
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <?php print $rc1['candidate_notice_period']; ?>
                      	
                      
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" > Expected CTC
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <?php print $rc1['candidate_ctc']; ?>
                      	
                      
                      </div>
                    </div>
                    
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >  Are You an Indian Citizen? 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <?php print $rc1['candidate_indian_status']; ?>
                      	
                      
                      </div>
                    </div>
                    <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >  Have You Ever Been convicted in a Court of Law? 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <?php print $rc1['candidate_convicted_status']; ?>
                      	
                      
                      </div>
                    </div>
                     <div class="item form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" >  If Selected For Employment are you willing undergo a Pre-Employment Medical Test? 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      <?php print $rc1['candidate_medical_test']; ?>
                      	
                      
                      </div>
                    </div>
                    <div class="ln_solid"></div>
                  	<h2>Education </h2>
                  	<table class="table" id="tbl"> 
								<tr>
									<th>School/Institute Name</th>
									<th>Location</th>
									<th>Years Attended</th>
									<th>Degree Received</th>
									<th>Main Subjects</th>
									
								</tr>
								<?php
									$get_education_sql="select * from tbl_job_application_education where application_id='".$application_id."'";
									$get_education_rs=mysqli_query($conn,$get_education_sql);
									while($get_education_row=mysqli_fetch_array($get_education_rs))
									{
									?>
								<tr>
									
							       <td ><?= $get_education_row['insttute'];?></td>
							        <td ><?= $get_education_row['location'];?></td>
							       <td ><?= $get_education_row['year'];?></td> 
							       <td ><?= $get_education_row['degree'];?></td> 
							       <td ><?= $get_education_row['subject'];?></td>
							       
							      	    
							    </tr>
							    <?php
									}
							       ?>
							      
							</table>
                    <div class="ln_solid"></div>
                  	<h2>References </h2>
                  	<table class="table" id="tbl1"> 
								<tr>
									<th>Name</th>
									<th>Designation</th>
									<th>Company</th>
									<th>Phone</th>
									<th></th>
								</tr>
								<?php
									$get_reference_sql="select * from tbl_job_application_reference where application_id='".$application_id."'";
									$get_reference_rs=mysqli_query($conn,$get_reference_sql);
									while($get_reference_row=mysqli_fetch_array($get_reference_rs))
									{
									?>
								<tr>
							        <td ><?= $get_reference_row['reff_name'];?></td>
							        <td ><?= $get_reference_row['reff_designation'];?></td>
							       <td ><?= $get_reference_row['reff_company'];?></td> 
							       <td ><?= $get_reference_row['reff_phone'];?></td> 
							       
							    </tr>
							     <?php
									}
							       ?>
					</table>
					 
                    <div class="ln_solid"></div>
                  	<h2>Employment History </h2>
                  	<table class="table" id="tbl"> 
								<tr>
									<th>Job Title</th>
									<th>Period of Employment (Start to End)</th>
									<th>Name of the Organization</th>
									<th>Starting CTC</th>
									<th>Ending CTC</th>
									<th>Address</th>
									<th>City</th>
									<th>State</th>
									<th>PIN Code</th>
									
									
								</tr>
								<?php
									$get_employer_sql="select * from tbl_job_application_employer where application_id='".$application_id."'";
									$get_employer_rs=mysqli_query($conn,$get_employer_sql);
									while($get_employer_row=mysqli_fetch_array($get_employer_rs))
									{
									?>
								<tr>
							       <td ><?= $get_employer_row['job_title'];?></td>
							        <td ><?= $get_employer_row['job_start'];?> - <?= $get_employer_row['job_end'];?></td>
							       <td ><?= $get_employer_row['job_organisation'];?></td> 
							       <td ><?= $get_employer_row['job_start_ctc'];?></td> 
							       <td ><?= $get_employer_row['job_end_ctc'];?></td> 
							       <td ><?= $get_employer_row['job_address'];?></td>
							       <td ><?= $get_employer_row['job_city'];?></td>
							       <td ><?= $get_employer_row['job_state'];?></td>
							       <td ><?= $get_employer_row['job_pin'];?></td>   
							    </tr>
							    <?php
									}
							       ?>
							</table>
                  
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-md-offset-3">
                      	
                  <input type="hidden" name="usr_id" value="<?php print $rc1['uid']; ?>" />
                      	
                      			
	
                      	
                      	
                      	
                      	<input type="button" name="Close" value="Close" onclick="closeView();" class="btn btn-success btn-submit">
              
                        
                      </div>
                    </div>
                  </form>

                </div>
             </div>