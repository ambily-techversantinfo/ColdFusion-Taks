document.querySelectorAll('.form-field input[type="text"], .form-field textarea, .form-field select').forEach(field => {
    field.addEventListener('focus', function() {
        this.parentElement.style.backgroundColor = '#ffff99'; // yellow
    });
    field.addEventListener('blur', function() {
        this.parentElement.style.backgroundColor = '';
    });
});

document.querySelectorAll('.radio-group input[type="radio"], .date-input input[type="text"], .salary-input input[type="text"]').forEach(radio => {
    radio.addEventListener('focus', function() {
        this.closest('.form-field').style.backgroundColor = '#ffff99';
    });
    radio.addEventListener('blur', function() {
        this.closest('.form-field').style.backgroundColor = '';
    });
});

$(function () {
    var today = new Date();
    $('#txt2').val(today.getDate());
    $('#txt1').val(today.getMonth() + 1);
    $('#txt3').val(today.getFullYear());

    $('#hidden-datepicker').datepicker({
        dateFormat: 'mm/dd/yy',
        onSelect: function(dateText, inst) {
        const [mm, dd, yy] = dateText.split('/');
        $('#txt1').val(mm);
        $('#txt2').val(dd);
        $('#txt3').val(yy);
        $("#ui-datepicker-div").hide();
        }
    });
    
    $('#calendar-trigger').on('click', function () {
        $('#hidden-datepicker').datepicker('show');
    });
});

const inputs = document.querySelectorAll(".salary_input");

inputs.forEach(input => {
    input.addEventListener("input", function() {
        this.value = this.value.replace(/[^0-9]/g, '');
    });
});

function validateForm() 
{
    const department = document.getElementById("department").value.trim();
    const website = document.getElementById("website").value.trim();
    const fileInput = document.getElementById("resume");
    const file = fileInput.files[0];
    const firstName = document.getElementById("firstName").value.trim();
    const lastName = document.getElementById("lastName").value.trim();
    const email = document.getElementById("email").value.trim();
    const first3 = document.getElementById("first3").value.trim();
    const next3 = document.getElementById("next3").value.trim();
    const final4 = document.getElementById("final4").value.trim();
    const month = document.getElementById("txt1").value.trim();
    const date = document.getElementById("txt2").value.trim();
    const year = document.getElementById("txt3").value.trim();
    let errorList = 0;

    if (department === "") {
        $("#department").closest('.form-field').css('backgroundColor', '#FFDFDF');
        $(".errorLabel_department").css('color', '#DF0000');
        $(".err_department").show();
        errorList = 1;
    }

    if (website !== "") {
        if (!isValidUrl(website)){
            $("#website").closest('.form-field').css('backgroundColor', '#FFDFDF');
            $(".errorLabel_website").css('color', '#DF0000');
            $(".err_website").show();
            errorList = 1;
        }
    }

    if (month === "" || date === "" || year === "") {
        $("#txt1").closest('.form-field').css('backgroundColor', '#FFDFDF');
        $(".errorLabel_startDate").css('color', '#DF0000');
        $(".err_startDate").show();
        errorList = 1;
    }


    if (typeof file !== "undefined") {
        const validTypes = [
            "application/pdf",
            "application/msword",
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        ];

        if (!validTypes.includes(file.type)) {
            $("#resume").closest('.form-field').css('backgroundColor', '#FFDFDF');
            $(".errorLabel_resume").css('color', '#DF0000');
            $(".err_resume").show();
            document.getElementsByClassName("err_resume")[0].innerText = "Please reattach this file: " + file.name;
            errorList = 1;;
        }

        const ext = file.name.split('.').pop().toLowerCase();

        if (!["pdf", "doc", "docx"].includes(ext)) {
            $("#resume").closest('.form-field').css('backgroundColor', '#FFDFDF');
            $(".errorLabel_resume").css('color', '#DF0000');
            $(".err_resume").show();
            document.getElementsByClassName("err_resume")[0].innerText = "Please reattach this file: " + file.name;
            errorList = 1;
        }
    }

    if (firstName === "" || lastName === "") {
        $("#firstName").closest('.form-field').css('backgroundColor', '#FFDFDF');
        $(".errorLabel_name").css('color', '#DF0000');
        $(".err_name").show();
        errorList = 1;
    }

    let emailValidation = 0;

    if (email === "") {
        emailValidation = 1;
    } else {
        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!regex.test(email)) {
            emailValidation = 1;
        }
    }

    if (emailValidation === 1) {
        $("#email").closest('.form-field').css('backgroundColor', '#FFDFDF');
        $(".errorLabel_email").css('color', '#DF0000');
        $(".err_email").show();
        errorList = 1;
    }

    let phoneValidation = 0;

    if (first3 === "" || next3 === "" || final4 ==="") {
        phoneValidation = 1;
    } else {
        if (!/^\d{3}$/.test(first3)) {
            phoneValidation = 1;
        } else if (!/^\d{3}$/.test(next3)) {
            phoneValidation = 1;
        } else if (!/^\d{4}$/.test(final4)) {
            phoneValidation = 1;
        }
    }

    if (phoneValidation === 1) {
        $("#first3").closest('.form-field').css('backgroundColor', '#FFDFDF');
        $(".errorLabel_phone").css('color', '#DF0000');
        $(".err_phone").show();
        errorList = 1;
    }

    if (errorList == 1) {
        $("#errorLi").show();
        return false;
    }

    return true;
}

function isValidUrl(website) 
{
    try {
        new URL(website);
        return true;
    } catch (_) {
        return false;
    }
}