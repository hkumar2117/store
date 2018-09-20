$(document).ready(function() {
   function is_unique_email() {
      var email = $("#user_email").val();
      email = email.trim();
      var result = validate_email(email);
      if(result > 0) {  
            var message = result == 1 ? "Please enter Email" : "Email already in use"; 
            display_error(message);
      }
   }

});
function display_error(message){
     $("#user_email").addClass('error');
     $("#login_email_error").html(message);
     $("#login_email_error").show();
}
function validate_email(email){
     
     if(email == "") {
           return 1;
     } else if(!regex.test(email)){
           return 2;
     } else {
           return 0;
     }
}