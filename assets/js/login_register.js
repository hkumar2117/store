$(document).ready(function () {
    function is_unique_email() {
        var email = $("#user_email").val();
        email = email.trim();
        var result = validate_email(email);
        if (result > 0) {
            var message = result == 1 ? "Please enter Email" : "Email already in use";
            display_error(message);
        }
    }

});
function display_error(message) {
    $("#user_email").addClass('error');
    $("#login_email_error").html(message);
    $("#login_email_error").show();
}
function validate_email(email) {

    if (email == "") {
        return 1;
    } else if (!regex.test(email)) {
        return 2;
    } else {
        return 0;
    }
}


function fileValidation() {
    var fileInput = document.getElementById('fileToUpload');
    var filePath = fileInput.value;
    var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif|\.pdf)$/i;
    if (!allowedExtensions.exec(filePath)) {
        alert('Please upload file having extensions .jpeg/.jpg/.png/.gif/.pdf only.');
        fileInput.value = '';
        return false;
    } else {
        //Image preview
        if (fileInput.files && fileInput.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                // get loaded data and render thumbnail.
                document.getElementById("image").src = e.target.result;
                $('#image').show();
            };
            reader.readAsDataURL(fileInput.files[0]);
            $('#uploadSubmit').show();
            $('#link_to_upload').css('display', 'none');
            $('#fileToUpload').css('display', 'none');
        }
    }
}

function doNothing() {}