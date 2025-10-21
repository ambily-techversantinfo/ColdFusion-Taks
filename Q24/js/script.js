$(document).ready(function() {
    $('#checkEmail').change(function() {
        if ($(this).is(':checked')) {
            $('#submitBtn').prop('disabled', true)
            var emailId = $("#emailId").val();

            if (!emailId || emailId.trim() === "") {
                return
            }

            $.ajax({
                url: 'dbOprations.cfc?method=checkEmail',
                method: 'POST',
                data: {email: emailId},
                dataType: 'json',
                success: function(response) {
                    if (response.exists) {
                        $(".error").text("Mail id is already there!!!");
                    } else {
                        $('#submitBtn').prop('disabled', false)
                    }
                }
            })
        }
    });
});