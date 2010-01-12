jQuery.fn.addReplyMessage = function(id) {
  replylink = $(this);
  jQuery.ajax({
    url:'/comments/'+id,
    success: function(html){
      replylink.append('<div id="reply-'+id+'" class="indent">'+html+'</div>');
      replylink.children('.links').children('a.reply-to').hide();
      replylink.children('.indent').children('.comment.reply').slideDown();
    }
  });
}
jQuery.fn.replyTo = function(id) {
  $('#comment_reply_to').val(id);
  $('#comment-form').slideDown();
  $('#comment-form #comment_body').focus();
}

$(document).ready(function(){

  $("input#user_birth").mask("9999/99/99");



  $("form.user-register").validate({
    rules: {
      'user[login]': {
        required: true,
        minlength: 3,
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
        remote: jQuery.format("Already in use")
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
        remote: jQuery.format("Already in use")
      }
    }
  });

  $("form.user-profile").validate({
    rules: {
      'user[password]': {
        minlength: 5
      },
      'user[password_confirmation]': {
        minlength: 5,
        equalTo: "#user_password"
      },
      'user[birth]': {
        date: true
      }
    },
    messages: {
      'user[password]': {
        required: "Provide a password",
        rangelength: jQuery.format("Enter at least {0} characters")
      },
      'user[password_confirmation]': {
        required: "Repeat your password",
        minlength: jQuery.format("Enter at least {0} characters"),
        equalTo: "Enter the same password as above"
      }
    }
  });

});
