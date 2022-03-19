<?php include "include/header.php"; ?>


<?php
$get_page_sql="select * from tbl_pagecontent where id=9";
$get_page_rs=mysqli_query($conn,$get_page_sql);
$get_page_row=mysqli_fetch_array($get_page_rs);

?>
<div class="bannersec innerbanner">
	<div class="banitm" style="background: url(<?= SITE_URL; ?>admin/post_img/<?= $get_page_row['banner_image'];?>)">
		<div class="bantxt">
			<div class="container">
				<div class="txtb wow fadeInUp">
<?= $get_page_row['banner_heading'];?>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="carrerpagess">
	<div class="container">
		<div class="carrerpBox">
			<h1>Application for Employment</h1>
			<div class="applicForm">
				<form method="post" id="frmapplication" enctype="multipart/form-data" onsubmit="return submitform();">
					<div class="appFroRow">
						<h4>Personal Information</h4>
						<div class="row">
							<div class="col-md-6 col-sm-6 colm">
								<div class="appfld">
									<label>Name*</label>
									<input type="text" name="candidate_name" required="required" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/>
								</div>
							</div>
							<div class="col-md-6 colm">
								<div class="appfld">
									<label>Upload photo*</label>
									<input type="file" id="candidate_image" class="inputfile" required="required" name="candidate_image" accept="image/*"/>
									<label for="candidate_image"><strong>Browse...</strong><span id="filenamesec"></span></label>
									<span id="candidate_image_msg"></span>
								</div>
							</div>
							<div class="col-md-12 colm">
								<div class="appfld">
									<label>Address*</label>
									<textarea  name="candidate_address" required="required"></textarea>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 colm">
								<div class="appfld">
									<label>State*</label>
									<!-- <input type="text" name="candidate_state" required="required" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/> -->
									<select name="candidate_state" required="required" onchange="change_state(this.value)">
										<option value="">Select State</option>
										<?php
										$get_state_sql="select distinct name from tbl_states where country_id=101 order by name asc";
										$get_state_rs=mysqli_query($conn,$get_state_sql);
										while($get_state_row=mysqli_fetch_array($get_state_rs))
										{
										?>
										<option value="<?= $get_state_row['name'];?>"><?= $get_state_row['name'];?></option>
										<?php 
										}
										?>
									</select>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 colm">
								<div class="appfld">
									<label>City*</label>
									<!-- <input type="text"  name="candidate_city" required="required" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/> -->
									<select name="candidate_city" id="candidate_city" required="required" >
										<option value="">Select City</option>
										
									</select>
									
								</div>
							</div>
							
							<div class="col-md-4 col-sm-6 colm">
								<div class="appfld">
									<label>PIN Code*</label>
									<input type="text" name="candidate_pincode" required="required" pattern="^[0-9]{6}$" title="Enter 6 digit Valid Pin Code"/>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 colm">
								<div class="appfld">
									<label>Phone Number</label>
									<input type="tel" name="candidate_phone" pattern="[0-9 -]+" title="Number, dash and space allow only"/>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 colm">
								<div class="appfld">
									<label>Mobile Number*</label>
									<input type="tel" name="candidate_mobile" required="required" pattern="[0-9]{10}" title="Enter 10 digit mobile number"/>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 colm">
								<div class="appfld">
									<label>Email Address &amp; Linked in Profile*</label>
									<input type="email" name="candidate_email" required="required" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Enter Valid email"/>
								</div>
							</div>
							<div class="col-md-6 col-sm-6 colm">
								<div class="appfld">
									<label>Are You an Indian Citizen?*</label>
									<ul>
										<li>
											<input type="radio" id="yes1" name="candidate_indian_status" value="Yes" checked="checked">
   											<label for="yes1">Yes</label>
										</li>
										<li>
											<input type="radio" id="no1" name="candidate_indian_status"  value="No">
   											<label for="no1">No</label>
										</li>
									</ul>
								</div>
							</div>
							<div class="col-md-6 col-sm-6 colm">
								<div class="appfld">
									<label>Have You Ever Been convicted in a Court of Law?*</label>
									<ul>
										<li>
											<input type="radio" id="yes2" name="candidate_convicted_status"  value="Yes">
   											<label for="yes2">Yes</label>
										</li>
										<li>
											<input type="radio" id="no2" name="candidate_convicted_status" value="No" checked="checked">
   											<label for="no2">No</label>
										</li>
									</ul>
								</div>
							</div>
							<div class="col-md-12 col-sm-12 colm">
								<div class="appfld">
									<label>If Selected For Employment are you willing undergo a Pre-Employment Medical Test?*</label>
									<ul>
										<li>
											<input type="radio" id="yes3" name="candidate_medical_test" value="Yes" checked="checked">
   											<label for="yes3">Yes</label>
										</li>
										<li>
											<input type="radio" id="no3" name="candidate_medical_test" value="No" >
   											<label for="no3">No</label>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="appFroRow">
						<h4>Position</h4>
						<div class="row">
							<div class="col-md-4 col-sm-6 colm">
								<div class="appfld">
									<label>Position You Are Applying For*</label>
									<select name="candidate_job_apply_for" required="required">
										<option value="">Select Job</option>
										<?php
										$get_job_sql="select * from  tbl_job where job_status=1 order by job_title asc";
										$get_job_rs=mysqli_query($conn,$get_job_sql);
										while($get_job_row=mysqli_fetch_array($get_job_rs))
										{
										?>
										<option value="<?= $get_job_row['job_title'];?>"><?= $get_job_row['job_title'];?></option>
										<?php
										}
										?>
										
									</select>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 colm">
								<div class="appfld">
									<label>Notice Period (in days)*</label>
									<input type="text" name="candidate_notice_period" required="required" pattern="[0-9]+" title="Only Number allowed"/>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 colm">
								<div class="appfld">
									<label>Expected CTC*</label>
									<input type="text" name="candidate_ctc" required="required"/>
								</div>
							</div>
						</div>
					</div>
					<div class="appFroRow">
						<h4>Education ( Start from Highest Qualification )</h4>
						<div class="table-responsive">
							<table class="table" id="tbl"> 
								<tr>
									<th>School/Institute Name*</th>
									<th>Location*</th>
									<th>Years Attended*</th>
									<th>Degree Received*</th>
									<th>Main Subjects*</th>
									<th></th>
								</tr>
								<tr>
							        <td data-title="School/Institute Name">
							        	<input type="text"  name="insttute[]" required="required" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/>
							        </td>
							        <td data-title="Location"><input type="text"  name="location[]" required="required"/></td> 
							        <td data-title="Years Attended"><input type="text" name="year[]" required="required" pattern="[0-9 -]+" title="Number, Dash and space allow only"/></td>  
							        <td data-title="Degree Received"><input type="text" name="degree[]" required="required" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/></td>  
							        <td data-title="Main Subjects"><input type="text" name="subject[]" required="required" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/></td> 
							        <td><input type="button" class="addmor" value="Add More" onclick="addField();" /></td>          
							    </tr>
							</table>
						</div>
					</div>
					<div class="appFroRow">
						<h4>References</h4>
						<div class="table-responsive">
							<table class="table" id="tbl1"> 
								<tr>
									<th>Name</th>
									<th>Designation</th>
									<th>Company</th>
									<th>Phone</th>
									<th></th>
								</tr>
								<tr>
							        <td data-title="Name"><input type="text"  name="reff_name[]" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/></td>
							        <td data-title="Designation"><input type="text" name="reff_designation[]" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/></td> 
							        <td data-title="Company"><input type="text" name="reff_company[]" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/></td>  
							        <td data-title="Phone"><input type="text"  name="reff_phone[]" pattern="[0-9 -]+" title="Number, dash and space allow only"/></td>  
							        <td><input type="button" class="addmor" value="Add More" onclick="addField1();" /></td>          
							    </tr>
							</table>
						</div>
					</div>
					<div class="appFroRow">
						<h4>Employment History ( Add more rows if applicable )</h4>
						<div class="moreRows">
							<div id="divsl1" class="employrow">
							<div class="admrdiv">
							<h5>Employer (1)</h5> 
							<a href="#url" class="addmor" onclick="adddives1(this);">Add More</a>
							<input type="hidden" id="emprowcount" value="1">
							</div>
							<div class="row">
								<div class="col-md-4 col-sm-4 colm">
									<div class="appfld">
										<label>Job Title</label>
										<input type="text" name="job_title[]"  pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/>
									</div>
								</div>
								<div class="col-md-8 col-sm-8 colm">
									<div class="appfld">
										<label>Period of Employment (Start to End)</label>
										<div class="row">
											<div class="col-sm-6 colm">
												<input type="date" placeholder="dd/mm/yyyy" class="clsdate" name="job_start[]" max="<?= date('Y-m-d'); ?>" />
											</div>
											<div class="col-sm-6 colm">
												<input type="date" placeholder="dd/mm/yyyy" class="clsdate" name="job_end[]"  max="<?= date('Y-m-d'); ?>"/>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 col-sm-4 colm">
									<div class="appfld">
										<label>Name of the Organization</label>
										<input type="text" name="job_organisation[]"  pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/>
									</div>
								</div>
								<div class="col-md-4 col-sm-4 colm">
									<div class="appfld">
										<label>Starting CTC</label>
										<input type="tel" name="job_start_ctc[]" />
									</div>
								</div>
								<div class="col-md-4 col-sm-4 colm">
									<div class="appfld">
										<label>Ending CTC</label>
										<input type="tel" name="job_end_ctc[]" />
									</div>
								</div>
								<div class="col-md-12 colm">
									<div class="appfld">
										<label>Address</label>
										<textarea name="job_address[]" ></textarea>
									</div>
								</div>
								<div class="col-md-4 col-sm-6 colm">
									<div class="appfld">
										<label>State</label>
										<!-- <input type="text" name="job_state[]" required="required" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/> -->
										<select name="job_state[]"  onchange="change_state2(this.value,1)">
										<option value="">Select State</option>
										<?php
										$get_state_sql="select distinct name from tbl_states where country_id=101 order by name asc";
										$get_state_rs=mysqli_query($conn,$get_state_sql);
										while($get_state_row=mysqli_fetch_array($get_state_rs))
										{
										?>
										<option value="<?= $get_state_row['name'];?>"><?= $get_state_row['name'];?></option>
										<?php 
										}
										?>
									</select>
									</div>
								</div>
								<div class="col-md-4 col-sm-6 colm">
									<div class="appfld">
										<label>City</label>
										<!-- <input type="text" name="job_city[]" required="required" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/> -->
										<select name="job_city[]" id="job_city1" >
										<option value="">Select City</option>
										
									</select>
									</div>
								</div>
								
								<div class="col-md-4 col-sm-6 colm">
									<div class="appfld">
										<label>PIN Code</label>
										<input type="text" name="job_pin[]"  pattern="^[0-9]{6}$" title="Enter 6 digit Valid Pin Code"/>
									</div>
								</div>
								
							</div>
							</div>
						</div>
					</div>
					<div class="appFroRow">
						<h4>Signature Disclaimer</h4>
						<div class="row">
							<div class="col-md-12 col-sm-12 colm">
								<div class="appfld">
									<input type="checkbox" id="candidate_signature" name="candidate_signature" value="0" >
   									<label for="candidate_signature">I certify that my answers are true and complete to the best of my knowledge.
