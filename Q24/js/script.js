$(document).ready(function() {
    $('#checkEmail').change(function() {
        if ($(this).is(':checked')) {
            $('#submitBtn').prop('disabled', true)
            var emailId = $("#emailId").val();

            if (!emailId || emailId.trim() === "") {
                return
            }

            $.ajax({
                url: 'dbOprations.cfc?method=checkEmail&returnFormat=json',
                method: 'POST',
                data: {email: emailId},
                dataType: 'json',
                success: function(response) {
                    if (response.emailExists === true || response.EMAILEXISTS === true) {
                        $(".error").text("Mail id is already there!!!");
                    } else {
                        $('#submitBtn').prop('disabled', false)
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error:', status, error);
                    console.log(xhr.responseText);
                }
            })
        }
    });
});