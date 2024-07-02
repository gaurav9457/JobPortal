	<div id="registerPopUp">
			<div id="Formcontainer">
				<div id="formDiv1">
				
					<form action="CommonController" id="formObj" method="post">
					    <input type="hidden" value="registerUser" name="action"/>
						<span id="closeRegister" onclick="validate.closeRegisterPopup()">&times;</span>
						<!-- <div id="nameDiv" class=""> -->
						<label for="fname" class="lableColor">First Name <span class="starColor">*</span>: </label> <br>

						<input type="text" id="fname" name="firstname" placeholder="Your First name.."
							class="inpformat inpValid" onkeydown="validate.inputErrorDisplay(this)" autofocus>
						<div id="firstnameError" class="errorDiv">&nbsp;</div>
						<!-- <br> -->
						<!-- </div> -->

						<!-- <div id="lnameDiv" class=""> -->
						<label for="lname" class="lableColor">Last Name <span class="starColor">*</span> : </label> <br>

						<input type="text" id="lname" name="lastname" placeholder="Your last name.."
							class="inpformat inpValid" onkeydown="validate.inputErrorDisplay(this)">
						<div id="lastnameError" class="errorDiv">&nbsp;</div>
						<!-- </div> -->


						<!-- <label for="gender" class="lableColor">Gender <span class="starColor">*</span>: </label>
						<label class="lableColor"><input type="radio" name="gender" id="gender"
								value="male">Male</label>
						<label class="lableColor"><input type="radio" name="gender" id="gender"
								value="female">Female</label>
						<label class="lableColor"><input type="radio" name="gender" id="gender"
								value="Other">Other</label>
						<div id="errorSpan"></div> -->
						<br>
						<!-- <div id="dobDiv" class="">
							<label for="dob" class="lableColor">Date Of Birth <span class="starColor">*</span>: </label>
							<br>

							<input type="text" id="dob" name="dob" placeholder="DD/MM/YYYY"
							oninput="validate.inputErrorDisplay(this)" class="inpformat">
							<div id="dobError" class="errorDiv">&nbsp;</div>
						</div>

						<div id="ageDiv" class="">
							<label for="age" class="lableColor">Age <span class="starColor">*</span>: </label> <br>

							<input type="text" name="age" id="age" class="inpformat" onchange="validate.inputErrorDisplay(this)" readonly="readonly" placeholder="00">
							<div id="ageError" class="errorDiv">&nbsp;</div>
						</div> -->

						<label for="mobile" class="lableColor">Mobile no <span class="starColor">*</span>: </label> <br>

						<input type="tel" name="mobileNo" id="mobile" minlength=1 maxlength=10 class="inpformat" onkeypress="validate.inputErrorDisplay(this)" placeholder="9112345678">
						<div id="mobileError" class="errorDiv">&nbsp;</div>

						<label for="email" class="lableColor">Email-id <span class="starColor">*</span>: </label> <br>
						<input type="email" name="email" id="email" class="inpformat" onkeydown="validate.inputErrorDisplay(this)" placeholder="example@gmail.com"/>
						<div id="emailError" class="errorDiv">&nbsp;</div>

						<label for="password" class="lableColor">Password <span class="starColor">*</span>: </label> <br>
						<input type="text" name="password" id="password" class="inpformat" oninput="validate.inputErrorDisplay(this)" placeholder="Pass@123"/>
						<div id="passwordError" class="errorDiv">&nbsp;</div>

						<label for="confirmPassword" class="lableColor">Confirm Password <span class="starColor">*</span>: </label> <br>
						<input type="password" name="confirmPassword" id="confirmPassword" class="inpformat" oninput="validate.inputErrorDisplay(this)"  placeholder="Pass@123"/>
						<div id="confirmPasswordError" class="errorDiv">&nbsp;</div>

						

						<label for="address" class="lableColor">Skills <span class="starColor">*</span>: </label><br>
						<input type="text"name="Skills" class="inpformat" id="addressArea" cols="53" rows=""
							style="margin:10px;width:400px;" oninput="validate.inputErrorDisplay(this)">
						<div id="addressAreaError" class="errorDiv"></div>

						<label for="state" class="lableColor">State <span class="starColor">*</span>: </label>
						<select name="state" id="state" onclick="validate.state()">
						
							 <!--  <option value="" >Select state</option>
							<option value="Maharashtra">Maharashtra</option>
							<option value="Gujrat">Gujrat</option>
							<option value="Rajastan">Rajastan</option>  -->
							<!-- <option value="Jalgaon">Jalgaon</option>
							<option value="Surat">Surat</option>
							<option value="Nagpur">Nagpur</option> -->

						</select>

						<div id="cityDiv" class="">
							<label for="city" class="lableColor">City <span class="starColor">*</span>: </label>
							<br>
							<select name="city" id="city"  >
								 <!--  <option value="">Select city</option>
								<option value="Pune">Pune</option>
								<option value="Mumbai">Mumbai</option>
								<option value="Nashik">Nashik</option>
								<option value="Jalgaon">Jalgaon</option>
								<option value="Surat">Surat</option>
								<option value="Nagpur">Nagpur</option>  -->

							</select>

						</div>
						
							<br>
							
						<label for="pincode" class="lableColor">Education <span class="starColor">*</span>: </label> <br>
						<input type="text" name="Education" id="Education" class="inpformat" placeholder=""/>
						<div id="pincodeError" class="errorDiv">&nbsp;</div>


						<br>
						
						<div id="btn-div" class="">
						<input type="submit" class="btn" id="submitRegister" value="Register">
						<!-- <button onclick="" class="btn" id="resetBtn">Reset</button> -->
										</div>
					</form>
					</div>
					<div class="alert" id="alertBox">
							<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
							<strong id="msg"></strong>
							<div id="progressBar" class="">
				
							</div>
						</div>
					</div>
					</div>
					
					<div class="jsP" id="jspalertBox">
							<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
							<strong id="msg">Login Success Redirecting...</strong>
							<div id="progressBar" class="jspprogressBar">
				              
							</div>
							
						</div>
						