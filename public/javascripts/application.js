$(document).ready(function(){

  $("form.user-register").validate({
    rules: {
      'user[login]': {
        required: true,
        minlength: 2,
        remote: "/users/check_username"
      },
      'user[password]': {
        required: true,
        minlength: 5
      },
      'user[password_confirmation]': {
        required: true,
        minlength: 5,
        equalTo: "#user_password"
      },
      'user[email]': {
        required: true,
        email: true,
        remote: "users/check_email"
      }
    },
    messages: {
      'user[login]': {
        required: "Enter a username",
        minlength: jQuery.format("Enter at least {0} characters"),
        remote: jQuery.format("{0} is already in use")
      },
      'user[password]': {
        required: "Provide a password",
        rangelength: jQuery.format("Enter at least {0} characters")
      },
      'user[password_confirmation]': {
        required: "Repeat your password",
        minlength: jQuery.format("Enter at least {0} characters"),
        equalTo: "Enter the same password as above"
      },
      'user[email]': {
        required: "Please enter a valid email address",
        minlength: "Please enter a valid email address",
        remote: jQuery.format("{0} is already in use")
      }
    }
  });

});
