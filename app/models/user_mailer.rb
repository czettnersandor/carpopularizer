class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += _('Please activate your new account')
    @body[:url]  = "http://#{@hostname}/activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += _('Your account has been activated!')
    @body[:url]  = "http://#{@hostname}/"
  end

  def forgot_password(user)
    setup_email(user)
    @subject    += _('You have requested to change your password')
    @body[:url]  = "http://#{@hostname}/reset_password/#{user.password_reset_code}"
  end

  def reset_password(user)
    setup_email(user)
    @subject    += _('Your password has been reset.')
  end

  def friend_request(user, request_by)
    setup_email(user)
    @subject    += _("#{request_by.login} has requested to be your friend")
  end
  
  protected
    def setup_email(user)
      @hostname = self.request.host
      @recipients  = "#{user.email}"
      @from        = "admin@#{@hostname}"
      @subject     = "[BOXUTCA] "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
