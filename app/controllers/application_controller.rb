# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
    include FastGettext::Translation 
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :set_toppings, :set_gettext_locale, :correct_safari_and_ie_accept_headers
  include AuthenticatedSystem

  layout "main"

  protected

  def set_toppings
    # set variables which needed everywhere
  end

  def set_gettext_locale
    FastGettext.text_domain = 'app'
    FastGettext.available_locales = ['en','hu'] #all you want to allow
    super
  end

  def correct_safari_and_ie_accept_headers
    request.accepts.sort!{ |x, y| y.to_s == 'text/javascript' ? 1 : -1 } if request.xhr?
  end

end
