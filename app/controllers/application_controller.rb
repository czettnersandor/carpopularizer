# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :set_toppings, :set_gettext_locale
  include AuthenticatedSystem

  layout "main"

  def set_toppings
    # set variables which needed everywhere
    @proba = "HELLO"
  end

  def set_gettext_locale
    FastGettext.text_domain = 'boxutca'
    FastGettext.available_locales = ['en','hu'] #all you want to allow

    FastGettext.locale = 'hu'
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