If this application leads to employment, I understand that false or misleading information in my application or interview
may result in my release.</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 col-sm-12 colm">
							<div class="appfld">
								<input type="hidden" name="action" value="application_submit">
								<input type="submit" name="form_submit" value="Submit"/>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	function image_validation()
	{
		 //Get reference of FileUpload.
        var fileUpload = $("#candidate_image")[0];
       	
        //Initiate the FileReader object.
        var reader = new FileReader();
        //Read the contents of Image File.
        reader.readAsDataURL(fileUpload.files[0]);
        reader.onload = function (e) 
        {
            //Initiate the JavaScript Image object.
	        var image = new Image();
	        //Set the Base64 string return from FileReader as source.
	        image.src = e.target.result;
	        image.onload = function () {
	            //Determine the Height and Width.
	        var height = this.height;
	        var width = this.width;
           
                   
            if(fileUpload.files[0].size > 600000)
	   		{
		       $("#candidate_image_msg").html("Maximum file size 600 kb");
		       
		       	 $("#filenamesec").html(""); 
		       $("#candidate_image").val('');
		      	return false;
		    }
            else if (height > 1200 || width > 1200) {
            	$("#candidate_image_msg").html("Height and Width must not exceed 1200px.");
              
                $("#filenamesec").html(""); 
               	 $("#candidate_image").val('');
               	  	return false;
              
               	
            }
            else
            {
            	 $("#candidate_image_msg").html("One file added successfully.");
            	return true;
            }
            
           
          
       		 };
    	}
           
        
        setTimeout(function() { $("#candidate_image_msg").html(''); }, 5000);
	}
