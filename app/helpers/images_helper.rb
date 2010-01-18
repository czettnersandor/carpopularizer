module ImagesHelper
  def session_information
    session_key = ActionController::Base.session_options[:key]
    return "?#{session_key}=#{cookies[session_key]}"
  end

end
