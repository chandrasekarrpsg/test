<?php
include("include/apps_top.php");?>
<tr>
<td data-title="School/Institute Name"><input type="text"  name="insttute[]" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/></td>
<td data-title="Location"><input type="text"  name="location[]"/></td> 
<td data-title="Years Attended"><input type="text" name="year[]" pattern="[0-9 -]+" title="Number, Dash and space allow only"/></td>  
<td data-title="Degree Received"><input type="text" name="degree[]" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/></td>  
<td data-title="Main Subjects"><input type="text" name="subject[]" pattern="[a-zA-Z ]+" title="Alphabet and space allow only"/></td> 
<td>&nbsp;</td>          
</tr>