</script>


<!-- <script>
	$("#candidate_image").on("change", function(e){
   	if($("#candidate_image").val() !== "")
   	{
   		alert( this.files[0].size);
   		if(this.files[0].size > 600000)
   		{
	       $("#candidate_image_msg").html("Maximum file size 600 kb");
	       this.value = "";
	    }
	    else
	    {
	    	$("#candidate_image_msg").html("One file added successfully.");
	    	setTimeout(function() { $("#candidate_image_msg").html(''); }, 5000);
	    }
   	
   	
   
       
    }
})
</script> -->
 <script type="text/javascript">

   	$("#candidate_image").on("change", function(e){
       image_validation();
    });

</script>

<script>
		function submitform()
		{
			
			if (document.getElementById('candidate_signature').checked === false)
			{
				alert("Please agree with Signature Disclaimer");
				return false;
			}
			else
			{	
				event.preventDefault();	
				var formData = new FormData($("#frmapplication")[0]);
					$.ajax({
			        url: "<?= SITE_URL;?>ajax_application_submit.php",
			        type: 'POST',
			        data: formData,
			        success: function (data) {
			        //alert(data);
			        if(data.trim()==1)
			        {
			        	 location.href="<?= SITE_URL;?>thankyou-application.php";	
			        }
			        else
			        {
			        	alert(data);
			        }	
			       
			        },
			        cache: false,
			        contentType: false,
			        processData: false
			    });
		   }
		  
			
		}
