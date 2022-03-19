<?php
include("include/apps_top.php");?>
<h5>Employer (<?php echo $_REQUEST['q'];?>)</h5>
<div class="row">
<div class="col-md-4 col-sm-4 colm">
<div class="appfld">
<label>Job Title</label>
<input type="text" name="job_title[]" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/>
</div>
</div>
<div class="col-md-8 col-sm-8 colm">
<div class="appfld">
<label>Period of Employment (Start to End)</label>
<div class="row">
<div class="col-sm-6 colm">
<input type="date" placeholder="dd/mm/yyyy" class="clsdate" name="job_start[]" max="<?= date('Y-m-d'); ?>"/>
</div>
<div class="col-sm-6 colm">
<input type="date" placeholder="dd/mm/yyyy" class="clsdate" name="job_end[]" max="<?= date('Y-m-d'); ?>"/>
</div>
</div>
</div>
</div>
<div class="col-md-4 col-sm-4 colm">
<div class="appfld">
<label>Name of the Organization</label>
<input type="text" name="job_organisation[]" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/>
</div>
</div>
<div class="col-md-4 col-sm-4 colm">
<div class="appfld">
<label>Starting CTC</label>
<input type="tel" name="job_start_ctc[]"/>
</div>
</div>
<div class="col-md-4 col-sm-4 colm">
<div class="appfld">
<label>Ending CTC</label>
<input type="tel" name="job_end_ctc[]"/>
</div>
</div>
<div class="col-md-12 colm">
<div class="appfld">
<label>Address</label>
<textarea name="job_address[]"></textarea>
</div>
</div>
<div class="col-md-4 col-sm-6 colm">
<div class="appfld">
<label>State</label>
<!-- <input type="text" name="job_state[]" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/> -->
<select name="job_state[]"  onchange="change_state2(this.value,<?php echo $_REQUEST['q'];?>)">
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
<!-- <input type="text" name="job_city[]" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/> -->
<select name="job_city[]" id="job_city<?php echo $_REQUEST['q'];?>"  >
<option value="">Select City</option>

</select>
</div>
</div>

<div class="col-md-4 col-sm-6 colm">
<div class="appfld">
<label>PIN Code</label>
<input type="text" name="job_pin[]" pattern="^[0-9]{6}$" title="Enter 6 digit Valid Pin Code"/>
</div>
</div>

</div>