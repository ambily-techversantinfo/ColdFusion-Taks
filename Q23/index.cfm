<!DOCTYPE html>
<html>
<head>
    <title>Employee Application Form</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/smoothness/jquery-ui.css">
</head>
<body>
    <div class="form-container">
        <div id="logo">
		    <img src="images/wufoo-logo.png" alt="Company Logo">
		</div>

        <header id="header" class="info">
            <h2 class="">Employment Application</h2>
            <div class="">Infinity Box Inc.</div>
        </header>

        <hr class="dotted-line">

        <div id="errorLi" style="display:none;">
		    <h3 id="errorMsgLbl">There was a problem with your submission.</h3>
		    <p id="errorMsg">
				Errors have been <b>highlighted</b> below.
			</p>
	    </div>

        <form action="submitForm.cfm" enctype="multipart/form-data" method="post" class="formClass" onsubmit="return validateForm()">
            <div class="form-field half-width">
                <label for="department" class="errorLabel_department">
                    Which position are you applying for? 
                    <span id="req_17" class="req">*</span>
                </label>
                <select id="department" name="department">
                    <option value="">--Select--</option>
                    <option value="Interface Designer">Interface Designer</option>
                    <option value="Software Engineer">Software Engineer</option>
                    <option value="System Administrator">System Administrator</option>
                    <option value="Office Manager">Office Manager</option>
                </select>
                <p class="error err_department">This field is required. Please enter a value.</p>
            </div>

            <div class="form-field">
                <label for="relocate" class="errorLabel">Are you willing to relocate? 
                    <span id="req_17" class="req">*</span>
                </label>
                <div class="radio-group">
                    <label><input type="radio" name="relocate" value="yes" checked> Yes</label>
                    <label><input type="radio" name="relocate" value="no"> No</label>
                </div>
            </div>

            <div class="form-field">
                <label for="start_date" class="errorLabel_startDate">When can you start?
                        <span id="req_17" class="req">*
                </label>
                <div class="date-container">
                    <div class="date-boxes">
                        <div class="date-input">
                            <input type="text" id="txt1" name="month" maxlength="2">
                            <div class="date-label">MM</div>
                        </div>
                        <span class="date-separator">/</span>
                        <div class="date-input">
                            <input type="text" id="txt2" name="date" maxlength="2">
                            <div class="date-label">DD</div>
                        </div>
                        <span class="date-separator">/</span>
                        <div class="date-input">
                            <input type="text" id="txt3" name="year" maxlength="4">
                            <div class="date-label">YYYY</div>
                        </div>
                    </div>

                    <!-- Calendar icon -->
                    <button type="button" id="calendar-trigger" class="calendar-button" aria-label="Pick a date">
                        <img src="images/calendar.png" id="calendarIcon" alt="Select Date">
                    </button>

                    <!-- Hidden date input -->
                    <input type="text" id="hidden-datepicker" class="datepicker">
                </div>
                <p class="error err_startDate">This field is required. Please enter a value.</p>
            </div>

            <div class="form-field">
                <label for="website" class="errorLabel_website">Portfolio Web Site</label>
                <input type="text" id="website" name="website" value="https://">
                <p class="error err_website">Please enter a valid url in <b>http://website.com</b> format.</p>
            </div>

            <div class="form-field">
                <label for="resume" class="errorLabel_resume">Attach a Copy of Your Resume</label>
                <input type="file" name="resume" id="resume">
                <p class="instruct" id="instruct12">
                    <small>Word or PDF Documents Only</small>
                </p>
                <p class="error err_resume"></p>
            </div>

            <div class="form-field">
                <label for="salary">Salary Requirements</label>
                <div class="salary-container">
                    <span class="currency-symbol">$</span>
                    <div class="salary-input">
                        <input type="text" id="salaryDollars" name="salayDoller" class="salary_input" maxlength="6">
                        <div class="salary-label">Dollars</div>
                    </div>

                    <span class="dot-separator">.</span>

                    <div class="salary-input">
                        <input type="text" id="salaryCents" name="salaryCents" class="salary_input" maxlength="2">
                        <div class="salary-label">Cents</div>
                    </div>
                </div>
            </div>

            <hr class="dotted-line">

            <header id="header" class="section">
                <h3 class="">Your Contact Information</h2>
            </header>

            <div class="form-field">
                <label for="name" class="errorLabel_name">Name
                    <span id="req_17" class="req">*
                </label>
                <div class="salary-container">
                    <div class="salary-input">
                        <input type="text" id="firstName" name="firstName" maxlength="10">
                        <div class="salary-label">First</div>
                    </div>

                    <div class="salary-input">
                        <input type="text" id="lastName" name="lastName" maxlength="10">
                        <div class="salary-label">Last</div>
                    </div>
                </div>
                <p class="error err_name">This field is required. Please enter a value.</p>
            </div>
            
            <div class="form-field">
                <label for="email" class="errorLabel_email">Email Address 
                    <span id="req_17" class="req">*
                </label>
                <input type="text" id="email" name="email">
                <p class="error err_email">Please enter a valid email address.</p>
            </div>

            <div class="form-field">
                <label for="phone" class="errorLabel_phone">Phone
                    <span id="req_17" class="req">*
                </label>
                <div class="salary-container">
                    <div class="salary-input">
                        <input type="text" id="first3" name="first3" maxlength="3">
                        <div class="salary-label">###</div>
                    </div>

                    <span class="dot-separator">-</span>

                    <div class="salary-input">
                        <input type="text" id="next3" name="next3" maxlength="3">
                        <div class="salary-label">###</div>
                    </div>

                    <span class="dot-separator">-</span>

                    <div class="salary-input">
                        <input type="text" id="final4" name="final4" maxlength="4">
                        <div class="salary-label">####</div>
                    </div>
                </div>
                <p class="error err_phone">Please enter a valid phone number.</p>
            </div>

            <input type="submit" value="Submit" name="submit">
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
