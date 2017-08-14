<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
		.u157_input {

			left: 0px;
			top: 0px;
			width: 100px;
			height: 22px;
			font-family: 'Arial Regular', 'Arial';
			font-weight: 400;
			font-style: normal;
			font-size: 13px;
			text-decoration: none;
			color: #000000;
		}
		select, select[size="0"], select[size="1"] {
			border-radius: 0px;
			border-color: rgb(169, 169, 169);
		}
		.u135_input {
			position: absolute;
			left: 0px;
			top: 0px;
			width: 72px;
			height: 25px;
			font-family: 'Arial Regular', 'Arial';
			font-weight: 400;
			font-style: normal;
			font-size: 13px;
			text-decoration: none;
			color: #000000;
			text-align: left;
		}
		
	</style>
</head>
<body style="margin-top: 15px;">
	<div class="col-md-12">
		<span class="col-md-1" ><a href="" style="text-decoration: none;">Home</a></span>
		<div class="col-md-4 btn btn-default">
			<h4 style="color: black;">Khulna Development Authority&nbsp; ( KDA )</h4>
		</div>
	</div>



	<div class="col-md-offset-1 col-md-6" style="margin-top: 20px;">
		
		<table class="table" border="1px;">
			<thead style="background-color: #999999;">
				<th>Department Name</th>
				<th>Designation</th>
				<th>Employee Name</th>
				<th>Fisal Year</th>
				<th>Month</th>
			</thead>			
			<tbody>
				<td>
					<select class="u157_input" id="department_name">
						<option>select</option>
						<?php 

						if(!empty($department)) 
						
						{
						 
							foreach($department as $key=>$row)
							{
								echo "<option value='$key'>$row</option>";
							}

						}

						?>
					</select>
				</td>
				<td>
					<select class="u157_input" id="designation">
						<option>select</option>
						<?php 

						if(!empty($designation)) 
						
						{
						 
							foreach($designation as $key=>$row)
							{
								echo "<option value='$key'>$row</option>";
							}

						}

						?>
					</select>
				</td>
				<td>
					<select class="u157_input" id="name">
						<option>select</option> <!-- ajax generate remain option -->
					</select>
				</td>
				<td>
					<select class="u157_input" id="fiscal_year">
						<option>select</option>
						<?php 

						if(!empty($fiscalyear)) 
						
						{
						 
							foreach($fiscalyear as $key=>$row)
							{
								echo "<option value='$key'>$row</option>";
							}

						}

						?>
					</select>
				</td>
				<td>
					<select class="u157_input" id="month">
						<option>select</option> <!-- ajax generate remain option -->
					</select>
				</td>
			</tbody>
		</table>
		
		<!-- js code for onclick -->

		<script type="text/javascript">
		    var base_url = "<?php echo BASE_URL; ?>";
			$(document).ready(function(){
				$('#designation').change(function(){
					var department_name = $("#department_name option:selected").val();
					var designation = $("#designation option:selected").val();
					var employee = $("#employee option:selected").val();

					 	$.ajax({
					 		url: base_url+"MonthlyAttendanceEntries/get_call",
					 		method:"POST",
					 		data:{department_name : department_name,designation : designation,employee : employee},
					 		dataType:"text",
					 		success:function(data){
					 			$('#name').html(data);
					 		}
					 	});

				});

				//***************************************
				//fiscal year ajax code start here
				//***************************************

				$('#fiscal_year').change(function(){
					var fiscal_year = $("#fiscal_year option:selected").val();
					 	$.ajax({
					 		url: base_url+"MonthlyAttendanceEntries/get_months",
					 		method:"POST",
					 		data:{fiscal_year : fiscal_year},
					 		dataType:"text",
					 		success:function(data){
					 			$('#month').html(data);
					 		}
					 	});

				});

				//**********************************************
				//moth ajax code start here 
				//**********************************************

				$('#month').change(function(){
					var month = $("#month option:selected").val();
					$('#month_id').val(month); //for set it to hiddden input 
					 	$.ajax({
					 		url: base_url+"MonthlyAttendanceEntries/attendance_entry_autoComplete",
					 		method:"POST",
					 		data:{month : month},
					 		dataType:"text",
					 		success:function(data){
					 			$('#official_attendence').val(data);
					 			//$('#c').html(data);
					 		}
					 	});

				});

				//*******************************************
				//Auto complete Name field 
				//*******************************************
				$('#name').change(function(){
					var name_id = $("#name option:selected").val();
					var name = $("#name option:selected").html();
					$('#emName').html(name);
					$('#employee_id').val(name_id);

				});



			}); 

		</script>
		<!-- End js code for onclick -->
		<!-- <p id="c"></p> -->
	</div>

	<div class="col-md-offset-1 col-md-10" style="margin-top: 20px;">
	<p class="">Attendance Entry</p>
		<form method="post" action="<?php echo BASE_URL."MonthlyAttendanceEntries/form_data"; ?>">
			<table class="table" border="1px;">
				<thead style="background-color: #999999;">
					<!-- <th><input type="checkbox" name="" ></th> -->
					<th>Employee Name</th>
					<th>Official Attendance</th>
					<th>Casual Leave</th>
					<th>Sick Leave</th>
					<th>Earned Leave</th>
					<th>Maternity leave</th>
					<th>Total Attandance</th>
					<th>Panalty</th>
				</thead>
				<tbody>
					<!-- <td><input type="checkbox" name="" ></td> -->
					<td id="emName">
					
					</td>
					<td><input type="number" name="official_attendence" style="width: 82px;" id="official_attendence"  value=""></td>
					<td><input type="number" name="casual_leave" style="width: 82px;"></td>
					<td><input type="number" name="sick_leave" style="width: 82px;"></td>
					<td><input type="number" name="earned_leave" style="width: 82px;"></td>
					<td><input type="number" name="maternity_leave" style="width: 82px;"></td>
					<td><input type="number" name="total_attendance" style="width: 82px;"></td>
					<td><input type="number" name="panalty" style="width: 82px;"> TK.</td>

				</tbody>
			</table>
			<input type="hidden" name="employee_id" id="employee_id">
			<input type="hidden" name="month_id" id="month_id">
			<input type="hidden" name="datetime" value="<?php echo date("Y-m-d"); ?>">
			<input type="submit" name="btn" value="Save" class="col-md-offset-1 btn btn-default" style="width: 90px;">
		</form>
	</div>

	<!-- loading js -->
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>