var searchbarState = 0;
var RecaptchaOptions = {
  theme : 'clean',
  lang : 'hu',
  custom_translations : {
    instructions_visual : "A fent látható két szó:",
    refresh_btn : "Frissítés",
    help_btn : "Segítség",
    incorrect_try_again : "Hibás. Próbáld újra."
  }
};

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

  $('select#searchwhat').selectbox();

  $('#menubar li').hover(
    function(){
      $(this).stop();
      $(this).animate(
      {
        "marginTop": "0",
        height: "47px"
      }, 500)
    },
    function(){
      $(this).stop();
      $(this).height(39);
      $(this).css({
        "margin-top": "8px"
      });
    }
    );

  $(document.body).click(function(event) {
    var $target = $(event.target);
    if ($target.parents("#searchbar").length){
      if (searchbarState == 0) {
        $("#searchbar").stop();
        $("#searchbar").animate({
          height: "70",
          'marginTop': "50"
        }, 500, "swing",
        function(){
          searchbarState = 1;
          $("#searchbar .form-item.submit").fadeIn();
        } );
      }
    }
    else {
      if (searchbarState == 1) {
        $("#searchbar").stop();
        $("#searchbar").animate({
          height: "46",
          "marginTop": "74"
        }, 500, "swing",
        function(){
          searchbarState = 0;
          $("#searchbar .form-item.submit").hide();
        } );
      }
    }
  });



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