</script>

<script>
function addField()
{
   
    $.ajax({
    url: "<?= SITE_URL;?>ajax_add_more_education.php",
    type: 'POST',
    data: q=1,
    success: function (data) {
    $("#tbl").append(data);
    },
    cache: false,
    contentType: false,
    processData: false
	});
    
}
function addField1()
{
    $.ajax({
    url: "<?= SITE_URL;?>ajax_add_more_reference.php",
    type: 'POST',
    data: q=1,
    success: function (data) {
    $("#tbl1").append(data);
    },
    cache: false,
    contentType: false,
    processData: false
	});
}
function adddives1(n)
{
	emprowcount=$("#emprowcount").val();
	emprowcount++;
	$("#emprowcount").val(emprowcount);
    $.ajax({
    url: "<?= SITE_URL;?>ajax_add_more_employer.php",
    type: 'POST',
    data: "q="+emprowcount,
    success: function (data) {
    $("#divsl1").append(data);
    },
    
	});
}

</script>



<script>
	function change_state(v)
{
   
    $.ajax({
    url: "<?= SITE_URL;?>ajax_change_state.php",
    type: 'GET',
    data: "q="+v,
    success: function (data) {
    $("#candidate_city").html(data);
    },
    cache: false,
    contentType: false,
    processData: false
	});
    
}
function change_state2(v,ctr)
{
   
    $.ajax({
    url: "<?= SITE_URL;?>ajax_change_state.php",
    type: 'GET',
    data: "q="+v,
    success: function (data) {
    $("#job_city"+ctr).html(data);
    },
    cache: false,
    contentType: false,
    processData: false
	});
    
}
</script>
<?php include "include/footer-inner.php"; ?>