class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += _('Please activate your new account')
    @body[:url]  = "http://boxutca.com/activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += _('Your account has been activated!')
    @body[:url]  = "http://boxutca.com/"
  end

  def forgot_password(user)
    setup_email(user)
    @subject    += _('You have requested to change your password')
    @body[:url]  = "http://boxutca.com/reset_password/#{user.password_reset_code}"
  end

  def reset_password(user)
    setup_email(user)
    @subject    += _('Your password has been reset.')
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = 'admin@' + domain.split(":").first
      @subject     = "[BOXUTCA] "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
